// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DegenToken is ERC20, ERC20Burnable, Ownable {
    constructor() ERC20("DegenToken", "DGN"){}

    function mint(address recipient, uint256 amount) external onlyOwner{
        _mint(recipient, amount);
    }
    function transfer(address recipient, uint256 amount) public override returns (bool) {
        require(amount > 0, "Amount must be greater than zero!");
        _transfer(_msgSender(), recipient, amount);
        return true;
    }
    function redeem(uint256 amount) external {
        require(amount > 0, "Amount must be greater than zero!");
        _burn(_msgSender(), amount);
    }
    function checkBalance(address account) external view returns (uint256){
        return balanceOf(account);
    }
}