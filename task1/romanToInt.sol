// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract romanToInt{
    mapping(bytes1 => uint16) romanValues;
    constructor() {
        //初始化单个罗马字符映射到数值
        romanValues["I"] = 1;
        romanValues["V"] = 5;
        romanValues["X"] = 10;
        romanValues["L"] = 50;
        romanValues["C"] = 100;
        romanValues["D"] = 500;
        romanValues["M"] = 1000;
    }
    //将罗马数字转为整数
    function romanToIntFunc(string memory roman) public view returns (uint) {
        bytes memory strBytes = bytes(roman);
        uint num = 0;
        for (uint i = 0; i < strBytes.length; i++) {
            uint currentValue = romanValues[strBytes[i]];
            uint16 nextValue;
            if (i < strBytes.length - 1) {
                nextValue = romanValues[strBytes[i+1]];
            }

            if (currentValue > nextValue) {
                num += currentValue;
            } else {
                num -= currentValue;
            }
        }
        return num;
    }
}