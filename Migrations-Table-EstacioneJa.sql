CREATE DATABASE AULA05122024;

USE AULA05122024;


CREATE TABLE Empresa (
    empresaNome VARCHAR(100),
    IdEmpresa INT PRIMARY KEY
);

CREATE TABLE Estacionamento (
    IdEstacionamento INT PRIMARY KEY,
    estacionamentoNome VARCHAR(100),
    estacionamentoLocalizacao VARCHAR(100),
    estacionamentoCapacidade INT,
    estacionamentoHorariosFuncionamento DATETIME,
    fk_Empresa_IdEmpresa INT
);

CREATE TABLE User (
    userEmail VARCHAR(100),
    userSenha VARCHAR(200),
    IdUser INT PRIMARY KEY,
    userNome VARCHAR(50),
    userTelefone CHAR(13)
);

CREATE TABLE Cliente (
    ClienteId INT,
    ClienteCpf CHAR(11),
    ClienteDataDeNascimento DATE,
    fk_User_IdUser INT,
    PRIMARY KEY (ClienteId, fk_User_IdUser)
);

CREATE TABLE Administrador_ (
    admId INT,
    admNivelDeAcesso VARCHAR(50),
    admDepartamento VARCHAR(50),
    fk_User_IdUser INT,
    PRIMARY KEY (admId, fk_User_IdUser)
);

CREATE TABLE Veiculo (
    veiculoId INT PRIMARY KEY,
    veiculoPlaca CHAR(8),
    veiculoModelo VARCHAR(50)
);

CREATE TABLE Feedback (
    feedbackId INT PRIMARY KEY,
    feedbackComentario VARCHAR(200),
    feedbackNota INT,
    fk_User_IdUser INT
);

CREATE TABLE Representa (
    fk_User_IdUser INT,
    fk_Empresa_IdEmpresa INT
);

CREATE TABLE Reserva (
    fk_User_IdUser INT,
    fk_Estacionamento_IdEstacionamento INT
);

CREATE TABLE Possui (
    fk_User_IdUser INT,
    fk_Veiculo_veiculoId INT
);
 
ALTER TABLE Estacionamento ADD CONSTRAINT FK_Estacionamento_2
    FOREIGN KEY (fk_Empresa_IdEmpresa)
    REFERENCES Empresa (IdEmpresa)
    ON DELETE CASCADE;
 
ALTER TABLE Cliente ADD CONSTRAINT FK_Cliente_2
    FOREIGN KEY (fk_User_IdUser)
    REFERENCES User (IdUser)
    ON DELETE CASCADE;
 
ALTER TABLE Administrador_ ADD CONSTRAINT FK_Administrador__2
    FOREIGN KEY (fk_User_IdUser)
    REFERENCES User (IdUser)
    ON DELETE CASCADE;
 
ALTER TABLE Feedback ADD CONSTRAINT FK_Feedback_2
    FOREIGN KEY (fk_User_IdUser)
    REFERENCES User (IdUser)
    ON DELETE CASCADE;
 
ALTER TABLE Representa ADD CONSTRAINT FK_Representa_1
    FOREIGN KEY (fk_User_IdUser)
    REFERENCES User (IdUser)
    ON DELETE SET NULL;
 
ALTER TABLE Representa ADD CONSTRAINT FK_Representa_2
    FOREIGN KEY (fk_Empresa_IdEmpresa)
    REFERENCES Empresa (IdEmpresa)
    ON DELETE SET NULL;
 
ALTER TABLE Reserva ADD CONSTRAINT FK_Reserva_1
    FOREIGN KEY (fk_User_IdUser)
    REFERENCES User (IdUser)
    ON DELETE RESTRICT;
 
ALTER TABLE Reserva ADD CONSTRAINT FK_Reserva_2
    FOREIGN KEY (fk_Estacionamento_IdEstacionamento)
    REFERENCES Estacionamento (IdEstacionamento)
    ON DELETE SET NULL;
 
ALTER TABLE Possui ADD CONSTRAINT FK_Possui_1
    FOREIGN KEY (fk_User_IdUser)
    REFERENCES User (IdUser)
    ON DELETE SET NULL;
 
ALTER TABLE Possui ADD CONSTRAINT FK_Possui_2
    FOREIGN KEY (fk_Veiculo_veiculoId)
    REFERENCES Veiculo (veiculoId)
    ON DELETE SET NULL;