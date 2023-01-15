//SPDX-License-Identifier:Unlicensed
pragma solidity ^0.8.0;

contract Drive{

    uint256 public totalUsers;
    uint256 public totalFiles;
    mapping(address=>string[]) public uploads;
    mapping(string=>uint256) fileToIndex;

    constructor(){
        totalUsers=0;
        totalFiles=0;
    }

    //uploads a fileData to blockchain
    function uploadFile(string memory _fileUrl) external{
        string[] storage temp = uploads[msg.sender];
        if(temp.length==0)totalUsers++;
        temp.push(_fileUrl);
        uploads[msg.sender] = temp;
        totalFiles++;
    }

    //fetches all the files uploaded by user
    function getFile() external view returns(string[] memory){
        return uploads[msg.sender];
    }

    //deletes the file
    function deleteFile(string memory _fileUrl) external{
        string[] storage temp = uploads[msg.sender];
        delete temp[fileToIndex[_fileUrl]];
        totalFiles--;
    } 

    function getTotalUsers() external view returns(uint256){
        return totalUsers;
    }

    function getTotalFiles() external view returns(uint256){
        return totalFiles;
}
}
