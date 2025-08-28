


USE master;


GO

DROP DATABASE IF EXISTS Ejemplos_Ejemplo1_DB;

GO

CREATE DATABASE Ejemplos_Ejemplo1_DB;

GO

USE  Ejemplos_Ejemplo1_DB;

GO

CREATE TABLE Circulos(
	Id INT IDENTITY,
	Area DECIMAL(18,2),
	Radio DECIMAL(18,2) NOT NULL,
	CONSTRAINT PK_Circulos PRIMARY KEY(Id)
);

GO

INSERT INTO Circulos (Radio)
VALUES
(1),
 (2)

 GO

 --SET XACT_ABORT ON;


 BEGIN TRY

	 BEGIN TRANSACTION;

 
	 UPDATE Circulos SET Area=3.1415*Radio*Radio
	 WHERE Id=1
	 UPDATE Circulos SET Area=3.1415*Radio*Radio, Radio=NULL --salta la restricción
	 WHERE Id=2

	 COMMIT TRANSACTION;

END TRY
BEGIN CATCH
	
	ROLLBACK TRANSACTION;

	  SELECT ERROR_NUMBER() AS NumeroError,
           ERROR_MESSAGE() AS MensajeError;

END CATCH


GO

SELECT * FROM Circulos

GO

USE master;