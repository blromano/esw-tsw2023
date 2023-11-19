CREATE DATABASE IF NOT EXISTS VOTOLYZE;

USE VOTOLYZE;

CREATE TABLE POLITICOS (
                           PLT_TIPO_CANDIDATURA ENUM('Vereador(a)', 'Prefeito(a)') NOT NULL,
                           PLT_INICIO_MANDATO DATE,
                           USR_ID INTEGER AUTO_INCREMENT PRIMARY KEY,
                           USR_NOME VARCHAR(255) NOT NULL,
                           USR_SEXO ENUM('M', 'F') NOT NULL,
                           USR_DATA_NASCIMENTO DATE NOT NULL,
                           USR_EMAIL VARCHAR(255) NOT NULL UNIQUE,
                           USR_CPF VARCHAR(11) NOT NULL,
                           USR_SENHA VARCHAR(128) NOT NULL,
                           FK_PARTIDOS_PRT_ID INTEGER,
                           UNIQUE (USR_CPF)
);

CREATE TABLE ELEITORES (
                           USR_ID INTEGER AUTO_INCREMENT PRIMARY KEY,
                           USR_NOME VARCHAR(255) NOT NULL,
                           USR_SEXO ENUM('M', 'F') NOT NULL,
                           USR_DATA_NASCIMENTO DATE NOT NULL,
                           USR_EMAIL VARCHAR(255) UNIQUE,
                           USR_CPF VARCHAR(11) NOT NULL,
                           USR_SENHA VARCHAR(128) NOT NULL,
                           UNIQUE (USR_CPF)
);



CREATE TABLE PROMESSAS (
                           PRM_ID INTEGER AUTO_INCREMENT PRIMARY KEY,
                           PRM_TITULO VARCHAR(255) NOT NULL,
                           PRM_DESCRICAO VARCHAR(255) NOT NULL,
                           PRM_DATA DATE NOT NULL,
                           FK_POLITICOS_USR_ID INTEGER
);

CREATE TABLE COMENTARIOS (
                             CMT_ID INTEGER AUTO_INCREMENT PRIMARY KEY,
                             CMT_MENSAGEM VARCHAR(255) NOT NULL,
                             FK_PROMESSAS_PRM_ID INTEGER,
                             FK_ELEITORES_USR_ID INTEGER
);

CREATE TABLE PARTIDOS (
                          PRT_ID INTEGER AUTO_INCREMENT PRIMARY KEY,
                          PRT_NOME VARCHAR(40) NOT NULL,
                          PRT_SIGLA VARCHAR(15) NOT NULL,
                          UNIQUE (PRT_NOME, PRT_SIGLA)
);

CREATE TABLE CURTIDAS (
                          FK_ELEITORES_USR_ID INTEGER,
                          FK_PROMESSAS_PRM_ID INTEGER,
                          CRT_ID INTEGER AUTO_INCREMENT PRIMARY KEY,
                          CRT_DATA DATE NOT NULL
);

CREATE TABLE DESCURTIDAS (
                             FK_ELEITORES_USR_ID INTEGER,
                             FK_PROMESSAS_PRM_ID INTEGER,
                             DCT_ID INTEGER AUTO_INCREMENT PRIMARY KEY,
                             DCT_DATE DATE NOT NULL
);

ALTER TABLE POLITICOS ADD CONSTRAINT FK_POLITICOS_2
    FOREIGN KEY (FK_PARTIDOS_PRT_ID)
        REFERENCES PARTIDOS (PRT_ID)
        ON DELETE CASCADE;

ALTER TABLE PROMESSAS ADD CONSTRAINT FK_PROMESSAS_2
    FOREIGN KEY (FK_POLITICOS_USR_ID)
        REFERENCES POLITICOS (USR_ID)
        ON DELETE CASCADE;

ALTER TABLE COMENTARIOS ADD CONSTRAINT FK_COMENTARIOS_2
    FOREIGN KEY (FK_PROMESSAS_PRM_ID)
        REFERENCES PROMESSAS (PRM_ID)
        ON DELETE CASCADE;

ALTER TABLE COMENTARIOS ADD CONSTRAINT FK_COMENTARIOS_3
    FOREIGN KEY (FK_ELEITORES_USR_ID)
        REFERENCES ELEITORES (USR_ID)
        ON DELETE CASCADE;

ALTER TABLE CURTIDAS ADD CONSTRAINT FK_CURTIDAS_2
    FOREIGN KEY (FK_ELEITORES_USR_ID)
        REFERENCES ELEITORES (USR_ID)
        ON DELETE SET NULL;

ALTER TABLE CURTIDAS ADD CONSTRAINT FK_CURTIDAS_3
    FOREIGN KEY (FK_PROMESSAS_PRM_ID)
        REFERENCES PROMESSAS (PRM_ID)
        ON DELETE SET NULL;

ALTER TABLE DESCURTIDAS ADD CONSTRAINT FK_DESCURTIDAS_2
    FOREIGN KEY (FK_ELEITORES_USR_ID)
        REFERENCES ELEITORES (USR_ID)
        ON DELETE SET NULL;

ALTER TABLE DESCURTIDAS ADD CONSTRAINT FK_DESCURTIDAS_3
    FOREIGN KEY (FK_PROMESSAS_PRM_ID)
        REFERENCES PROMESSAS (PRM_ID)
        ON DELETE SET NULL; 
