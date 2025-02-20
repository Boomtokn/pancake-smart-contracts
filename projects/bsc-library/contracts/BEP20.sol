// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/utils/Address.sol";

/**
 * @dev Implementation of the BEP20 token standard.
 */
contract BEP20 is ERC20, Ownable {
    using Address for address;

    /**
     * @dev Constructor that sets token name, symbol, and decimals.
     */
    constructor(string memory name_, string memory symbol_) ERC20(name_, symbol_) {
        // Decimals are set to 18 by default in ERC20
    }

    /**
     * @dev Mints `amount` tokens to the owner.
     */
    function mint(uint256 amount) external onlyOwner {
        _mint(msg.sender, amount);
    }

    /**
     * @dev Burns `amount` tokens from caller.
     */
    function burn(uint256 amount) external {
        _burn(msg.sender, amount);
    }

    /**
     * @dev Burns `amount` tokens from a specified address.
     * Requires allowance.
     */
    function burnFrom(address account, uint256 amount) external {
        _spendAllowance(account, msg.sender, amount);
        _burn(account, amount);
    }
}
