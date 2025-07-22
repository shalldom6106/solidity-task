// SPDX-License-Identifier: MIT
pragma solidity ^0.8;


contract reverseStr{
///反转一个字符串。输入 "abcde"，输出 "edcba"
function reverse(string memory s) public pure returns (string memory){
    uint len = bytes(s).length;
    bytes memory b = new bytes(len);
    for (uint i = 0; i < len; i++) {
        b[i] = bytes(s)[len - 1 - i];
    }
    return string(b);
}
}