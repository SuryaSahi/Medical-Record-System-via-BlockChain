// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract PatientMedicalRecords {

mapping(address => Patient) public patients;

struct Patient {
    string name;
    uint256 age;
    string medicalHistory;
    string previousConsultDoctor;
    string allergies;
    string insurance;
    string pastSurgeries;
    string bloodType;
}

function addMedicalHistory(
    string memory _name,
    uint256 _age,
    string memory _medicalHistory,
    string memory _previousConsultDoctor,
    string memory _allergies,
    string memory _insurance,
    string memory _pastSurgeries,
    string memory _bloodType
) public {
    require(bytes(_name).length > 0, "Name must be non-empty");
    require(_age > 0, "Age must be positive");
    require(bytes(_medicalHistory).length > 0, "Medical history must be non-empty");
    require(bytes(_previousConsultDoctor).length > 0, "Previous consult doctor must be non-empty");
    require(bytes(_allergies).length > 0, "Allergies must be non-empty");
    require(bytes(_insurance).length > 0, "Insurance must be non-empty");
    require(bytes(_pastSurgeries).length > 0, "Past surgeries must be non-empty");

    patients[msg.sender] = Patient(
        _name,
        _age,
        _medicalHistory,
        _previousConsultDoctor,
        _allergies,
        _insurance,
        _pastSurgeries,
        _bloodType
    );
}

function getMedicalHistory(address _patientAddress) public view returns (
    string memory name,
    uint256 age,
    string memory medicalHistory,
    string memory previousConsultDoctor,
    string memory allergies,
    string memory insurance,
    string memory pastSurgeries,
    string memory bloodType
) {
    Patient memory patient = patients[_patientAddress];
    return (
        patient.name,
        patient.age,
        patient.medicalHistory,
        patient.previousConsultDoctor,
        patient.allergies,
        patient.insurance,
        patient.pastSurgeries,
        patient.bloodType
        );
    }
}
