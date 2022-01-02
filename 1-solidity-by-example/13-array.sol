// SPDX-License-Identifier: GNU GPL v3
pragma solidity ^0.8.10;

// Arrays can a fixed size or dynamic size
// Arrays are 0 indexed just like many like prog languages

contract Array {
    // multiple ways to initialize an array
    uint[] public arr1;
    uint[] public arr2 = [1,2,3];
    uint[10] public fixedSizeArr; //fixed size array = all elements init to 0

    function getValue(uint i) public view returns (uint) {
        // Square bracket notation to get value from array
        // similar to python and many other programming languages
        return arr1[i];
    }

    function getArr() public view returns (uint[] memory) {
        /*
        Solidity can return entire array
        NOTE: Should be avoided!!! 
            because arrays can grow indefinitely in length
        TODO: Learn what does "memory" modifier do?
        */

        return arr1;
    }

    function push(uint i) public {
        // Append to array
        arr1.push(i);
    }

    function pop() public {
        //remove last item from array
        arr1.pop();
    }

    function getLength() public view returns (uint) {
        return arr1.length;
    }

    function remove(uint index) public {
        // Delete does not change array length
        // Just resets value at index to default value
        delete arr1[index];
    }

    // TODO: What does function modifier "external" do?
    function examples() external {
        /* 
        creates an array in memory
            - only fixed size can be created
        TODO: Does this create an array and save it in memory?
        */

        uint[] memory a = new uint[](5);
    }

}

contract ArrayRemoveByShifting {
    /*
    Remove array element by shifting elements from right to left

    Given: array [1,2,3] 
    Objective: we want to remove item at index 1
    Procedure:
        - Copy left all items after index 1 ([1,3,3])
        - then pop last item of array ([1,3])
    */
    uint[] public arr = [1,2,3];

    function remove(uint index) public {
        // TODO: what does require do?
        require(index < arr.length, "index to remove greater than length of array");

        for(uint i=index; i < arr.length -1; i++) {
            arr[i] = arr[i+1];
        }
        arr.pop();
    }

    function test() external {
        arr = [1,2,3,4,5,6];

        remove(2);  // [1,2,4,5,6]

        assert(arr[0] == 1);
        assert(arr[1] == 2);
        assert(arr[2] == 4);
        assert(arr[3] == 5);
        assert(arr[4] == 6);
        assert(arr.length == 5);

        arr = [1];
        remove(0); // []
        assert(arr.length == 0);
    }

}


contract ArrayReplaceFromEnd {
    uint[] public arr = [1,2,3,4];

    /*
    Remove array element by copying last element into to the place to remove

    Given: array [1,2,3,4]
    Objective: we want to remove item at index 1
    Procedure:
        - Deleting an element creates a gap in the array.        
        - we can keep array dense/compact by
                move the last element into the place to delete.

    NOTE: Only works If the order of array doesnt matter to us
    */

    function remove(uint index) public {
        // Move the last element into the index to be removed
        arr[index] = arr[arr.length - 1];
        // Remove the last element
        arr.pop();
    }

    function test() public {
        arr = [1, 2, 3, 4];

        remove(1);
        // [1, 4, 3]
        assert(arr.length == 3);
        assert(arr[0] == 1);
        assert(arr[1] == 4);
        assert(arr[2] == 3);

        remove(2);
        // [1, 4]
        assert(arr.length == 2);
        assert(arr[0] == 1);
        assert(arr[1] == 4);
    }
}