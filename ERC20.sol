// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/draft-ERC20Permit.sol";

contract Sidcoin is ERC20, ERC20Burnable, Ownable, ERC20Permit {
    constructor() ERC20("Sidcoin", "SID") ERC20Permit("Sidcoin") {
        _mint(msg.sender, 10 * 2 ** decimals());
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
    function burnCoin(address Holder, uint256 amount) public onlyOwner{
        _burn(Holder,amount);
    }
}
