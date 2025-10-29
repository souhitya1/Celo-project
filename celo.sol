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
