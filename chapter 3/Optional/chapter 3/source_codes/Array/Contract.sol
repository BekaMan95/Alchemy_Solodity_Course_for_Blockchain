// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Contract {

    function count(uint[] calldata arr) view public returns (uint) {
        uint val = 0;
        for(uint i = 0; i < arr.length; i++) {
            if(arr[i] % 2 == 0) val++;
        }
        return val;
    }

    function filterEven(uint[] calldata arr) view external returns(uint[] memory) {
        uint len = this.count(arr);
        uint[] memory evens = new uint[](len);
        uint ptr = 0;
        for(uint idx = 0; idx < arr.length; idx++) {
            if(arr[idx] % 2 == 0) {
                evens[ptr] = arr[idx];
                ptr++;
            }
        }
        return evens;
    }
}
