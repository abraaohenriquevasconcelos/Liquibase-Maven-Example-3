--liquibase formatted sql

--changeset lnadalete:01
--comment: Create main tables

CREATE TABLE leitor (
  id_leitor INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  nome VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL
);
  
CREATE UNIQUE INDEX id_leitor_UNIQUE on leitor(id_leitor ASC);


CREATE TABLE livro (
  id_livro INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  titulo VARCHAR(200) NOT NULL,
  editor VARCHAR(200) NOT NULL,
  edicao VARCHAR(200) NOT NULL,
  autor VARCHAR(200) NOT NULL,
  nr_paginas INTEGER NOT NULL);
  
  
  
CREATE TABLE historico (
  id_leitor INTEGER(11) NOT NULL,
  id_livro INTEGER(11) NOT NULL,
  data DATE NOT NULL,
  PRIMARY KEY (id_leitor, id_livro),
  CONSTRAINT fk_leitor_historico FOREIGN KEY (id_leitor)   REFERENCES leitor (id_leitor),
  CONSTRAINT fk_livro_historico  FOREIGN KEY (id_livro)    REFERENCES livro (id_livro)
 );
    
 CREATE INDEX fk_leitor_historico_idx ON historico (id_leitor ASC);
 CREATE INDEX fk_livro_historico_idx ON historico (id_livro ASC);  

 
 
--rollback PRAGMA foreign_keys = OFF;
--rollback drop table if exists historico;
--rollback drop table if exists livro;
--rollback drop table if exists leitor;
--rollback PRAGMA foreign_keys = ON;

--changeset NOME DE USUARIO
--comment: Data mass to test
 
 INSERT INTO livro(titulo,editor,edicao,autor,nr_paginas)  VALUES ('Livro 1','Novatec','4','Felipe Casseb',156);
INSERT INTO livro(titulo,editor,edicao,autor,nr_paginas)  VALUES ('Livro 2','Novatec','1','Felipe Casseb',200);
INSERT INTO livro(titulo,editor,edicao,autor,nr_paginas)  VALUES ('Livro 3','Novatec','2','Leonardo',233);
INSERT INTO livro(titulo,editor,edicao,autor,nr_paginas) VALUES ('Livro 4','Novatec','1','Miqueias',988);

--rollback DELETE FROM livro;