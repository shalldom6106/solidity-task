// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

//创建一个名为Voting的合约
contract Voting{
    // 定义一个mapping来存储候选人的得票数
    mapping (address => uint) public voteMapping;
    //候选人的地址数组
    address[] public personArr;
    // vote函数，允许用户投票给某个候选人
    function vote(address personAddr) public {
        require(isValidPersonAddr(personAddr), "person is not valid.");
        voteMapping[personAddr]++;
    }
    //getVotes函数，返回某个候选人的得票数
    function getVotes(address personAddr) public view returns (uint){
        require(isValidPersonAddr(personAddr),"person is not valid.");
        return voteMapping[personAddr];
    }
    //resetVotes函数，重置所有候选人的得票数
    function resetVotes() public {
        for (uint i=0; i < personArr.length; i++) {
            voteMapping[personArr[i]]=0;
        }
    }

    //判断是否候选人的地址
    function isValidPersonAddr(address addr)public view returns (bool){
        for (uint i=0; i < personArr.length; i++) {
            if (personArr[i]==addr){
                return true;
            }
        }
        return false;
    }
}

