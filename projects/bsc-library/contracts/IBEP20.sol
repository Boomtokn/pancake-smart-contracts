// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @title IBEP20
 * @dev Interface for BEP-20 token standard as defined by Binance Smart Chain.
 */
interface IBEP20 {
    /**
     * @dev Returns the total supply of tokens.
     */
    function totalSupply() external view returns (uint256);

    /**
     * @dev Returns the token decimals.
     */
    function decimals() external view returns (uint8);

    /**
     * @dev Returns the token symbol.
     */
    function symbol() external view returns (string memory);

    /**
     * @dev Returns the token name.
     */
    function name() external view returns (string memory);

    /**
     * @dev Returns the address of the token owner (deployer).
     */
    function getOwner() external view returns (address);

    /**
     * @dev Returns the balance of a given account.
     * @param account The address of the account.
     */
    function balanceOf(address account) external view returns (uint256);

    /**
     * @dev Transfers `amount` tokens to the specified `recipient`.
     * @param recipient The address receiving the tokens.
     * @param amount The number of tokens to transfer.
     * @return A boolean indicating success.
     *
     * Emits a {Transfer} event.
     */
    function transfer(address recipient, uint256 amount) external returns (bool);

    /**
     * @dev Returns the remaining allowance for a `spender` on behalf of an `owner`.
     * @param owner The address of the token owner.
     * @param spender The address of the spender.
     * @return The remaining number of tokens the spender is allowed to use.
     */
    function allowance(address owner, address spender) external view returns (uint256);

    /**
     * @dev Approves `spender` to transfer `amount` tokens on behalf of the caller.
     * @param spender The address allowed to transfer tokens.
     * @param amount The number of tokens to approve.
     * @return A boolean indicating success.
     *
     * Emits an {Approval} event.
     */
    function approve(address spender, uint256 amount) external returns (bool);

    /**
     * @dev Transfers `amount` tokens from `sender` to `recipient` using the allowance mechanism.
     * The `amount` is then deducted from the caller's allowance.
     * @param sender The address sending the tokens.
     * @param recipient The address receiving the tokens.
     * @param amount The number of tokens to transfer.
     * @return A boolean indicating success.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);

    /**
     * @dev Emitted when `value` tokens are moved from `from` to `to`.
     */
    event Transfer(address indexed from, address indexed to, uint256 value);

    /**
     * @dev Emitted when an allowance of `spender` for an `owner` is set by {approve}.
     */
    event Approval(address indexed owner, address indexed spender, uint256 value);
}
