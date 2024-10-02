// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract TokenStaking is Ownable {
    IERC20 public stakingToken;
    uint256 public rewardRate;
    mapping(address => uint256) public stakingBalance;
    mapping(address => uint256) public lastUpdateTime;
    mapping(address => uint256) public rewards;

    constructor(address _stakingToken, uint256 _rewardRate) {
        stakingToken = IERC20(_stakingToken);
        rewardRate = _rewardRate;
    }

    function stake(uint256 amount) public {
        require(amount > 0, "Cannot stake 0 tokens");
        stakingBalance[msg.sender] += amount;
        lastUpdateTime[msg.sender] = block.timestamp;
        stakingToken.transferFrom(msg.sender, address(this), amount);
    }

    function calculateReward(address user) public view returns (uint256) {
        uint256 stakedTime = block.timestamp - lastUpdateTime[user];
        return stakingBalance[user] * stakedTime * rewardRate / 1e18;
    }

    function withdraw() public {
        uint256 reward = calculateReward(msg.sender);
        rewards[msg.sender] += reward;
        stakingBalance[msg.sender] = 0;
        stakingToken.transfer(msg.sender, reward);
    }

    function updateRewardRate(uint256 newRate) public onlyOwner {
        rewardRate = newRate;
    }
}
