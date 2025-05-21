// SPDX-License-Identifier: MIT
pragma solidity ^0.8;
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract MyNTF is ERC721 {


    //合约地址：0x6FeaaA99540876F76067c207942b898E09767F14
    //部署地址：0xe77B6F2668092dc235C2612aABc0D82680B53e8D
    //交易：https://sepolia.etherscan.io/tx/0xef46652cd397dcff30d3aa9db80b5737469050f4743ba015d27bfc89a1c43c53

    constructor() ERC721("NTF", "MIT") {}

    mapping(uint256 => string) private _tokenURIS;

    function mintNTF(
        address to,
        uint256 tokenId,
        string memory myTokenURI
    ) public  {
        // if (to == address(0)) {
        //     revert ERC721InvalidReceiver(address(0));
        // }
        // address previousOwner = _update(to, tokenId, address(0));
        // if (previousOwner != address(0)) {
        //     revert ERC721InvalidSender(address(0));
        // }
        _tokenURIS[tokenId] = myTokenURI;
        _safeMint(to, tokenId);
        
    }

    function tokenURI(uint256 tokenId)
        public
        view
        override
        returns (string memory)
    {
        return _tokenURIS[tokenId];
    }
}
