/*
***********************
* Create Dedicated SQL *
***********************
*/

CREATE TABLE Membership
(MemberID int IDENTITY,
 FirstName varchar(100) MASKED WITH (FUNCTION = 'partial(1,"XXXXXXX",0)') NULL,
 LastName varchar(100) NOT NULL,
 Phone varchar(12) MASKED WITH (FUNCTION = 'default()') NULL,
 Email varchar(100) MASKED WITH (FUNCTION = 'email()') NULL);

--Insert sample data in the table
INSERT Membership VALUES ('Roberto', 'Tamburello', '555.123.4567', 'RTamburello@contoso.com');
INSERT Membership VALUES ('Janice', 'Galvin', '555.123.4568', 'JGalvin@contoso.com.co');
INSERT Membership VALUES ('Zheng', 'Mu', '555.123.4569', 'ZMu@contoso.net');
SELECT * FROM Membership;

--A new user is created and granted SELECT permission on the table. Queries executed as the TestUser view masked data.
CREATE USER TestUser WITHOUT LOGIN;
GRANT SELECT ON Membership TO TestUser;

--Test user permissions
EXECUTE AS USER = 'TestUser';
SELECT * FROM Membership;
REVERT;

--The following example adds a masking function to the LastName column
ALTER TABLE Membership
ALTER COLUMN LastName ADD MASKED WITH (FUNCTION = 'partial(2,"XXX",0)');

--The following example changes a masking function on the LastName column
ALTER TABLE Membership
ALTER COLUMN LastName varchar(100) MASKED WITH (FUNCTION = 'default()');

--Granting the UNMASK permission allows TestUser to see the data unmasked
GRANT UNMASK TO TestUser;
EXECUTE AS USER = 'TestUser';
SELECT * FROM Membership;
REVERT;

-- Removing the UNMASK permission
REVOKE UNMASK TO TestUser;

--The following statement drops the mask on the LastName column created in the previous example
ALTER TABLE Membership
ALTER COLUMN LastName DROP MASKED;


