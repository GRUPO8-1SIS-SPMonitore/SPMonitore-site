create database Monitoramento;
drop database monitoramento;
use monitoramento;

create table Faculdade(
idFaculdade int primary key auto_increment,
nome varchar(30) not null,
CNPJ char(18) not null unique,
contato char(14) not null unique,
cidade varchar(20) not null
) auto_increment = 1001;


insert into Faculdade (nome, CNPJ, contato, cidade) values
('SpTech', '05.312.647/0001-72', '(11) 3589-4043', 'São Paulo'),
('Unip', '08.849.302/0001-22', '(11) 8493-8289', 'São Paulo'),
('UFRJ', '02.938.784/0001-65', '(21) 2503-2919', 'Rio de Janeiro');
select * from Faculdade;

create table usuario(
idUsuario int primary key auto_increment,
nome varchar(35) not null,
email varchar(40) not null unique,
senha varchar(20) not null,
fkfaculdade int ,
foreign key (fkFaculdade) references Faculdade (idFaculdade)
)auto_increment = 1;
 
insert into usuario (nome, email, senha, fkFaculdade) values
('ruy', 'ruy@gmail.com', '123', 1001),
('Wesley Souza', 'Wesley.souza@sptech.school', '123456', 1001),
('Marcos Brito', 'Marcos.Brito@sptech.school', '654321', 1001),
('Ana Beatriz', 'Ana.Beatriz@sptech.school', '356432', 1001),
('Antonia Marques', 'Antonia.Marques@unip.uni', '333r56', 1002),
('Lauro Martins', 'Lauro.Martins@unip.uni', '2234e6', 1002),
('Silvio Mendes', 'Silvio.Mendes@ufrj.uni', '55563a', 1003),
('Marcia Gomes', 'Marcia.Gomes@ufrj.uni', 'abcde2', 1003);

create table tbLocal(
idLocal int primary key auto_increment,
Nome varchar(30) not null,
qtdMaxima int not null check (qtdMaxima > 0),
fkFaculdade int,
foreign key (fkFaculdade) references Faculdade (idFaculdade)
)auto_increment = 100;

insert into tblocal (nome, qtdMaxima, fkFaculdade) values
('Biblioteca',50, 1001), 
('Biblioteca', 200, 1001),
('Biblioteca', 150, 1001),
('Biblioteca', 20, 1001),
('Sala de jogos', 25, 1001),
('Sala de jogos', 20, 1003),
('SpaceBreak', 75, 1002),
('SpaceBreak', 60, 1003),
('SpaceBreak', 50, 1003),
('SpaceBreak', 40, 1002),
('SpaceBreak', 10, 1002);

create table Sensor(
idSensor int primary key auto_increment,
modoSensor varchar(10) not null check (modoSensor = 'Entrada' or modoSensor = 'Saida'), 
fkLocal int 
)auto_increment = 500;

insert into Sensor (modoSensor, fkLocal) values
('Entrada', 100);

create table medidas (
idDados int primary key auto_increment,
fkSensor int,
	foreign key (fksensor) references sensor (idsensor),
chave int  not null,
datahora datetime not null
);

-- insert into Medidas (fksensor, idDados, presenca, datahora) values
-- (500, '1', 1, '2022-03-01 16:00'),
-- (500, '2', 1, '2022-03-01 16:00'),
-- (500, '3', 1, '2022-03-01 16:00'),
-- (500, '4', 1, '2022-03-01 16:00'),
-- (500, '5', 1, '2022-03-01 16:00'),
-- (501, '1', 1, '2022-03-01 18:00'),
-- (501, '2', 1, '2022-03-01 18:00'),
-- (508, '1', 1, '2022-03-01 9:00'),
-- (508, '2', 1, '2022-03-01 9:00'),
-- (508, '3', 1, '2022-03-01 9:00'),
-- (509, '1', 1, '2022-03-01 9:40'),
-- (509, '2', 1, '2022-03-01 9:40'),
-- (509, '3', 1, '2022-03-01 9:40'),
-- (512, '1', 1, '2022-03-01 12:00'),
-- (512, '2', 1, '2022-03-01 12:00'),
-- (512, '3', 1, '2022-03-01 12:00'),
-- (513, '1', 1, '2022-03-01 12:25'),
-- (513, '2', 1, '2022-03-01 12:25');

