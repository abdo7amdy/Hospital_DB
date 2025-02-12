-- Hospital Database Creation

Create Database Hospital

use Hospital

-- Tables Creation

Create Table Patient 
(
Id int primary key identity(1,1),
Name nvarchar(max) not null,
DoB date not null,
WardID int ,
CoonsultantID int 
)

Create Table Ward 
(
Id int primary key Identity(1,1),
name nvarchar(max) not null,
NurseNumber int 
)

Alter table Patient 
Add foreign key (WardID) references Ward(Id)

Create Table Nurse 
(
Number int Primary Key identity(1,1),
name nvarchar(max) not null ,
Address nvarchar(max) not null,
WardID int references Ward(Id)
)

Alter Table Ward 
Add foreign key (NurseNumber) references Nurse(Number)

Create Table Consultant 
(
Id int primary key identity(1,1),
Name nvarchar(max) not null
)

Alter table Patient 
Add foreign key (CoonsultantID) references Consultant(Id)

Create Table PatientConsultant
(
PatientID int references Patient(Id),
ConsultantID int references Consultant(Id),
primary key (PatientID,ConsultantID)
)

Create Table Drugs
(
Code int primary key identity(202401,1),
Dosage int not null
)

Create Table DrugBrand
(
Code int references Drugs(Code),
Brand nvarchar(20) not null,
primary key(Code,Brand)
)

Create Table NurseDrugPatient
(
NurseNumber int references Nurse (Number),
DrugCode int references Drugs(Code),
PatientID int references Patient(Id),
Date Date not null,
Time time not null,
Dosage int not null,
primary key(PatientID,Date,Time)
)
