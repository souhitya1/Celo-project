# 🧱 BlockdareBasic

> A simple Solidity smart contract that creates an **immutable on-chain challenge record** system — built for fair play, transparency, and verifiable history.

---


![Uploading image.png…]()


## 📖 Project Description

**BlockdareBasic** is a minimal yet powerful smart contract written in Solidity that allows users to record and view challenges on the blockchain.  
Each challenge entry includes who submitted it, a short description, and a timestamp — all permanently stored and visible to everyone.

This contract is designed as an introductory project for learning how to deploy and interact with smart contracts while also providing a practical use case for fair competition logs.

---

## 💡 What It Does

- Lets anyone submit a **challenge record** with a short description.  
- Stores the data **permanently** on-chain (immutable).  
- Allows public viewing of all stored challenges.  
- Emits an event every time a new challenge is recorded — making it easy to track new entries in real time.

---

## ✨ Features

- 🧾 **Add Challenges** — Record your achievement or match result with a simple function call.  
- ⏰ **Timestamped Entries** — Every record includes an automatic blockchain timestamp.  
- 🔒 **Immutable Data** — Once added, no one (not even the contract owner) can modify or delete entries.  
- 🌍 **Fully Transparent** — Anyone can read or verify challenges directly on the blockchain.  
- ⚡ **Lightweight & Gas Efficient** — Compact design for low-cost transactions and easy deployment.  

---

## 🌐 Deployed Smart Contract

> **Network:** Celo Sepolia Testnet  
> **Contract Address:** [`0xF1F8A4aDbDEEd6e46D99750499779baE870F94e7`](https://celo-sepolia.blockscout.com/address/0xF1F8A4aDbDEEd6e46D99750499779baE870F94e7)  
> **Explorer:** [Celo Blockscout](https://celo-sepolia.blockscout.com)

You can view all transactions, emitted events, and storage directly on the link above.

---

## 🧠 Smart Contract Code

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract BlockdareBasic {
    uint256 public challengeCount;

    struct Challenge {
        uint256 id;
        address reporter;
        string description;
        uint256 timestamp;
    }

    Challenge[] public challenges;

    event ChallengeRecorded(uint256 id, address reporter, string description, uint256 timestamp);

    function addChallenge(string calldata _description) external {
        challengeCount++;
        challenges.push(Challenge(challengeCount, msg.sender, _description, block.timestamp));
        emit ChallengeRecorded(challengeCount, msg.sender, _description, block.timestamp);
    }

    function getChallenge(uint256 _id) external view returns (Challenge memory) {
        require(_id > 0 && _id <= challengeCount, "Invalid ID");
        return challenges[_id - 1];
    }
}
