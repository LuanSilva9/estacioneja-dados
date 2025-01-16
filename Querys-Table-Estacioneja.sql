USE AULA05122024;

-- Consultar todas as empresas
SELECT empresaNome, IdEmpresa FROM Empresa;

-- Consultar todos os estacionamentos, com nome da empresa associada
SELECT e.estacionamentoNome, e.estacionamentoLocalizacao, e.estacionamentoCapacidade, e.estacionamentoHorariosFuncionamento, emp.empresaNome
FROM Estacionamento e
JOIN Empresa emp ON e.fk_Empresa_IdEmpresa = emp.IdEmpresa;

-- Consultar usuários com informações adicionais
SELECT u.userNome, u.userEmail, u.userTelefone, c.ClienteCpf, c.ClienteDataDeNascimento
FROM User u
JOIN Cliente c ON u.IdUser = c.fk_User_IdUser;

-- Consultar administrador com detalhes do usuário
SELECT a.admId, a.admNivelDeAcesso, a.admDepartamento, u.userNome, u.userEmail
FROM Administrador_ a
JOIN User u ON a.fk_User_IdUser = u.IdUser;

-- Consultar veículos de cada usuário
SELECT v.veiculoPlaca, v.veiculoModelo, u.userNome
FROM Veiculo v
JOIN Possui p ON v.veiculoId = p.fk_Veiculo_veiculoId
JOIN User u ON p.fk_User_IdUser = u.IdUser;

-- Consultar feedbacks com as notas de cada usuário
SELECT f.feedbackComentario, f.feedbackNota, u.userNome
FROM Feedback f
JOIN User u ON f.fk_User_IdUser = u.IdUser;

-- Consultar empresas representadas por usuários
SELECT u.userNome, emp.empresaNome
FROM Representa r
JOIN User u ON r.fk_User_IdUser = u.IdUser
JOIN Empresa emp ON r.fk_Empresa_IdEmpresa = emp.IdEmpresa;

-- Consultar reservas de usuários em estacionamentos específicos
SELECT u.userNome, e.estacionamentoNome
FROM Reserva r
JOIN User u ON r.fk_User_IdUser = u.IdUser
JOIN Estacionamento e ON r.fk_Estacionamento_IdEstacionamento = e.IdEstacionamento;

-- Consultar quais veículos são possuídos por usuários
SELECT u.userNome, v.veiculoPlaca
FROM Possui p
JOIN User u ON p.fk_User_IdUser = u.IdUser
JOIN Veiculo v ON p.fk_Veiculo_veiculoId = v.veiculoId;
