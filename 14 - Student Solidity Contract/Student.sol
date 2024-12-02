// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StudentData {
    struct Student {
        uint id;
        string name;
        uint age;
        string course;
    }

    Student[] public students; // Array to store student records
    uint public studentCount = 0;

    // Function to add a new student
    function addStudent(string memory _name, uint _age, string memory _course) public {
        studentCount++;
        students.push(Student(studentCount, _name, _age, _course));
    }

    // Function to retrieve a student's data by ID
    function getStudent(uint _id) public view returns (uint, string memory, uint, string memory) {
        require(_id > 0 && _id <= studentCount, "Student ID out of range");
        Student memory student = students[_id - 1];
        return (student.id, student.name, student.age, student.course);
    }

    // Fallback function to handle unexpected transactions
    fallback() external payable {}

    // Receive function to handle direct Ether transfers
    receive() external payable {}

    // Function to check the balance of the contract
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}
