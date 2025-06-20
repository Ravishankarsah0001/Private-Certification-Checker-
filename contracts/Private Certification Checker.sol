// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

/**
 * @title ZenoHash
 * @author ⊶
 * @notice For those who prove without revealing, and reveal without showing.
 */
contract ZenoHash {
    address public curator;

    struct Echo {
        bytes32 zkSeed;
        uint64 etchedAt;
        bool present;
    }

    mapping(address => Echo) private echoes;
    mapping(address => bool) public scribes;

    constructor() {
        curator = msg.sender;
    }

    modifier onlyCurator() {
        require(msg.sender == curator, "Denied: Not curator");
        _;
    }

    modifier onlyScribe() {
        require(scribes[msg.sender], "Denied: Not a listed scribe");
        _;
    }

    /// Function 1: Assign a scribe (issuer) who can etch echoes
    function listScribe(address scribeAddr) external onlyCurator {
        scribes[scribeAddr] = true;
    }

    /// Function 2: Etch a zk-hash echo onto the chain for a soul
    function etchEcho(address soul, bytes32 zkSeed) external onlyScribe {
        echoes[soul] = Echo({
            zkSeed: zkSeed,
            etchedAt: uint64(block.timestamp),
            present: true
        });
    }

    /// Function 3: Banish an echo (aka revoke a certificate)
    function banishEcho(address soul) external onlyScribe {
        require(echoes[soul].present, "No echo etched");
        echoes[soul].present = false;
    }

    /// Function 4: Retrieve echo metadata—if you dare
    function revealEcho(address soul) external view returns (bytes32, uint64, bool) {
        Echo memory e = echoes[soul];
        return (e.zkSeed, e.etchedAt, e.present);
    }

    /// Function 5: Generate a silentSignal ID for anonymous zk work
    function silentSignal(address soul) external view returns (bytes32) {
        return keccak256(abi.encodePacked(soul, block.number, address(this)));
    }

    /// Function 6: Obfuscate origin text—used for internal note signing
    function murmur(bytes memory verse) external pure returns (bytes32) {
        return keccak256(verse);
    }

    /// Function 7: Philosophical proximity checker—how “close” are two echoes?
    function proximity(bytes32 a, bytes32 b) public pure returns (bool) {
        uint256 fuzz = uint256(a) ^ uint256(b);
        return fuzz < 2 ** 199; // Arbitrary threshold. Why? Ask Zeno.
    }
}

