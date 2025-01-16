USE AULA05122024;

INSERT INTO Empresa (empresaNome, IdEmpresa) VALUES
('Empresa Alpha', 1),
('Empresa Beta', 2);

INSERT INTO Estacionamento (IdEstacionamento, estacionamentoNome, estacionamentoLocalizacao, estacionamentoCapacidade, estacionamentoHorariosFuncionamento, fk_Empresa_IdEmpresa) VALUES
(1, 'Estacionamento Centro', 'Rua A, 123', 50, '2025-01-01 08:00:00', 1),
(2, 'Estacionamento Leste', 'Avenida B, 456', 30, '2025-01-01 09:00:00', 2);

INSERT INTO User (userEmail, userSenha, IdUser, userNome, userTelefone) VALUES
('user1@email.com', 'senha123', 1, 'João Silva', '+5511987654321'),
('user2@email.com', 'senha456', 2, 'Maria Oliveira', '+5511987654322'),
('user3@email.com', 'senha789', 3, 'Carlos Santos', '+5511987654323');

INSERT INTO Cliente (ClienteId, ClienteCpf, ClienteDataDeNascimento, fk_User_IdUser) VALUES
(1, '12345678901', '1990-05-10', 1),
(2, '98765432109', '1985-08-15', 2);

INSERT INTO Administrador_ (admId, admNivelDeAcesso, admDepartamento, fk_User_IdUser) VALUES
(1, 'Gerente', 'Operações', 3);

INSERT INTO Veiculo (veiculoId, veiculoPlaca, veiculoModelo) VALUES
(1, 'ABC1234', 'Fiat Uno'),
(2, 'DEF5678', 'Chevrolet Onix');

INSERT INTO Feedback (feedbackId, feedbackComentario, feedbackNota, fk_User_IdUser) VALUES
(1, 'Excelente serviço', 5, 1),
(2, 'Poderia melhorar a organização', 3, 2);

INSERT INTO Representa (fk_User_IdUser, fk_Empresa_IdEmpresa) VALUES
(3, 1);

INSERT INTO Reserva (fk_User_IdUser, fk_Estacionamento_IdEstacionamento) VALUES
(1, 1),
(2, 2);

INSERT INTO Possui (fk_User_IdUser, fk_Veiculo_veiculoId) VALUES
(1, 1),
(2, 2);
