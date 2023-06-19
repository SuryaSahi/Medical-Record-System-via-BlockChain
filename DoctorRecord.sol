// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract DoctorRecord {

    mapping(address => Doctor) public doctors;

    struct Doctor {
        string name;
        uint256 id;
        uint256 age;
        string contact;
        string specification;
    }

    event DoctorRegistered(address indexed doctorAddress, uint256 id, uint256 age, string name, string specification, string contact);

    function registerDoctor(uint256 _id, uint256 _age, string memory _name, string memory _specification, string memory _contact) public {
        require(doctors[msg.sender].id == 0, "Doctor already registered");

        Doctor memory newDoctor = Doctor(_name, _id, _age, _contact, _specification);
        doctors[msg.sender] = newDoctor;

        emit DoctorRegistered(msg.sender, _id, _age, _name, _specification, _contact);
    }

    function getDoctor(address _doctorAddress) public view returns (uint256 id, string memory name, string memory specification, string memory contact) {
        Doctor memory doctor = doctors[_doctorAddress];
        require(doctor.id != 0, "Doctor not found");

        return (doctor.id, doctor.name, doctor.specification, doctor.contact);
    }

}
