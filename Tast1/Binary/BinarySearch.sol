// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract binarySearch {
    uint256 public findIndex;

    uint256 start;
    uint256 end;

    function searchNumber(uint256[] memory arr, uint256 num) public {
        // Set the starting and ending indices of the range to search through
        start = 0;
        end = arr.length - 1;

        // While the range still has elements in it, keep searching
        binarySearchNumber(arr, num);
    }

    function binarySearchNumber(
        uint256[] memory arr,
        uint256 num
    ) private {
        while (start <= end) {
            uint256 middle = (start + end) / 2;

            if ((arr[middle] == num)) {
                findIndex = middle;
                return;
            } else if (arr[start] < num) {
                start = start + 1;
                binarySearchNumber(arr, num);
            } else {
                end = end - 1;
                binarySearchNumber(arr, num);
            }
        }
    }
}
