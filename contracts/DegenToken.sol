// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DegenToken is ERC20, ERC20Burnable, Ownable {
    struct Prize {
        string name;
        uint256 cost;
        bool redeemed;
    }

    Prize[] private prizes;

    constructor() ERC20("DegenToken", "DGN") {
        // Add predefined items to the store
        prizes.push(Prize("Item 1", 1, false));
        prizes.push(Prize("Item 2", 2, false));
        prizes.push(Prize("Item 3", 3, false));
    }
     // Event emitted when a prize is successfully redeemed
    event PrizeRedeemed(address indexed account, string prizeName, uint256 prizeCost, string customMessage);

    // Function to show the available store items (prizes)
    function getStoreItems() external view returns (Prize[] memory) {
        return prizes;
    }

    // Function to redeem a prize with the specified index
    function redeemPrize(uint256 prizeIndex) external {
        address sender = _msgSender();
        require(prizeIndex < prizes.length, "Invalid prize index!");

        Prize storage prize = prizes[prizeIndex];
        require(!prize.redeemed, "Prize has already been redeemed!");
        require(balanceOf(sender) >= prize.cost, "Insufficient balance to redeem the prize!");

        // Perform the deduction of the prize cost from the user's balance
        _burn(sender, prize.cost);

        // Mark the prize as redeemed
        prize.redeemed = true;

        // Emit an event to indicate successful prize redemption
        emit PrizeRedeemed(sender, prize.name, prize.cost, "Redeem Sucessfull");

    }

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
