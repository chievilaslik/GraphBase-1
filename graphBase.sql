USE master;
GO
DROP DATABASE IF EXISTS GraphBank;
GO
CREATE DATABASE GraphBank;
GO
USE GraphBank;
GO

CREATE TABLE [Client] (
	ClientID int IDENTITY(1,1) NOT NULL,
	Name nvarchar(30) NOT NULL,
	Patronymic nvarchar(30),
	Surname nvarchar(30) NOT NULL,
	Telephone nvarchar(20) NOT NULL UNIQUE,
	Address nvarchar(50) NOT NULL,
	Salary money NOT NULL,
	NameOwnership nvarchar(50) NOT NULL,
	OwnershipType nvarchar(50) NOT NULL,
	ContactPerson nvarchar(30) NOT NULL,
  CONSTRAINT [PK_CLIENT] PRIMARY KEY CLUSTERED
  (
  [ClientID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

) AS Node
GO
CREATE TABLE [Employee] (
	EmployeeID int IDENTITY(1,1) NOT NULL,
	Name nvarchar(30) NOT NULL,
	Patronymic nvarchar(30),
	Surname nvarchar(30) NOT NULL,
	Post nvarchar(50) NOT NULL,
  CONSTRAINT [PK_EMPLOYEE] PRIMARY KEY CLUSTERED
  (
  [EmployeeID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

) AS Node
GO
CREATE TABLE [Loan] (
	LoanID int IDENTITY(1,1) NOT NULL,
	LoanType nvarchar(50) NOT NULL,
	LoanCondition nvarchar(50) NOT NULL,
	LoanRate float NOT NULL,
	ReturnPeriod nvarchar(30) NOT NULL,
  CONSTRAINT [PK_LOAN] PRIMARY KEY CLUSTERED
  (
  [LoanID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

) AS Node
GO
CREATE TABLE [Bank] (
	BankID int IDENTITY(1,1) NOT NULL,
	BankName nvarchar(50) NOT NULL,
	City nvarchar(50) NOT NULL,
	DateOfFounded date NOT NULL,
  CONSTRAINT [PK_BANK] PRIMARY KEY CLUSTERED
  (
  [BankID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

) AS Node
GO
CREATE TABLE [City] (
	CityID int IDENTITY(1,1) NOT NULL,
	CityName nvarchar(50) NOT NULL,
	Region nvarchar(50) NOT NULL,
	NumberOfInhabitants int NOT NULL,
  CONSTRAINT [PK_CITY] PRIMARY KEY CLUSTERED
  (
  [CityID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

) AS Node
GO

CREATE TABLE LivesIn AS EDGE;

CREATE TABLE WorkIn AS EDGE;

CREATE TABLE Signs AS EDGE;

CREATE TABLE Formalize AS EDGE;

CREATE TABLE �ooperates AS EDGE;

ALTER TABLE LivesIn
ADD CONSTRAINT EC_LivesIn CONNECTION (Client TO City)

ALTER TABLE WorkIn
ADD CONSTRAINT EC_WorkIn CONNECTION (Employee TO Bank)

ALTER TABLE Signs
ADD CONSTRAINT EC_Signs CONNECTION (Client TO Loan)

ALTER TABLE Formalize
ADD CONSTRAINT EC_Formalize CONNECTION (Employee TO Loan)

ALTER TABLE �ooperates
ADD CONSTRAINT EC_�ooperates CONNECTION (Bank TO Bank)

Insert into Client(Name,Patronymic, Surname, Telephone, Address, Salary, NameOwnership,OwnershipType, ContactPerson)
Values ('������', '���������', '��������','+375(44)245-27-87', '���������� ��., ��� 38, ��. 48', 1450, '�������� "������ ������"','������������ ������������', '�������� �.�.'),
( '���������', '����������', '�������','+375(33)220-95-58', '���������� ��., ��� 3, ��. 63', 1000, '������� "��������"','���������������� �������������', '��������� �.�.' ),
('������', '�������������', '��������','+375(29)555-93-03', '������ ���., ��� 6, ��. 64', 2450, '����� �������� "����������"','������������ ������������', '�������� �.�.' ),
('�����', '����������', '��������','+375(44)131-07-88', '�������� ��., ��� 33, ��. 75', 600, '������� "Espresso"','������������ ������������', '������� �.�.' ),
('������', '����������', '�������','+375(29)342-96-96', '���������� ��., ��� 54, ��. 51', 567, '������� ������� "�����"','������������ ������������', '��������� �.�.' ),
('�����', '���������', '�������','+375(44)163-46-48', '������� ��., ��� 31, ��. 153', 5000, '����������� ����� "�������"','������������ ������������', '������ �.�.' ),
('���', '���������', '�������','+375(29)220-00-79', '������� ��., ��� 6, ��. 109', 666, '����� "�����"','������������ ������������', '������� �.�.' ),
('���������', '����������', '������','+375(29)563-37-06', '������� ��., ��� 6, ��. 107', 1340, '����� "��������"','������������ ������������', '������� �.�.' ),
('��������','�������������', '������','+375(44)258-60-01', '�������� ��., ��� 101', 1486, '��������','������������', '��������� �.�.' ),
('�������', '�������', '��������','+375(33)201-60-75 ', '�������� ��., ��� 72', 900, '�������� ����� "���������"','������������ ������������', '������ �.�.' ),
('������', '����������', '���������','+375(29)274-44-70', '����������� ��., ��� 49, ��. 52', 2020, '��������� ������������ "����"','���������������� ���������', '������� �.�.' ),
('����������', '��������', '��������','+375(33)252-73-70', '����������� ��., ��� 49, ��. 71', 456, '��������� ������� ��� �������������','������������ ������������', '����� �.�.' ),
('������', '�������', '������','+375(44)223-15-20', '������ ��., ��� 48, ��. 46', 1111, '���������� �������� "�����"','������������ ������������', '�������� �.�.' ),
('������', '��������', '������','+375(44)552-44-82', '���������� ��., ��� 14, ��. 88', 2340, '�������� "����������� ����������"','������������ �������������', '�������� �.�.' ),
('�������', '��������', '�������','+375(44)333-36-75', '���������� ��., ��� 14, ��. 76', 2569, '����������� "������"','������������ �������������', '������� �.�.' ),
('�������', '��������������', '��������','+375(29)173-16-05', '������ ��., ��� 2/�', 3000, '������ ������ "��������� ����"','������������ ������������', '�������� �.�.' ),
('����', '��������', '��������','+375(33)228-97-33', '�������� ��., ��� 14, ��. 75', 2395, '��������� ���� "�����������"','������������ �������������', '�������� �.�.' )

SELECT *
FROM Client

Insert into Employee(Name, Patronymic, Surname, Post)
values('���������', '���������', '���������', '�������� �� ������ � ���������'),
('������ ', '����������', '������', '������� �������� �� ������������'),
('����', '��������', '�������', '��������� ��������'),
('����������', '�������', '������', '������� �������� �� ������������'),
('���������', '���������', '��������', '���������� �� ���������� ������������'),
('��������', '����������', '�������', '������� �������� �� ������������'),
('��������', '��������', '��������', '��������� ��������'),
('�������', '�������������', '������', '������� �������� �� ������������'),
('������', '����������', '�����', '���������� �� ���������� ������������'),
('���������', '����������', '����', '��������� ��������')

select*
from Employee

insert into Loan(LoanType, LoanCondition, LoanRate, ReturnPeriod)
values('�������','�����������', 18.55 , '7 ���'),
('���������','�����������', 12.3, '3 ����'),
('����������','��������', 16.31 , '5 ���'),
('���������','��������', 15.3 , '20 ���'),
('�� �������������','��������', 17.25 , '14 ���'),
('����������','�����������', 12.45 , '11 ���'),
('�� ������������ �����','�����������', 13.32 , '3 ����'),
('�� �������� �������','�����������', 17.32 , '4 ����'),
('������������','��������', 14.15 , '10 ���'),
('�������������','�����������', 12.32 , '3 ����')

select*
from Loan

INSERT INTO City(CityName, Region, NumberOfInhabitants)
VALUES('�����', '������� �������', 1996553),
('������', '���������� �������', 503984),
('������', '����������� �������', 357493),
('�����', '��������� �������', 340753),
('�������', '���������� �������', 355436),
('�������', '��������� �������', 360419),
('������', '��������� �������', 79896),
('�������', '������� �������', 137703),
('��������', '���������� �������', 209675),
('���������', '������� �������', 99622)

select*
from City

insert into Bank(BankName, City, DateOfFounded)
VALUES('"���������" ���', (SELECT CityName FROM City WHERE CityID = 1), '1988-11-21'),
('��� "�����������"', (SELECT CityName FROM City WHERE CityID = 2), '1922-10-20'),
('��� "���������������"', (SELECT CityName FROM City WHERE CityID = 3), '1990-04-01'),
('��� "�������������"', (SELECT CityName FROM City WHERE CityID = 4), '2001-09-03'),
('��� "����������� �������� ����"', (SELECT CityName FROM City WHERE CityID = 5), '1991-09-01'),
('��� "������� ���������� ����"', (SELECT CityName FROM City WHERE CityID = 6), '1994-03-14'),
('��� "�����������"', (SELECT CityName FROM City WHERE CityID = 7), '1991-01-18'),
('��� "���������"', (SELECT CityName FROM City WHERE CityID = 8), '1994-08-05'),
('��� "�����������������"', (SELECT CityName FROM City WHERE CityID = 9), '1991-12-12'),
('��� "��������"', (SELECT CityName FROM City WHERE CityID = 10), '1991-12-28')

SELECT*
FROM Bank

--���� �
INSERT INTO LivesIn($from_id, $to_id)
VALUES((SELECT $node_id FROM Client WHERE ClientID = 1), (SELECT $node_id FROM City WHERE CityID = 1)),--������ � �����
	  ((SELECT $node_id FROM Client WHERE ClientID = 2), (SELECT $node_id FROM City WHERE CityID = 1)),-- ��������� � �����
	  ((SELECT $node_id FROM Client WHERE ClientID = 3), (SELECT $node_id FROM City WHERE CityID = 2)),-- ������ � ������
	  ((SELECT $node_id FROM Client WHERE ClientID = 4), (SELECT $node_id FROM City WHERE CityID = 2)),--����� � ������
	  ((SELECT $node_id FROM Client WHERE ClientID = 5), (SELECT $node_id FROM City WHERE CityID = 3)),--������ � ������
	  ((SELECT $node_id FROM Client WHERE ClientID = 6), (SELECT $node_id FROM City WHERE CityID = 4)),--����� � �����
	  ((SELECT $node_id FROM Client WHERE ClientID = 7), (SELECT $node_id FROM City WHERE CityID = 5)),--��� � ������
	  ((SELECT $node_id FROM Client WHERE ClientID = 8), (SELECT $node_id FROM City WHERE CityID = 5)),--��������� � ������
	  ((SELECT $node_id FROM Client WHERE ClientID = 9), (SELECT $node_id FROM City WHERE CityID = 6)),--�������� � �������
	  ((SELECT $node_id FROM Client WHERE ClientID = 10), (SELECT $node_id FROM City WHERE CityID = 7)),--������� � ������
	  ((SELECT $node_id FROM Client WHERE ClientID = 11), (SELECT $node_id FROM City WHERE CityID = 7)),--������ � ������
	  ((SELECT $node_id FROM Client WHERE ClientID = 12), (SELECT $node_id FROM City WHERE CityID = 8)),--���������� � �������
	  ((SELECT $node_id FROM Client WHERE ClientID = 13), (SELECT $node_id FROM City WHERE CityID = 8)),--������ � �������
	  ((SELECT $node_id FROM Client WHERE ClientID = 14), (SELECT $node_id FROM City WHERE CityID = 9)),--������ � ��������
	  ((SELECT $node_id FROM Client WHERE ClientID = 15), (SELECT $node_id FROM City WHERE CityID = 9)),--������� � ��������
	  ((SELECT $node_id FROM Client WHERE ClientID = 16), (SELECT $node_id FROM City WHERE CityID = 10)),-- ������� � ���������
	  ((SELECT $node_id FROM Client WHERE ClientID = 17), (SELECT $node_id FROM City WHERE CityID = 10))-- ���� � ���������

SELECT*
FROM LivesIn

--�������� �
INSERT INTO WorkIn($from_id, $to_id)
VALUES 
((SELECT $node_id FROM Employee WHERE EmployeeID = 1), (SELECT $node_id FROM Bank WHERE BankID = 1)),--��������� � ���������
((SELECT $node_id FROM Employee WHERE EmployeeID = 2), (SELECT $node_id FROM Bank WHERE BankID = 2)),--������ � �����������
((SELECT $node_id FROM Employee WHERE EmployeeID = 3), (SELECT $node_id FROM Bank WHERE BankID = 3)),--���� � ����������������
((SELECT $node_id FROM Employee WHERE EmployeeID = 4), (SELECT $node_id FROM Bank WHERE BankID = 4)),--���������� � �������������
((SELECT $node_id FROM Employee WHERE EmployeeID = 5), (SELECT $node_id FROM Bank WHERE BankID = 5)),--��������� � ����������� �������� ����
((SELECT $node_id FROM Employee WHERE EmployeeID = 6), (SELECT $node_id FROM Bank WHERE BankID = 6)),--�������� � ������� ���������� ����
((SELECT $node_id FROM Employee WHERE EmployeeID = 7), (SELECT $node_id FROM Bank WHERE BankID = 7)),--�������� � �����������
((SELECT $node_id FROM Employee WHERE EmployeeID = 8), (SELECT $node_id FROM Bank WHERE BankID = 8)),--������� � ���������
((SELECT $node_id FROM Employee WHERE EmployeeID = 9), (SELECT $node_id FROM Bank WHERE BankID = 9)),--������ � �����������������
((SELECT $node_id FROM Employee WHERE EmployeeID = 10), (SELECT $node_id FROM Bank WHERE BankID = 10))--��������� � ��������

SELECT*
FROM WorkIn

--�����������
INSERT INTO Signs($from_id, $to_id)
VALUES
((SELECT $node_id FROM Client WHERE ClientID = 1),(SELECT $node_id FROM Loan WHERE LoanID = 1)),--������ � �������
((SELECT $node_id FROM Client WHERE ClientID = 2),(SELECT $node_id FROM Loan WHERE LoanID = 1)),--��������� � �������
((SELECT $node_id FROM Client WHERE ClientID = 3),(SELECT $node_id FROM Loan WHERE LoanID = 2)),--������ � ���������
((SELECT $node_id FROM Client WHERE ClientID = 4),(SELECT $node_id FROM Loan WHERE LoanID = 2)),--����� � ���������
((SELECT $node_id FROM Client WHERE ClientID = 5),(SELECT $node_id FROM Loan WHERE LoanID = 3)),--������ � ����������
((SELECT $node_id FROM Client WHERE ClientID = 6),(SELECT $node_id FROM Loan WHERE LoanID = 3)),--����� � ����������
((SELECT $node_id FROM Client WHERE ClientID = 7),(SELECT $node_id FROM Loan WHERE LoanID = 4)),--��� � ���������
((SELECT $node_id FROM Client WHERE ClientID = 8),(SELECT $node_id FROM Loan WHERE LoanID = 4)),--��������� � ���������
((SELECT $node_id FROM Client WHERE ClientID = 9),(SELECT $node_id FROM Loan WHERE LoanID = 5)),--�������� � �� �������������
((SELECT $node_id FROM Client WHERE ClientID = 10),(SELECT $node_id FROM Loan WHERE LoanID = 5)),--������� � �� �������������
((SELECT $node_id FROM Client WHERE ClientID = 11),(SELECT $node_id FROM Loan WHERE LoanID = 6)),--������ � ����������
((SELECT $node_id FROM Client WHERE ClientID = 12),(SELECT $node_id FROM Loan WHERE LoanID = 7)),--���������� � �� ������������ �����
((SELECT $node_id FROM Client WHERE ClientID = 13),(SELECT $node_id FROM Loan WHERE LoanID = 8)),--������ � �� �������� �������
((SELECT $node_id FROM Client WHERE ClientID = 14),(SELECT $node_id FROM Loan WHERE LoanID = 9)),--������ � ������������
((SELECT $node_id FROM Client WHERE ClientID = 15),(SELECT $node_id FROM Loan WHERE LoanID = 9)),--������� � ������������
((SELECT $node_id FROM Client WHERE ClientID = 16),(SELECT $node_id FROM Loan WHERE LoanID = 10)),--������� � ��������������
((SELECT $node_id FROM Client WHERE ClientID = 17),(SELECT $node_id FROM Loan WHERE LoanID = 10))--���� � �������������� 

SELECT*
FROM Signs

--���������
INSERT INTO Formalize($from_id, $to_id)
VALUES
((SELECT $node_id FROM Employee WHERE EmployeeID = 1),(SELECT $node_id FROM Loan WHERE LoanID = 1)),--��������� � �������
((SELECT $node_id FROM Employee WHERE EmployeeID = 2),(SELECT $node_id FROM Loan WHERE LoanID = 2)),--������ � ���������
((SELECT $node_id FROM Employee WHERE EmployeeID = 3),(SELECT $node_id FROM Loan WHERE LoanID = 3)),--���� � ����������
((SELECT $node_id FROM Employee WHERE EmployeeID = 4),(SELECT $node_id FROM Loan WHERE LoanID = 4)),--���������� � ���������
((SELECT $node_id FROM Employee WHERE EmployeeID = 5),(SELECT $node_id FROM Loan WHERE LoanID = 5)),--��������� � �� �������������
((SELECT $node_id FROM Employee WHERE EmployeeID = 6),(SELECT $node_id FROM Loan WHERE LoanID = 6)),--�������� � ����������
((SELECT $node_id FROM Employee WHERE EmployeeID = 7),(SELECT $node_id FROM Loan WHERE LoanID = 7)),--�������� � �� ������������ �����
((SELECT $node_id FROM Employee WHERE EmployeeID = 8),(SELECT $node_id FROM Loan WHERE LoanID = 8)),--������� � �� �������� �������
((SELECT $node_id FROM Employee WHERE EmployeeID = 9),(SELECT $node_id FROM Loan WHERE LoanID = 9)),--������ � �����������
((SELECT $node_id FROM Employee WHERE EmployeeID = 10),(SELECT $node_id FROM Loan WHERE LoanID = 10))--��������� � �������������

SELECT*
FROM Formalize

SELECT*
FROM Bank

INSERT INTO �ooperates($from_id, $to_id)
VALUES
((SELECT $node_id FROM Bank WHERE BankID = 1), (SELECT $node_id FROM Bank WHERE BankID = 2)),--"���������" ��� � ��� "�����������"
((SELECT $node_id FROM Bank WHERE BankID = 1), (SELECT $node_id FROM Bank WHERE BankID = 3)),--"���������" ��� � ��� "���������������"
((SELECT $node_id FROM Bank WHERE BankID = 2), (SELECT $node_id FROM Bank WHERE BankID = 3)),--��� "�����������" � ��� "���������������"
((SELECT $node_id FROM Bank WHERE BankID = 3), (SELECT $node_id FROM Bank WHERE BankID = 5)),--��� "���������������" � ��� "����������� �������� ����"
((SELECT $node_id FROM Bank WHERE BankID = 6), (SELECT $node_id FROM Bank WHERE BankID = 7)),--��� "������� ���������� ����" � ��� "�����������"
((SELECT $node_id FROM Bank WHERE BankID = 5), (SELECT $node_id FROM Bank WHERE BankID = 1)),--��� "����������� �������� ����" � "���������" ���
((SELECT $node_id FROM Bank WHERE BankID = 3), (SELECT $node_id FROM Bank WHERE BankID = 8)),--��� "���������������" � ��� "���������"
((SELECT $node_id FROM Bank WHERE BankID = 7), (SELECT $node_id FROM Bank WHERE BankID = 9)),--��� "�����������" � ��� "�����������������"
((SELECT $node_id FROM Bank WHERE BankID = 10), (SELECT $node_id FROM Bank WHERE BankID = 2)),--��� "��������" � ��� "�����������"
((SELECT $node_id FROM Bank WHERE BankID = 10), (SELECT $node_id FROM Bank WHERE BankID = 6)),--��� "��������" � ��� "���������������"
((SELECT $node_id FROM Bank WHERE BankID = 4), (SELECT $node_id FROM Bank WHERE BankID = 10)),--��� "�������������" � 
((SELECT $node_id FROM Bank WHERE BankID = 9), (SELECT $node_id FROM Bank WHERE BankID = 6)),--��� "�����������������" � ��� "������� ���������� ����"
((SELECT $node_id FROM Bank WHERE BankID = 9), (SELECT $node_id FROM Bank WHERE BankID = 8))--��� "�����������������" � ��� "���������"

SELECT*
FROM �ooperates

---------------------������� MATCH-------------------
SELECT  Client.Name,
		City.CityName 
FROM	Client,
		LivesIn,
		City
WHERE MATCH(Client-(LivesIn)->City)
AND City.CityName = '�����'

SELECT Client.Name,
       Loan.LoanType
FROM Client,
	 Signs,
	 Loan
WHERE MATCH(Client-(Signs)->Loan)
AND Loan.LoanType = '����������'

SELECT Employee.Name,
       Loan.LoanType
FROM Employee,
	 Formalize,
	 Loan
WHERE MATCH(Employee-(Formalize)->Loan)
AND Loan.LoanType = '���������'

SELECT Employee.Name,
       Bank.BankName
FROM Employee,
WorkIn,
Bank
WHERE MATCH(Employee-(WorkIn)->Bank)
AND Bank.BankName = '��� "�����������"'

SELECT Bank1.BankName,
Bank2.BankName as CooperateBank
FROM Bank AS Bank1
, �ooperates
, Bank as Bank2
WHERE MATCH(Bank1-(�ooperates)->Bank2)
AND Bank1.BankName = '��� "�����������"'

--String_agg - �����������, ����� ������� ����
SELECT Bank1.BankName,
STRING_AGG(Bank2.BankName, '->') WITHIN GROUP (GRAPH PATH) AS Cooperates
FROM Bank as Bank1
, �ooperates FOR PATH AS co--FOR PATH ������ �����, ����� ����� �������������� �������
, Bank FOR PATH AS Bank2
WHERE MATCH(SHORTEST_PATH(Bank1(-(co)->Bank2){1,2}))-- {1,n} ����� ����� ����� ����� ���� �� 2 �����
AND Bank1.BankName = '��� "�����������"'
--Shortest_Path - ��������� ���������� ���� ����� ������

SELECT Bank1.BankName,
LAST_VALUE(Bank2.BankName) WITHIN GROUP (GRAPH PATH) AS LastNode,
COUNT(Bank2.BankName) WITHIN GROUP (GRAPH PATH) as Steps
FROM Bank as Bank1
, �ooperates FOR PATH AS co--FOR PATH ������ �����, ����� ����� �������������� �������
, Bank FOR PATH AS Bank2
WHERE MATCH(SHORTEST_PATH(Bank1(-(co)->Bank2)+))-- + ����� ����� ������ ����� ����� ��� ���� ������������ �����
AND Bank1.BankName = '��� "�����������"'