pragma solidity ^0.8.17;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract Bridge is ERC721URIStorage, Ownable {

    using Strings for uint256;

    mapping(address => uint256[]) tokensOwned;

    constructor() ERC721("BridgeNFT", "BRIDGE") {
   
    }

    function bridgeMint(address _to, uint256 _tokenId, string memory _tokenURI) public virtual onlyOwner() {
        _mint(_to, _tokenId);
        _setTokenURI(_tokenId, _tokenURI);
        tokensOwned[_to].push(_tokenId);
    }

    function tokenOfOwner(address _owner) public view returns (uint256[] memory) {
          return tokensOwned[_owner];
    }

    function getTokenURI(uint256 tokenId) public view virtual returns (string memory) {
        return tokenURI(tokenId);

    }



}