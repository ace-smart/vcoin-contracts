pragma solidity 0.4.24;

import "../IBlockReward.sol";
import "../libraries/SafeMath.sol";


contract BlockReward is IBlockReward {
    using SafeMath for uint256;

    uint256 public mintedCoins = 0;

    function () external payable {
    }

    function addExtraReceiver(uint256 _amount, address _receiver) external {
        require(_amount > 0);
        require(_receiver != address(0));
        mintedCoins = mintedCoins.add(_amount);
        _receiver.transfer(_amount);
    }

    function totalMintedCoins() public view returns (uint256) {
        return mintedCoins;
    }
}
