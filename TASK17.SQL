USE master;
CREATE LOGIN MyNewLogin WITH PASSWORD = 'MyStrongPassword123!', CHECK_POLICY = ON;
USE YourDatabaseName;
CREATE USER MyNewUser FOR LOGIN MyNewLogin;
EXEC sp_addrolemember 'db_owner', 'MyNewUser';
