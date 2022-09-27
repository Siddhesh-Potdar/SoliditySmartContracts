// SPDX-License-Identifier:UNLICENSED
pragma solidity ^0.8.4;

import "erc721a/contracts/ERC721A.sol";

contract NFTBatch is ERC721A {
  constructor() ERC721A("Simpo", "SID") {}
  function mint(uint256 quantity) external payable {
    _safeMint(msg.sender, quantity);
  }
}
