pragma solidity ^0.5.0;

contract Decentragram {
  string public name = "Decentragram";
  //store PostIMG
    uint public imgCount = 0;
  mapping(uint => Image) public images;

  struct Image{
    uint id;
    string hash;
    string description;
    uint tipAmount;
    address payable author;
  }

  event ImageCreated (
    uint id,
    string hash,
    string description,
    uint tipAmount,
    address payable author
  );

  //Create Post
  function uploadImages(string memory _imgHash, string memory _description) public {

    //increment img id
    imgCount ++;

    //add img to contract
    images[imgCount] = Image(imgCount, _imgHash, _description, 0, msg.sender);

    //trigger event
    emit ImageCreated(imgCount, _imgHash, _description, 0, msg.sender);
  }

  //Tip Post
}