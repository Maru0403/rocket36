DROP DATABASE IF EXISTS Baitap;
CREATE DATABASE IF NOT EXISTS Baitap;
Use Baitap;

DROP Table IF EXISTS Department;
CREATE Table Department(
DepartmentID	tinyint	auto_increment primary key,
DepartmentName	varchar(50) not null
);

CREATE Table Position(
PositionID	tinyint	auto_increment	primary key,
PositionName	enum('Dev','Test','Scrum Master','PM')
);

DROP Table IF EXISTS 'Account' ;
CREATE Table 'Account'(
AccountID	tinyint	auto_increment primary key,
Email	varchar(50) not null,
Username varchar(50),
Fullname	varchar(50),
DepartmentID	tinyint,
CreateDate	Date,
Foreign Key(DepartmentID) References Department(DepartmentID)
);

DROP Table IF EXISTS 'Group';
CREATE Table 'Group'(
GroupID	tinyint	auto_increment	primary key,
GroupName	varchar(20) not null,
CreatorID	int,
CreateDate	date
);

DROP Table IF EXISTS GroupAccount;
CREATE Table GroupAccount(
GroupID	tinyint,
AccountID	tinyint,
JoinDate	date
);

DROP Table IF EXISTS TypeQuestion;
CREATE Table TypeQuestion(
TypeID	tinyint	auto_increment	primary key,
TypeName	Varchar(100) not null
);

DROP table IF EXISTS CategoryQuestion;
CREATE Table CategoryQuestion(
CategoryID	tinyint	auto_increment	primary key,
CategoryName	varchar(50)
);

DROP Table IF EXISTS Question;
CREATE Table Question(
QuestionID	tinyint	auto_increment	primary key,
Content	varchar(100) not null,
CategoryID	tinyint,
TypeID	tinyint,
CreatorID	int,
CreateDate	date,
foreign key(CategoryID)references CategoryQuestion(CategoryID),
foreign key(TypeID)references TypeQuestion(TypeID)
);

DROP Table IF EXISTS Answer;
CREATE Table Answer(
AnswerID	tinyint	auto_increment	primary key,
Content		varchar(100) not null,
QuestionID	tinyint,
isCorrect	enum('Dung','Sai'),
foreign key(QuestionID) References Question(QuestionID)
);

Drop Table IF EXISTS Exam;
CREATE Table Exam(
ExamID	tinyint	auto_increment	primary key,
'Code'	char(10) not null,
Title	varchar(20),
CategoryID	tinyint,
Duration	Time,
CreatorID	int,
CreateDate	date,
Foreign key(CategoryID) References CategoryQuestion(CategoryID)
);

DROP Table IF EXISTS ExamQuestion;
CREATE Table ExamQuestion(
ExamID	tinyint,
QuestionID	tinyint,
foreign key(ExamID) references Exam(ExamID),
foreign key(QuestionID) references Question(QuestionID)
);
