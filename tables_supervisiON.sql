CREATE DATABASE SuperVisiON;

USE SuperVisiON;


CREATE TABLE tbOrganizacao(

idOrganizacao INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100),
cnpj CHAR(14)
);

CREATE TABLE tbUsuario(

idUsuario INT PRIMARY KEY AUTO_INCREMENT,
fk_idOrganizacao INT,
nome VARCHAR(100),
cpf CHAR(11),
senha VARCHAR(20),
telefone CHAR(11),
cargo VARCHAR(50),
statusServico VARCHAR(45),
FOREIGN KEY (fk_idOrganizacao) REFERENCES tbOrganizacao(idOrganizacao)
);

CREATE TABLE tbEvento(

idEvento INT PRIMARY KEY AUTO_INCREMENT,
fk_idOrganizacao INT,
nome VARCHAR(100),
data DATE,
time1 VARCHAR(50),
time2 VARCHAR(50),
FOREIGN KEY (fk_idOrganizacao) REFERENCES tbOrganizacao(idOrganizacao)
);

CREATE TABLE tbComputadores(

idComputador INT PRIMARY KEY AUTO_INCREMENT,
fk_idEvento INT,
apelidoComputador VARCHAR(50),
numCpu INT,
FOREIGN KEY (fk_idEvento) REFERENCES tbEvento(idEvento)
);

CREATE TABLE tbOcorrencia(

idOcorrencia INT PRIMARY KEY AUTO_INCREMENT,
fk_idComputador INT,
status VARCHAR(45),
operador VARCHAR(100),
FOREIGN KEY (fk_idComputador) REFERENCES tbComputadores(idComputador)
);

CREATE TABLE tbMonitoramento(

dataHora DATETIME PRIMARY KEY,
fk_idComputador INT,
cpuTemp INT,
cpuFreq INT,
gpuTemp INT,
gpuFreq INT,
redeLatencia INT,
redePacote INT,
disco INT,
ram INT,
FOREIGN KEY (fk_idComputador) REFERENCES tbComputadores(idComputador)
);