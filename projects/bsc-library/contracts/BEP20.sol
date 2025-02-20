// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./IBEP20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

/**
 * @title BEP20
 * @dev Implementation of the BEP-20 token standard.
 */
contract BEP20 is IBEP20, Ownable {
    using SafeMath for uint256;

    string private _name;
    string private _symbol;
    uint8 private _decimals;
    uint256 private _totalSupply;
    address private _owner;

    mapping(address => uint256) private _balances;
    mapping(address => mapping(address => uint256)) private _allowances;

    /**
     * @dev Initializes the token with name, symbol, decimals, and initial supply.
     * @param name_ Token name
     * @param symbol_ Token symbol
     * @param decimals_ Number of decimal places
     * @param initialSupply_ Initial token supply (minted to deployer)
     */
    constructor(
        string memory name_,
        string memory symbol_,
        uint8 decimals_,
        uint256 initialSupply_
    ) {
        _name = name_;
        _symbol = symbol_;
        _decimals = decimals_;
        _totalSupply = initialSupply_ * (10 ** uint256(decimals_));
        _owner = msg.sender;

        _balances[msg.sender] = _totalSupply;
        emit Transfer(address(0), msg.sender, _totalSupply);
    }

    // **Token Details**
    function name() external view override returns (string memory) {
        return _name;
    }

    function symbol() external view override returns (string memory) {
        return _symbol;
    }

    function decimals() external view override returns (uint8) {
        return _decimals;
    }

    function totalSupply() external view override returns (uint256) {
        return _totalSupply;
    }

    function getOwner() external view override returns (address) {
        return _owner;
    }

    // **Balance & Allowance**
    function balanceOf(address account) external view override returns (uint256) {
        return _balances[account];
    }

    function allowance(address owner, address spender) external view override returns (uint256) {
        return _allowances[owner][spender];
    }

    // **Token Transfers**
    function transfer(address recipient, uint256 amount) external override returns (bool) {
        _transfer(msg.sender, recipient, amount);
        return true;
    }

    function approve(address spender, uint256 amount) external override returns (bool) {
        _approve(msg.sender, spender, amount);
        return true;
    }

    function transferFrom(address sender, address recipient, uint256 amount) external override returns (bool) {
        require(_allowances[sender][msg.sender] >= amount, "BEP20: Transfer amount exceeds allowance");
        _approve(sender, msg.sender, _allowances[sender][msg.sender].sub(amount));
        _transfer(sender, recipient, amount);
        return true;
    }

    // **Internal Functions**
    function _transfer(address sender, address recipient, uint256 amount) internal {
        require(sender != address(0), "BEP20: Transfer from zero address");
        require(recipient != address(0), "BEP20: Transfer to zero address");
        require(_balances[sender] >= amount, "BEP20: Transfer amount exceeds balance");

        _balances[sender] = _balances[sender].sub(amount);
        _balances[recipient] = _balances[recipient].add(amount);

        emit Transfer(sender, recipient, amount);
    }

    function _approve(address owner, address spender, uint256 amount) internal {
        require(owner != address(0), "BEP20: Approve from zero address");
        require(spender != address(0), "BEP20: Approve to zero address");

        _allowances[owner][spender] = amount;
        emit Approval(owner, spender, amount);
    }

    // **Minting & Burning**
    function mint(uint256 amount) external onlyOwner {
        _totalSupply = _totalSupply.add(amount);
        _balances[msg.sender] = _balances[msg.sender].add(amount);
        emit Transfer(address(0), msg.sender, amount);
    }

    function burn(uint256 amount) external {
        require(_balances[msg.sender] >= amount, "BEP20: Burn amount exceeds balance");
        _balances[msg.sender] = _balances[msg.sender].sub(amount);
        _totalSupply = _totalSupply.sub(amount);
        emit Transfer(msg.sender, address(0), amount);
    }
}
