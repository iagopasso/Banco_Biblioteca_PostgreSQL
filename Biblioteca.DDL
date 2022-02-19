
CREATE TABLE Associados (
    id_associado serial  NOT NULL,
    nome_associado varchar(100)  NOT NULL,
    telefone int  NULL,
    email varchar(50)  NULL,
    adimplente boolean  NOT NULL,
    CONSTRAINT Associados_pk PRIMARY KEY (id_associado)
);

CREATE TABLE Autores (
    id_autor serial  NOT NULL,
    nome_autor varchar(50)  NOT NULL,
    CONSTRAINT Autores_pk PRIMARY KEY (id_autor)
);

CREATE TABLE Bibliotecarios (
    id_bibliotecario serial  NOT NULL,
    nome_bibliotecario varchar(50)  NOT NULL,
    CONSTRAINT Bibliotecarios_pk PRIMARY KEY (id_bibliotecario)
);

CREATE TABLE Categorias (
    id_categoria serial  NOT NULL,
    nome_categoria varchar(50)  NOT NULL,
    CONSTRAINT Categorias_pk PRIMARY KEY (id_categoria)
);

CREATE TABLE Emprestimos (
    id_emprestimo serial  NOT NULL,
    estado_sair varchar(50)  NOT NULL,
    estado_retornar varchar(50)  NOT NULL,
    data_hora_emprestimo timestamp  NOT NULL,
    data_hora_devolucao timestamp  NOT NULL,
    associados_id int  NOT NULL,
    bibliotecarios_id int  NOT NULL,
    exemplares_id int  NOT NULL,
    CONSTRAINT Emprestimos_pk PRIMARY KEY (id_emprestimo)
);

CREATE TABLE Exemplares_dos_titulos (
    id_exemplar serial  NOT NULL,
    registro_baixa timestamp  NULL,
    data_hora_entrada timestamp  NOT NULL,
    destinacao varchar(100)  NOT NULL,
    local_bibli varchar(100)  NOT NULL,
    situacao_emprestimo boolean  NOT NULL,
    estado_titulo varchar(100)  NOT NULL,
    titulos_id int  NOT NULL,
    CONSTRAINT Exemplares_dos_titulos_pk PRIMARY KEY (id_exemplar)
);

CREATE TABLE Titulos_bibliograficos (
    id_titulo serial  NOT NULL,
    nome_titulo varchar(50)  NOT NULL,
    tipo_titulo varchar(100)  NOT NULL,
    num_paginas int  NOT NULL,
    num_edicao varchar(50)  NOT NULL,
    categoria int  NOT NULL,
    CONSTRAINT Titulos_bibliograficos_pk PRIMARY KEY (id_titulo)
);

CREATE TABLE Titulos_dos_autores (
    titulos_autor_id serial  NOT NULL,
    titulos_id int  NOT NULL,
    autores_id int  NOT NULL,
    CONSTRAINT Titulos_dos_autores_pk PRIMARY KEY (titulos_autor_id)
);

ALTER TABLE Emprestimos ADD CONSTRAINT Emprestimos_Associados
    FOREIGN KEY (associados_id)
    REFERENCES Associados (id_associado)
    ON DELETE  RESTRICT 
    ON UPDATE  CASCADE 
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

ALTER TABLE Emprestimos ADD CONSTRAINT Emprestimos_Bibliotecarios
    FOREIGN KEY (bibliotecarios_id)
    REFERENCES Bibliotecarios (id_bibliotecario)
    ON DELETE  RESTRICT 
    ON UPDATE  CASCADE 
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

ALTER TABLE Emprestimos ADD CONSTRAINT Emprestimos_Exemplares_dos_titulos
    FOREIGN KEY (exemplares_id)
    REFERENCES Exemplares_dos_titulos (id_exemplar)
    ON DELETE  RESTRICT 
    ON UPDATE  CASCADE 
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

ALTER TABLE Exemplares_dos_titulos ADD CONSTRAINT Exemplares_dos_titulos_Titulos_bibliograficos
    FOREIGN KEY (titulos_id)
    REFERENCES Titulos_bibliograficos (id_titulo)
    ON DELETE  RESTRICT 
    ON UPDATE  CASCADE 
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

ALTER TABLE Titulos_dos_autores ADD CONSTRAINT Titulos_bibliograficos_Autores_Autores
    FOREIGN KEY (autores_id)
    REFERENCES Autores (id_autor)
    ON DELETE  RESTRICT 
    ON UPDATE  CASCADE 
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

ALTER TABLE Titulos_dos_autores ADD CONSTRAINT Titulos_bibliograficos_Autores_Titulos_bibliograficos
    FOREIGN KEY (titulos_id)
    REFERENCES Titulos_bibliograficos (id_titulo)
    ON DELETE  RESTRICT 
    ON UPDATE  CASCADE 
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

ALTER TABLE Titulos_bibliograficos ADD CONSTRAINT Titulos_bibliograficos_Categorias
    FOREIGN KEY (categoria)
    REFERENCES Categorias (id_categoria)
    ON DELETE  RESTRICT 
    ON UPDATE  CASCADE 
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;
