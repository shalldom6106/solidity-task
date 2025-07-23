// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract intToRoman{
    uint[13] public  values = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1];
    string[13] public  symbols = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"];
    function inToRoman(uint num) public view returns (string memory) {
        string memory roman;
        for (uint i = 0; i < values.length; i++) {
            // 将当前的符号添加到结果中直到num小于该符号对应的值
            while (num >= values[i]) {
                roman = string(abi.encodePacked(roman, symbols[i]));
                num -= values[i];
            }
        }
        return roman;
    }
}