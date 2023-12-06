DROP DATABASE IF EXISTS chamaweb;
CREATE DATABASE chamaweb;
USE chamaweb;

CREATE TABLE usuarios (
    USR_MATRICULA VARCHAR(20) NOT NULL UNIQUE,
    USR_SENHA VARCHAR(255) NOT NULL,
    USR_EMAIL VARCHAR(255) NOT NULL,
    USR_ID INTEGER AUTO_INCREMENT PRIMARY KEY,
    USR_NOME VARCHAR(255) NOT NULL,
    FK_TIPOS_TIP_ID INTEGER
);

CREATE TABLE chamados (
    CHA_ID INTEGER AUTO_INCREMENT PRIMARY KEY,
    CHA_TITULO VARCHAR(255) NOT NULL,
    CHA_DATA DATE NOT NULL,
    CHA_DESCRICAO VARCHAR(255) NOT NULL,
    CHA_RESULTADO_AVALIACAO TINYINT(1),
    CHA_OBSERVACOES_AVALIACAO VARCHAR(1023),
    FK_MAQUINAS_MAQ_ID INTEGER,
    FK_USUARIOS_USR_ID INTEGER,
    FK_USUARIOS_USR_ID_TECNICO INTEGER,
    FK_CATEGORIAS_CAT_ID INTEGER,
    FK_PRIORIDADES_PRI_ID INTEGER,
    FK_ESTADOS_EST_ID INTEGER
);

CREATE TABLE maquinas (
    MAQ_ID INTEGER AUTO_INCREMENT PRIMARY KEY,
    MAQ_MARCA VARCHAR(255) NOT NULL,
    MAQ_MODELO VARCHAR(255) NOT NULL,
    MAQ_PROCESSADOR VARCHAR(255) NOT NULL,
    MAQ_RAM VARCHAR(255) NOT NULL,
    MAQ_OS VARCHAR(255) NOT NULL,
    MAQ_ATIVO TINYINT(1) NOT NULL,
    FK_LABORATORIOS_LAB_ID INTEGER
);

CREATE TABLE laboratorios (
    LAB_ID INTEGER AUTO_INCREMENT PRIMARY KEY,
    LAB_NOME VARCHAR(255) NOT NULL UNIQUE,
    LAB_ATIVO TINYINT(1) NOT NULL
);

CREATE TABLE categorias (
    CAT_ID INTEGER AUTO_INCREMENT PRIMARY KEY,
    CAT_NOME VARCHAR(255) NOT NULL UNIQUE,
    CAT_ATIVO TINYINT(1) NOT NULL
);

CREATE TABLE estados (
    EST_ID INTEGER AUTO_INCREMENT PRIMARY KEY,
    EST_NOME VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE prioridades (
    PRI_ID INTEGER AUTO_INCREMENT PRIMARY KEY,
    PRI_NOME VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE tipos (
    TIP_ID INTEGER AUTO_INCREMENT PRIMARY KEY,
    TIP_NOME VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE operacoes (
    OPS_ID INTEGER AUTO_INCREMENT PRIMARY KEY,
    OPS_DESCRICAO TEXT NOT NULL,
    OPS_DATA DATE NOT NULL,
    FK_CHAMADOS_CHA_ID INTEGER,
    FK_USUARIOS_USR_ID INTEGER
);

CREATE TABLE mensagens (
    MSG_ID INTEGER AUTO_INCREMENT PRIMARY KEY,
    MSG_CONTEUDO VARCHAR(255) NOT NULL,
    FK_CHAMADOS_CHA_ID INTEGER,
    FK_USUARIOS_USR_ID INTEGER
);
 
ALTER TABLE usuarios ADD CONSTRAINT FK_USUARIOS_2
    FOREIGN KEY (FK_TIPOS_TIP_ID)
    REFERENCES TIPOS (TIP_ID)
    ON DELETE CASCADE;
 
ALTER TABLE chamados ADD CONSTRAINT FK_CHAMADOS_2
    FOREIGN KEY (FK_MAQUINAS_MAQ_ID)
    REFERENCES MAQUINAS (MAQ_ID)
    ON DELETE CASCADE;
 
ALTER TABLE chamados ADD CONSTRAINT FK_CHAMADOS_3
    FOREIGN KEY (FK_USUARIOS_USR_ID)
    REFERENCES USUARIOS (USR_ID)
    ON DELETE CASCADE;

ALTER TABLE chamados ADD CONSTRAINT FK_CHAMADOS_4
    FOREIGN KEY (FK_USUARIOS_USR_ID_TECNICO)
    REFERENCES USUARIOS (USR_ID)
    ON DELETE CASCADE;
 
ALTER TABLE chamados ADD CONSTRAINT FK_CHAMADOS_5
    FOREIGN KEY (FK_CATEGORIAS_CAT_ID)
    REFERENCES CATEGORIAS (CAT_ID)
    ON DELETE CASCADE;
 
ALTER TABLE chamados ADD CONSTRAINT FK_CHAMADOS_6
    FOREIGN KEY (FK_PRIORIDADES_PRI_ID)
    REFERENCES PRIORIDADES (PRI_ID)
    ON DELETE SET NULL;
 
ALTER TABLE chamados ADD CONSTRAINT FK_CHAMADOS_7
    FOREIGN KEY (FK_ESTADOS_EST_ID)
    REFERENCES ESTADOS (EST_ID)
    ON DELETE CASCADE;
 
ALTER TABLE maquinas ADD CONSTRAINT FK_MAQUINAS_2
    FOREIGN KEY (FK_LABORATORIOS_LAB_ID)
    REFERENCES LABORATORIOS (LAB_ID)
    ON DELETE CASCADE;
 
ALTER TABLE operacoes ADD CONSTRAINT FK_OPERACOES_2
    FOREIGN KEY (FK_CHAMADOS_CHA_ID)
    REFERENCES CHAMADOS (CHA_ID)
    ON DELETE CASCADE;
 
ALTER TABLE operacoes ADD CONSTRAINT FK_OPERACOES_3
    FOREIGN KEY (FK_USUARIOS_USR_ID)
    REFERENCES USUARIOS (USR_ID)
    ON DELETE CASCADE;
 
ALTER TABLE mensagens ADD CONSTRAINT FK_MENSAGENS_2
    FOREIGN KEY (FK_CHAMADOS_CHA_ID)
    REFERENCES CHAMADOS (CHA_ID)
    ON DELETE CASCADE;
 
ALTER TABLE mensagens ADD CONSTRAINT FK_MENSAGENS_3
    FOREIGN KEY (FK_USUARIOS_USR_ID)
    REFERENCES USUARIOS (USR_ID)
    ON DELETE CASCADE;

INSERT INTO estados(EST_NOME) VALUES ("Pendente"), ("Em Progresso"), ("Concluído");
INSERT INTO tipos(TIP_NOME) VALUES ("Técnico"), ("Usuário");
INSERT INTO prioridades(PRI_NOME) VALUES ("Baixa"), ("Média"), ("Alta");
INSERT INTO usuarios(USR_MATRICULA, USR_SENHA, USR_EMAIL, USR_NOME, FK_TIPOS_TIP_ID) VALUES
    ("tecnico1", "1234", "sgm001@chamaweb.com", "Sérgio Seleno", 1),
    ("tecnico2", "1234", "sgm002@chamaweb.com", "Robson Robson", 1),
    ("usuario1", "1234", "sgm003@chamaweb.com", "Jonas Johnson", 2),
    ("usuario2", "1234", "sgm004@chamaweb.com", "Renato Russo", 2);
