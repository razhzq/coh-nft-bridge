pragma solidity ^0.8.17;


import "@openzeppelin/contracts/token/ERC721/IERC721Receiver.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/access/Ownable.sol";


contract Custody is ReentrancyGuard, Ownable {

    uint256 public fees = 0.0000075 ether;
    

    struct CustodyData {
        address nftContract;
        uint tokenId;
        address owner;
    }

    mapping(uint => CustodyData) public holdCustody;

    event NFTCustody (
        uint indexed tokenId,
        address holder
    );

    constructor() {

    }


    function depositNFT(address _nft_contract, uint _tokenId) public payable nonReentrant {
        require(msg.value == fees);
        require(IERC721(_nft_contract).ownerOf(_tokenId) == msg.sender);
        require(holdCustody[_tokenId].tokenId == 0);
        IERC721(_nft_contract).transferFrom(msg.sender, address(this), _tokenId);
        holdCustody[_tokenId] = CustodyData(_nft_contract, _tokenId, msg.sender);
    }

    function releaseNFT(uint _tokenId) public onlyOwner {

    }

     function onERC721Received(
        address,
        address from,
        uint256,
        bytes calldata
    ) external pure returns (bytes4) {
      require(from == address(0x0), "Cannot Receive NFTs Directly");
      return IERC721Receiver.onERC721Received.selector;
    }

}