DROP DATABASE IF EXISTS TestAs;
CREATE DATABASE TestAs;
Use TestAs;

DROP TABLE IF exists Trainee;
CREATE Table Trainee(
TraineeID	tinyint	auto_increment	primary key,
Full_Name	nvarchar(50) not null,
Birth_Date	Date	not null,
Gender	varchar(10),
type enum('Male','Female'),

ET_IQ int unsigned,
CHECK (ET_IQ >=20),

ET_Gmath int unsigned,
CHECK (ET_Gmath >=20),

ET_English int unsigned,
CHECK (ET_English >=20),

Traning_Class	char(8),
Evaluation_Notes	longtext

);