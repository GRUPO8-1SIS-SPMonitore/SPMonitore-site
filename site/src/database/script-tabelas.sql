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

create table usuario(
idUsuario int primary key auto_increment,
nome varchar(35) not null,
email varchar(40) not null unique,
senha varchar(20) not null,
fkfaculdade int ,
foreign key (fkFaculdade) references Faculdade (idFaculdade)
)auto_increment = 1;
INSERT INTO usuario (nome, email,fkFaculdade, senha) VALUES ('deb', 'deb@gmail.com', '1001', '123');

drop table usuario;
create table tbLocal(
idLocal int primary key auto_increment,
Nome varchar(30) not null,
qtdMaxima int not null check (qtdMaxima > 0),
fkFaculdade int,
foreign key (fkFaculdade) references Faculdade (idFaculdade)
)auto_increment = 100;

create table Sensor(
idSensor int primary key auto_increment,
modoSensor varchar(10) not null check (modoSensor = 'Entrada' or modoSensor = 'Saida'), 
fkLocal int 
)auto_increment = 500;

create table medidas (
idDados int primary key auto_increment,
fkSensor int,
	foreign key (fksensor) references sensor (idsensor),
chave int  not null,
datahora datetime not null
);
drop table medidas;
select * from medidas;
truncate medidas;
select
        chave,
                        datahora,
                        DATE_FORMAT(datahora,'%H:%i:%s') as datahora
                    from medidas
                    where fkSensor = 500
                    order by idDados desc limit 7;

select chave, count(chave) from medidas group by chave;
select * from medidas;

insert into Faculdade (nome, CNPJ, contato, cidade) values
('SpTech', '05.312.647/0001-72', '(11) 3589-4043', 'São Paulo');
select * from Faculdade;
insert into usuario (nome, email, telefone, senha, fkFaculdade) values
('Wesley Souza', 'Wesley.souza@sptech.school', '11987456784', '123456', 1),
('Marcos Brito', 'Marcos.Brito@sptech.school', '11989332784', '654321', 1),
('Ana Beatriz', 'Ana.Beatriz@sptech.school', '11987000986', '356432', 1),
('Antonia Marques', 'Antonia.Marques@unip.uni', '11990459795', '333r56', 2),
('Lauro Martins', 'Lauro.Martins@unip.uni', '11919451121', '2234e6', 2),
('Silvio Mendes', 'Silvio.Mendes@ufrj.uni', '21947757763', '55563a', 3),
('Marcia Gomes', 'Marcia.Gomes@ufrj.uni', '21989899784', 'abcde2', 3),
('Aurélio matias', 'Aurelio.Matias@unibrasil.com', '41917411143', '1234ac', 4),
('Paula Sandra', 'Paula.Sandra@unibrasil.com', '41923477781', 'gdr456', 4);

insert into tblocal (nome, qtdMaxima, fkFaculdade) values
('Biblioteca',50, 1), 
('Biblioteca', 200, 2),
('Biblioteca', 150, 3),
('Biblioteca', 20, 4),
('Sala de jogos', 25, 1),
('Sala de jogos', 20, 2),
('SpaceBreak', 75, 1),
('SpaceBreak', 60, 1),
('SpaceBreak', 50, 2),
('SpaceBreak', 40, 3),
('SpaceBreak', 10, 4);

insert into Sensor (modoSensor, fkLocal) values
('Entrada', 100);
select * from Sensor;


insert into dados (fksensor, idDados, presenca, datahora) values
(500, '1', 1, '2022-03-01 16:00'),
(500, '2', 1, '2022-03-01 16:00'),
(500, '3', 1, '2022-03-01 16:00'),
(500, '4', 1, '2022-03-01 16:00'),
(500, '5', 1, '2022-03-01 16:00'),
(501, '1', 1, '2022-03-01 18:00'),
(501, '2', 1, '2022-03-01 18:00'),
(508, '1', 1, '2022-03-01 9:00'),
(508, '2', 1, '2022-03-01 9:00'),
(508, '3', 1, '2022-03-01 9:00'),
(509, '1', 1, '2022-03-01 9:40'),
(509, '2', 1, '2022-03-01 9:40'),
(509, '3', 1, '2022-03-01 9:40'),
(512, '1', 1, '2022-03-01 12:00'),
(512, '2', 1, '2022-03-01 12:00'),
(512, '3', 1, '2022-03-01 12:00'),
(513, '1', 1, '2022-03-01 12:25'),
(513, '2', 1, '2022-03-01 12:25');
