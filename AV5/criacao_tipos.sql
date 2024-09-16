-- TIPO TELEFONE
CREATE OR REPLACE TYPE tp_telefones AS OBJECT(
    numero VARCHAR2 (11)
);
/
-- TIPO VARRAY TELEFONE
CREATE OR REPLACE TYPE va_tp_telefones AS VARRAY(3) OF tp_telefones;
/
-- TIPO USUÁRIO
CREATE OR REPLACE TYPE tp_usuario AS OBJECT(
    email VARCHAR2(50),
    nome VARCHAR2(50),
    sobrenome VARCHAR2(50),
    data_nasc DATE,
    lista_telefones va_tp_telefones,

    CONSTRUCTOR FUNCTION tp_usuario(email VARCHAR2, nome VARCHAR2, sobrenome VARCHAR2, data_nasc DATE, lista_telefones va_tp_telefones) RETURN SELF AS RESULT,

    MEMBER PROCEDURE print_info (SELF tp_usuario),
    FINAL MAP MEMBER FUNCTION qtdd_telefones RETURN NUMBER

) NOT FINAL;
/

CREATE OR REPLACE TYPE BODY tp_usuario AS
    CONSTRUCTOR FUNCTION tp_usuario(email VARCHAR2, nome VARCHAR2, sobrenome VARCHAR2, data_nasc DATE, lista_telefones va_tp_telefones) RETURN SELF AS RESULT IS
    BEGIN
        SELF.email := email;
        SELF.nome := nome;
        SELF.sobrenome := sobrenome;
        SELF.data_nasc := data_nasc;
        SELF.lista_telefones := lista_telefones;
        RETURN SELF;
    END;

    MEMBER PROCEDURE print_info (SELF tp_usuario) IS
    BEGIN
        DBMS_OUTPUT.PUT_LINE('email: ' || SELF.email);
        DBMS_OUTPUT.PUT_LINE('nome: ' || SELF.nome);
        DBMS_OUTPUT.PUT_LINE('sobrenome: ' || SELF.sobrenome);
        DBMS_OUTPUT.PUT_LINE('data de nascimento: ' || SELF.data_nasc);
        FOR i IN 1..SELF.lista_telefones. COUNT LOOP
            DBMS_OUTPUT.PUT_LINE('telefone ' || i || ': ' || SELF.lista_telefones(i).numero);
        END LOOP;
    END

    FINAL MAP MEMBER FUNCTION qtdd_telefones RETURN NUMBER IS
    BEGIN
            RETURN SELF.lista_telefones.COUNT;
    END;

END;
/
-- TIPO PREMIOS
CREATE OR REPLACE TYPE tp_premios AS OBJECT(
    premio VARCHAR2(20)
);
/
-- NESTED PREMIO
CREATE OR REPLACE TYPE tp_nt_premios AS TABLE OF tp_premios;
/
-- TIPO AUTOR
CREATE OR REPLACE TYPE tp_autor UNDER tp_usuario(
    biografia VARCHAR2(250),
    lista_premios tp_nt_premios,

    OVERRIDING MEMBER PROCEDURE print_info (SELF tp_autor)
);
/

CREATE OR REPLACE TYPE BODY tp_autor AS
    OVERRIDING MEMBER PROCEDURE print_info (SELF tp_autor) IS
    BEGIN
        DBMS_OUTPUT.PUT_LINE('email: ' || SELF.email);
        DBMS_OUTPUT.PUT_LINE('nome: ' || SELF.nome);
        DBMS_OUTPUT.PUT_LINE('sobrenome: ' || SELF.sobrenome);
        DBMS_OUTPUT.PUT_LINE('data de nascimento: ' || SELF.data_nasc);
        
        FOR i IN 1..SELF.lista_telefones. COUNT LOOP
            DBMS_OUTPUT.PUT_LINE('telefone ' || i || ': ' || SELF.lista_telefones(i).numero);
        END LOOP;

        DBMS_OUTPUT.PUT_LINE('biografia: ' || SELF.biografia);

        IF SELF.lista_premios IS NOT NULL AND SELF.lista_premios.COUNT > 0 THEN
            DBMS_OUTPUT.PUT_LINE('Prêmios:');
            FOR i IN 1..SELF.lista_premios.COUNT LOOP
                DBMS_OUTPUT.PUT_LINE('  Prêmio ' || i || ': ' || SELF.lista_premios(i).premio);
            END LOOP;
        ELSE
            DBMS_OUTPUT.PUT_LINE('Sem prêmios cadastrados.');
        END IF;

    END;
END;
/
-- TIPO PUBLICACAO
CREATE OR REPLACE TYPE tp_publicacao AS OBJECT(
  	email REF tp_usuario,
	cod_pub NUMBER,
  	conteudo VARCHAR2(700),
  	data_pub DATE
);
/
-- TIPO USUARIO-PUBLICACAO
CREATE OR REPLACE TYPE tp_usuario_pub AS OBJECT(
	email REF tp_usuario,
  	cod_pub REF tp_publicacao
);
/
-- TIPO AUTORES (DE UMA OBRA)
CREATE OR REPLACE TYPE tp_autores AS OBJECT(
	autor VARCHAR2(50)
);
/
-- NESTED AUTORES
CREATE OR REPLACE TYPE tp_nt_autores AS TABLE OF tp_autores;
/
-- TIPO GENEROS
CREATE OR REPLACE TYPE tp_generos AS OBJECT(
    genero VARCHAR2(15)
);
/
-- TIPO VARRAY GENEROS
CREATE OR REPLACE TYPE va_tp_generos AS VARRAY(3) OF tp_generos;
/
-- TIPO OBRA
CREATE OR REPLACE TYPE tp_obra AS OBJECT(
  	cod_obra NUMBER,
  	titulo VARCHAR2(50),
  	email_cad REF tp_usuario_pub,
  	pub_cad REF tp_usuario_pub,
  	lista_autores tp_nt_autores,
  	lista_generos va_tp_generos,

    MEMBER FUNCTION qtdd_autores RETURN NUMBER,
    ORDER MEMBER FUNCTION compare_titulo (x tp_obra) RETURN NUMBER
);
/

CREATE OR REPLACE TYPE BODY tp_obra AS
    MEMBER FUNCTION qtdd_autores RETURN NUMBER IS
    BEGIN
        RETURN SELF.lista_autores.COUNT;
    END;

    ORDER MEMBER FUNCTION compare_titulo (x tp_obra) RETURN NUMBER IS
    BEGIN
        IF SELF.titulo < x.titulo THEN
            RETURN -1;
        ELSIF SELF.titulo > x.titulo THEN
            RETURN 1;
        ELSE
            RETURN 0;
        ELSE IF;
    END;
END;
/
-- TIPO SINOPSES
CREATE OR REPLACE TYPE tp_sinopses AS OBJECT(
  	cod_obra REF tp_obra,
	sinopse VARCHAR2(400)
);
/
-- TIPO REFERENCIAR
CREATE OR REPLACE TYPE tp_referenciar AS OBJECT(
	cod_obra REF tp_obra,
  	email REF tp_usuario_pub,
  	cod_pub REF tp_usuario_pub
);
/
-- TIPO COMENTARIO
CREATE OR REPLACE TYPE tp_comentario AS OBJECT(
  	email REF tp_publicacao,
	cod_pub REF tp_publicacao,
  	cod_com NUMBER,
  	conteudo VARCHAR2 (100)
);
/
-- TIPO COMENTAR
CREATE OR REPLACE TYPE tp_comentar AS OBJECT(
	email REF tp_usuario,
  	cod_pub REF tp_publicacao,
  	cod_com REF tp_comentario
);
/
-- TIPO SEGUIR
CREATE OR REPLACE TYPE tp_seguir AS OBJECT(
	seguidor REF tp_usuario,
  	seguido REF tp_usuario
);
/
-- TIPO CURTIR
CREATE OR REPLACE TYPE tp_curtir AS OBJECT(
	email_curte REF tp_usuario,
  	email_publicou REF tp_usuario,
  	cod_pub REF tp_publicacao
);
/
