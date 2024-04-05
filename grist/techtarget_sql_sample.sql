#——————————————————————————————————————#
# SQL Examples                         #
# For SearchSoftwareQuality            #
# By Matthew Heusser                   #
#——————————————————————————————————————#

#A Sample Table
CREATE TABLE Employees (
    EmployeeID int NOT NULL PRIMARY KEY,
    LastName varchar2(50),
    FirstName varchar2(50),
    Address varchar2(255),
    City varchar2(255),
    Zip varchar2(10)
);

#Find an employee number
SELECT Lastname, FirstName 
FROM Employees 
WHERE EmployeeID = 387;


#Name change; update
UPDATE Employees
SET Lastname = "Smith"
WHERE EmployeeID = 387;


#They leave the company
DELETE FROM Employees 
WHERE EmployeeID=387;


