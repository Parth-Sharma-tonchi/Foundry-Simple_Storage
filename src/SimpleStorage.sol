// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

// pragma solidity ^0.8.0;
// pragma solidity >=0.8.0 <0.9.0;

contract SimpleStorage {
    uint256 private s_myFavoriteNumber;

    struct Person {
        uint256 favoriteNumber;
        string name;
    }
    // uint256[] public anArray;

    Person[] private s_listOfPeople;

    mapping(string => uint256) private s_nameToFavoriteNumber;

    function store(uint256 _favoriteNumber) public {
        s_myFavoriteNumber = _favoriteNumber;
    }

    function retrieve() public view returns (uint256) {
        return s_myFavoriteNumber;
    }

    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        s_listOfPeople.push(Person(_favoriteNumber, _name));
        s_nameToFavoriteNumber[_name] = _favoriteNumber;
    }

    function getNameToFavoriteNumber(string memory name) public view returns(uint256){
        return s_nameToFavoriteNumber[name];
    }

    function getPeople(uint256 index) public view returns(Person memory){
        return s_listOfPeople[index];
    }

    function getMyFavoriteNumber() public view returns(uint256){
        return s_myFavoriteNumber;
    }
    function getNumOfPeople() public view returns(uint256){
        return s_listOfPeople.length;
    }
}
