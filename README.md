# 🛡️ Private Certificate Checker

A cryptography-first, privacy-preserving framework for issuing, verifying, and revoking digital credentials on-chain—without revealing personal information or certificate contents.

---

## 📖 Project Description
The Private Certificate Checker smart contract is a secure credential verification system built on Ethereum. Using hashed zk-based proofs, trusted issuers (aka "scribes") can issue and revoke certificates tied to an address, while users can independently prove certificate validity through hashed representations—no plaintext or private data exposed.

---

## 🎯 Project Vision
To build a transparent yet privacy-centric ecosystem for trustless credential issuance. The aim is to enable zero-knowledge-like validations for job qualifications, academic records, or skill proofs—without compromising user confidentiality.

---

## ✨ Key Features
- 📍 **Trusted Issuers**: Only verified entities may grant or revoke certificates.
- 🔐 **zk-Hashed Echoes**: Zero-knowledge-style hashes anchor each credential.
- 🧬 **Echo Revocation**: Issuers can deactivate certificates without erasing history.
- 🧊 **Silent Session IDs**: One-time identifiers enable anonymous on-chain signaling.
- 🔁 **Fuzzy Hash Matching**: Experimental logic for approximate zk-hash comparisons.
- 🔏 **Note Obfuscation**: Internal hashed memo system for off-chain tracing.

---

## 🧭 Future Scope
- zk-SNARKs/zk-STARKs integration for full off-chain zero-knowledge proof support
- ENS & DID support for verifiable decentralized identities
- Revocation registry improvements with Merkle proof batching
- Multi-language and mobile wallet UI tooling

---

## 🔍 Contract Details
- **Contract Name:** `ZenoHash` (formerly "SkillProof")
- **Compiler Version:** Solidity ^0.8.21
- **Core Functions:**
  - `listScribe(address)`: Assigns a trusted certificate issuer
  - `etchEcho(address, bytes32)`: Issues a private certificate
  - `banishEcho(address)`: Revokes a certificate silently
  - `revealEcho(address)`: Retrieves anonymized cert data
  - `silentSignal(address)`: Creates ephemeral zk-proof IDs
  - `murmur(bytes)`: Obfuscates issuer commentary
  - `proximity(bytes32, bytes32)`: Measures “closeness” of zk-hashes
- **Roles:** `curator` (admin), `scribes` (issuers)
- **Data Privacy:** No names, emails, or cert types stored—only proof hashes

---

> “Credentials without exposure. Trust without disclosure.”  
> — Private Certificate Checker

Contract Address:0x7A075501E56a110C5B8CF572D833344550efFF3E


![image](https://github.com/user-attachments/assets/9c1df719-ffd4-4b20-a986-67fa58e7c8bf)
