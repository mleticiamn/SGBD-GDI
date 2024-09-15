-- TIPOS
-- Ainda vou adicionar todos os métodos
CREATE OR REPLACE TYPE tp_telefones AS OBJECT(
    numero VARCHAR2 (11)
);
/
    
CREATE OR REPLACE TYPE va_tp_telefones AS VARRAY(5) OF tp_telefones;
/
    
CREATE OR REPLACE TYPE tp_usuario AS OBJECT(
    email VARCHAR2(50),
    nome VARCHAR2(50),
    sobrenome VARCHAR2(50),
    data_nasc DATE,
    lista_telefones va_tp_telefones
) NOT FINAL;
/
    
CREATE OR REPLACE TYPE tp_premios AS OBJECT(
    nome_premio VARCHAR2(50)
);
/
    
CREATE OR REPLACE TYPE tp_nt_premios AS TABLE OF REF tp_premios;
/
    
CREATE OR REPLACE TYPE tp_autor UNDER tp_usuario(
    biografia VARCHAR2(250),
    lista_premios tp_nt_premios
);
/
    
CREATE OR REPLACE TYPE tp_publicacao AS OBJECT(
  	email REF tp_usuario,
	cod_pub NUMBER,
  	conteudo VARCHAR2(700),
  	data_pub DATE
);
/
    
CREATE OR REPLACE TYPE tp_usuario_pub AS OBJECT(
	email REF tp_usuario,
  	cod_pub REF tp_publicacao
);
/
    
CREATE OR REPLACE TYPE tp_autores AS OBJECT(
	autor VARCHAR2(50)
);
/
    
CREATE OR REPLACE TYPE tp_nt_autores AS TABLE OF REF tp_autores;
/
    
CREATE OR REPLACE TYPE tp_obra AS OBJECT(
  	cod_obra NUMBER,
  	titulo VARCHAR2(50),
  	email_cad REF tp_usuario_pub,
  	pub_cad REF tp_usuario_pub,
  	lista_autores tp_nt_autores,
  	genero VARCHAR2(10)
);
/
    
CREATE OR REPLACE TYPE tp_sinopses AS OBJECT(
  	obra REF tp_obra,
	sinopse VARCHAR2(400)
);
/
    
CREATE OR REPLACE TYPE tp_referenciar AS OBJECT(
	cod_obra REF tp_obra,
  	email REF tp_usuario_pub,
  	cod_pub REF tp_usuario_pub
);
/
    
CREATE OR REPLACE TYPE tp_comentario AS OBJECT(
  	email REF tp_publicacao,
	cod_pub REF tp_publicacao,
  	cod_com NUMBER,
  	conteudo VARCHAR2 (100)
);
/
    
CREATE OR REPLACE TYPE tp_comentar AS OBJECT(
	email REF tp_usuario,
  	cod_pub REF tp_publicacao,
  	cod_com REF tp_comentario
);
/
    
CREATE OR REPLACE TYPE tp_seguir AS OBJECT(
	seguidor REF tp_usuario,
  	seguido REF tp_usuario
);
/
    
CREATE OR REPLACE TYPE tp_curtir AS OBJECT(
	email_curte REF tp_usuario,
  	email_publicou REF tp_usuario,
  	cod_pub REF tp_publicacao
);
/

