-- Usar la base de datos existente
USE RegistroLoginDB;
GO

-- Eliminar la tabla si ya existe
DROP TABLE IF EXISTS Usuarios;


-- Eliminar los procedimientos almacenados si ya existen
DROP PROCEDURE IF EXISTS sp_RegistrarUsuario;
GO

DROP PROCEDURE IF EXISTS sp_LoginUsuario;
GO


CREATE TABLE Usuarios (
    UsuarioID INT IDENTITY(1,1) PRIMARY KEY, 
    Nombre NVARCHAR(100),                    
    Apellido NVARCHAR(100),                 
    NombreUsuario NVARCHAR(50) UNIQUE,        
    Password NVARCHAR(255)              
);
GO


CREATE PROCEDURE sp_RegistrarUsuario
    @Nombre NVARCHAR(100),
    @Apellido NVARCHAR(100),
    @NombreUsuario NVARCHAR(50),
    @Password NVARCHAR(255)
AS
BEGIN
    INSERT INTO Usuarios (Nombre, Apellido, NombreUsuario, Password)
    VALUES (@Nombre, @Apellido, @NombreUsuario, @Contraseña);
END;
GO

-- Crear un procedimiento almacenado para verificar un usuario en el login
CREATE PROCEDURE sp_LoginUsuario
    @NombreUsuario NVARCHAR(50),
    @Contraseña NVARCHAR(255)
AS
BEGIN
    SELECT * FROM Usuarios
    WHERE NombreUsuario = @NombreUsuario
    AND Contraseña = @Contraseña;
END;
GO
