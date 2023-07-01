DROP DATABASE IF EXISTS Baitap;
CREATE DATABASE IF NOT EXISTS Baitap;
Use Baitap;

DROP Table IF EXISTS Department;
CREATE Table Department(
DepartmentID	tinyint	auto_increment primary key,
DepartmentName	varchar(20) not null
);

DROP Table IF EXISTS `Position`;
CREATE Table `Position`(
PositionID	tinyint	auto_increment	primary key,
PositionName	enum('Dev','Test','Scrum Master','PM')
);

DROP Table IF EXISTS `Account` ;
CREATE Table `Account`(
AccountID	tinyint	auto_increment primary key,
Email	varchar(20) not null,
Username varchar(10) not null,
Fullname	varchar(30) not null,
DepartmentID	tinyint,
CreateDate	datetime default current_timestamp,
Foreign Key(DepartmentID) References Department(DepartmentID)
);

DROP Table IF EXISTS `Group`;
CREATE Table `Group`(
GroupID	char(3) primary key,
GroupName	varchar(20) not null,
CreatorID	char(5) unique,
CreateDate	date
);

DROP Table IF EXISTS GroupAccount;
CREATE Table GroupAccount(
GroupID	char(3),
AccountID	tinyint,
JoinDate	date
);

DROP Table IF EXISTS TypeQuestion;
CREATE Table TypeQuestion(
TypeID	char(3)	primary key,
TypeName	enum('Essay','Multiple-Choice')
);

DROP table IF EXISTS CategoryQuestion;
CREATE Table CategoryQuestion(
CategoryID	tinyint	auto_increment	primary key,
CategoryName	enum('Java','Javascript','SQL','HTML','JSREACT')
);

DROP Table IF EXISTS Question;
CREATE Table Question(
QuestionID	char(2)	primary key,
Content	varchar(100),
CategoryID	tinyint,
TypeID	char(3),
CreatorID	char(5) unique,
CreateDate	date,
foreign key(CategoryID)references CategoryQuestion(CategoryID),
foreign key(TypeID)references TypeQuestion(TypeID),
foreign key(CreatorID) references `Group`(CreatorID)
);

DROP Table IF EXISTS Answer;
CREATE Table Answer(
AnswerID	char(3)	primary key,
Content		varchar(100) not null,
QuestionID	char(2),
isCorrect	bit,
foreign key(QuestionID) References Question(QuestionID)
);

Drop Table IF EXISTS Exam;
CREATE Table Exam(
ExamID	char(3)	primary key,
`Code`	char(8) not null,
Title	varchar(20),
CategoryID	tinyint,
Duration	Time,
CreatorID	char(5) unique,
CreateDate	date,
Foreign key(CategoryID) References CategoryQuestion(CategoryID)
);

DROP Table IF EXISTS ExamQuestion;
CREATE Table ExamQuestion(
ExamID	varchar(5) unique primary key,
QuestionID	char(2),
foreign key(ExamID) references Exam(ExamID),
foreign key(QuestionID) references Question(QuestionID)
);


INSERT INTO department(DepartmentID,DepartmentName) 
VALUES	(1, N'Sài Gòn'),
		(2,	N'Hà Nội'),
        (3, 'New York'),
        (4, 'Berlin'),
        (5,	'Tokyo');
        
        
INSERT INTO `position`(PositionID,PositionName)
VALUES	(1,	'Dev'),
		(2, 'Test'),
        (3,	'Scrum Master'),
        (4,	'PM');
        

INSERT INTO `account`(AccountID,Email,Username,Fullname,DepartmentID)
VALUES	(1,'abc1@gmail.com','Dung','Vu Tien Dung',1),
		(2,'abc2@gmail.com','A','Nguyen Van A',2),
        (3,'abc3@gmail.com','B','Le Van B',3),
        (4,'abc4@gmail.com','C','Vu Van C',4),
        (5,'abc5@gmail.com','D','Le Tien D',5);
        
INSERT INTO `Group`(GroupID,GroupName,CreatorID,CreateDate)
VALUES	('RM1','Java','JV1',NOW()),
		('RM2','JSREACT','JS1',curdate()),
        ('RM3','SQL','SQL1',curdate()),
        ('RM4','Javascript','JVS1',curdate()),
        ('RM5','HTML','HTML1',curdate());

INSERT INTO groupaccount(GroupID,AccountID,JoinDate)
VALUES	('RM1','1','2023/06/15'),
		('RM2','2','2023/06/16'),
        ('RM3','3','2023/06/17'),
        ('RM4','4','2023/06/18'),
        ('RM5','5','2023/06/19');

INSERT INTO typequestion(TypeID,TypeName)
VALUES	('ES','Essay'),
		('MC','Multiple-Choice');

INSERT INTO categoryquestion(CategoryID,CategoryName)
VALUES	(1,'Java'),
		(2,'Javascript'),
        (3,'SQL'),
        (4,'HTML'),
        (5,'JSREACT');

INSERT INTO question(QuestionID,Content,CategoryID,TypeID,CreatorID,CreateDate)
VALUES	('Q1','Question about Java',1,'ES','JV1',NOW()),
		('Q2','Question about Javascript',2,'ES','JVS1',NOW()),
        ('Q3','Question about SQL',3,'MC','SQL1',NOW()),
        ('Q4','Question about HTML',4,'MC','HTML1',NOW()),
        ('Q5','Question about JSREACT',5,'ES','JS1',NOW());
        
INSERT INTO answer(AnswerID,Content,QuestionID,isCorrect)
VALUES	('AS1','Answer about Java','Q1',1),
		('AS2','Answer about Javascript','Q2',1),
        ('AS3','Answer about SQL','Q3',0),
        ('AS4','Answer about HTML','Q4',0),
        ('AS5','Answer about JSREACT','Q5',1);
        
INSERT INTO exam(ExamID,`Code`,Title,CategoryID,Duration,CreatorID,CreateDate)
VALUES	('EX1','EXAMS001','Java Learning',1,'02:00:00','JV1',NOW()),
		('EX2','EXAMS002','Javascript Learning',2,'02:00:00','JVS1',NOW()),
        ('EX3','EXAMS003','SQL Learning',3,'02:00:00','SQL1',NOW()),
        ('EX4','EXAMS004','HTML Learning',4,'02:00:00','HTML1',NOW()),
        ('EX5','EXAMS005','JSREACT Learning',5,'02:00:00','JS1',NOW());
        
INSERT INTO examquestion(ExamID,QuestionID)
VALUES	('EX1','Q1'),
		('EX2','Q2'),
        ('EX3','Q3'),
        ('EX4','Q4'),
        ('EX5','Q5');