create database PI;
use PI;

CREATE TABLE cliente (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(30) NOT NULL,
    telefone VARCHAR(30) NOT NULL,
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE servico (
    id_servico INT PRIMARY KEY AUTO_INCREMENT,
    nome_servico VARCHAR(30) UNIQUE NOT NULL,
    preço DECIMAL(6,2) NOT NULL
);

create table agendamento (
	id_agendamento int primary key auto_increment,
	id_cliente int,
	id_servico int,
	hora_agendamento datetime,
	data_marcacao timestamp default current_timestamp,
    status ENUM ('agendado', 'cancelado','concluido') default 'agendado',
    observacoes text,
    foreign key (id_cliente) references cliente(id_cliente) on delete cascade,
    foreign key (id_servico) references servico(id_servico) on update cascade
);

insert into cliente (nome,telefone,data_cadastro) values 
('Ana Carolina Silva', '(11) 98765-4321', '2023-01-15'),
('Beatriz Oliveira Santos', '(21) 99876-5432', '2023-02-20'),
('Carlos Eduardo Pereira', '(31) 98765-1234', '2023-03-10'),
('Daniela Almeida Costa', '(41) 99654-3210', '2023-01-05'),
('Eduardo Martins Rocha', '(51) 98543-2109', '2023-04-18'),
('Fernanda Souza Lima', '(11) 97654-3289', '2023-05-22'),
('Gabriel Ferreira Rodrigues', '(21) 96543-2178', '2023-06-30'),
('Isabela Castro Gomes', '(31) 95432-1876', '2023-02-14'),
('João Victor Barbosa', '(41) 94321-0765', '2023-07-05'),
('Larissa Mendes Nunes', '(51) 93210-7654', '2023-08-12'),
('Marcos Antônio Dias', '(11) 92107-6543', '2023-03-25'),
('Natália Ribeiro Teixeira', '(21) 91076-5432', '2023-09-08'),
('Otávio Campos Cardoso', '(31) 90765-4321', '2023-10-15'),
('Patrícia Duarte Machado', '(41) 98760-1234', '2023-04-03'),
('Rafaela Santana Moraes', '(51) 97650-4321', '2023-11-19');

select 
	id_cliente,
	nome,
    telefone,
    DATE_FORMAT(data_cadastro, '%d/%m/%Y') AS Data_Cadastro
from cliente;

insert into servico (nome_servico,preço) values 
('Corte Feminino',60.00),
('Corte Masculino',40.00),
('Corte Infantil',35.00),
('Hidratação',80.00),
('Botox Capilar',120.00),
('Reconstrução',100.00),
('Coloração',90.00),
('Mechas',150.00),
('Reflexo',110.00),
('Progressiva',130.00),
('Escova',50.00),
('Secagem',30.00),
('Penteado',70.00),
('Tratamento para Queda',95.00),
('Relaxamento',85.00),
('Selagem',75.00),
('Matização',65.00),
('Descoloração',120.00),
('Corte + Escova',90.00),
('Corte + Hidratação',120.00),
('Pérolizado',140.00),
('Cauterização',110.00),
('Luzes',160.00),
('Baby Liss',180.00),
('Terapia Capilar',200.00);

select 
    nome_servico AS 'Serviço',
    CONCAT('R$ ', FORMAT(preço, 2, 'pt_BR')) AS 'Preço'
from servico
order by preço desc;

insert into agendamento (id_cliente, id_servico, hora_agendamento, status, observacoes) values
(1, 20, '2024-03-15 14:00:00', 'agendado', 'Cliente prefere manhãs'),
(3, 2, '2024-03-16 09:30:00', 'agendado', 'Primeira visita'),
(6, 5, '2024-03-17 11:00:00', 'agendado', 'Retorno de tratamento'),
(9, 10, '2024-03-18 15:30:00', 'agendado', 'Alérgico a amônia'),
(12, 23, '2024-03-19 10:00:00', 'agendado', 'Manutenção de mechas'),
(15, 25, '2024-03-20 13:00:00', 'agendado', 'Consulta inicial'),
(2, 7, '2024-03-21 14:30:00', 'agendado', 'Manutenção de cor'),
(11, 2, '2024-03-22 16:00:00', 'agendado', 'Corte tradicional'),
(4, 11, '2024-03-10 10:00:00', 'concluido', 'Cliente satisfeita'),
(5, 2, '2024-03-11 11:30:00', 'concluido', 'Sem observações'),
(8, 8, '2024-03-12 15:00:00', 'cancelado', 'Cliente adiou para o próximo mês'),
(13, 2, '2024-03-13 17:00:00', 'cancelado', 'Não compareceu'),
(13,4, '2024-03-17 15:30:00', 'agendado', 'sem observações')
;

select
    a.id_agendamento,
    c.nome AS cliente,
    s.nome_servico AS servico,
    CONCAT('R$ ', FORMAT(s.preço, 2)) AS preco,
    DATE_FORMAT(a.hora_agendamento, '%d/%m/%Y %H:%i') AS data_hora,
    a.status,
    a.observacoes
FROM 
    agendamento a
JOIN 
    cliente c ON a.id_cliente = c.id_cliente
JOIN 
    servico s ON a.id_servico = s.id_servico
ORDER BY 
    a.hora_agendamento;