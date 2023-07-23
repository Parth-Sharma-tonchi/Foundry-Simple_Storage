//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {SimpleStorage} from "../src/SimpleStorage.sol";

contract TestSimpleStorage is Test {

    SimpleStorage simpleStorage;

    function setUp() external {
        simpleStorage = new SimpleStorage();
    }

    function testStore() public {
        simpleStorage.store(7);
        assertEq(simpleStorage.getMyFavoriteNumber(), 7);
    }

    function testRetrieve() public {
        //arrange
        simpleStorage.store(7);
        //Act and assert
        assertEq(simpleStorage.retrieve(), 7);
    }

    function testAddPeopleFunction() public {
        //Arrange
        string memory name = "parth";
        uint256 fav_num = 10;
         
        //Act 
        simpleStorage.addPerson(name, fav_num);

        //Assert 
        assertEq(simpleStorage.getNumOfPeople(), 1);
        assertEq(simpleStorage.getNameToFavoriteNumber("parth"), 10);
    }
}