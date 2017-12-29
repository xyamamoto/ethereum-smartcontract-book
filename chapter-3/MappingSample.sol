pragma solidity ^0.4.19;

contract MappingSample {
    struct User {
        string name;
        uint age;
    }

    mapping(address => User) public userList; // valueを構造体(User)とします

    function setUser(string _name, uint _age) public {
        // keyを指定してアクセスします
        userList[msg.sender].name = _name;
        userList[msg.sender].age = _age;
    }

    function getUser() public view returns (string, uint) {
        User storage u = userList[msg.sender];
        return (u.name, u.age);
    }
}