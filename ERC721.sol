// SPDX-License-Identifier:UNLICENSED

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Burnable.sol";


contract Firstnft is ERC721,ERC721Burnable {
     constructor() ERC721("Firstnft", "SID") {}
    uint tokenId;
    mapping(address=>tokenMetaData[]) public ownershipRecord;

    struct tokenMetaData {
        uint tokenId;
        uint timeStamp;
        string tokenURI;
    }

    function mintToken(address recipient, string memory url) public {
        _safeMint(recipient, tokenId);
        ownershipRecord[recipient].push(tokenMetaData(tokenId, block.timestamp, url));
        tokenId = tokenId + 1;
    }

     function burnToken(uint _tokenId) public  {
        //solhint-disable-next-line max-line-length
        require(_isApprovedOrOwner(_msgSender(), tokenId), "ERC721: caller is not token owner nor approved");
        _burn(_tokenId);
    }
