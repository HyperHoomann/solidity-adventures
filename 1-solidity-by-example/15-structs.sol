// SPDX-License-Identifier: GNU GPL v3
pragma solidity ^0.8.10;

contract TodoList {
    struct Todo {
        string text;
        bool completed;
    }

    // an array of 'Todo' structs
    Todo[] public todos;

    function create(string memory _text) public {
        // 3 ways to initialize a struct:
        
        // 1. calling it like a function
        todos.push(Todo(_text, false));

        // 2. passing parameters as dict (key value mapping)
        todos.push(Todo({text:_text, completed: false}));

        // 3. initialize an empty struct and then update it
        Todo memory newtodo;
        newtodo.text = _text;
        // newtodo.completed defaults to false 
        todos.push(newtodo);
    }

    function get(uint _index) public view returns (string memory text, bool completed) {
        /* 
        Solidity will automatically create a getter for todos array
            So we dont really need to create this function
        TODO: what is "storage" modifier ?
        */
        
        Todo storage todo = todos[_index];
        return (todo.text, todo.completed);
    }

    function updateText(uint _index, string memory _text) public {
        Todo storage todo = todos[_index];
        todo.text = _text;
    }

    function toggleCompleted(uint _index) public {
        Todo storage todo = todos[_index];
        todo.completed = !todo.completed;
    }
}

import "./utils/StructDeclaration.sol";

contract ImportedStruct {
    // An array of DailyTodo structs
    DailyTodo[] public todos;
}