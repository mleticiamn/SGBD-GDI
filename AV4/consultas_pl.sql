/* Calcula e exibe a quantidade de seguidores de cada usuário na plataforma, exibindo também a média de seguidores por usuário. 
O resultado inclui o email, o nome completo e a quantidade de seguidores de cada usuário. */
DECLARE
    v_email usuario.email%TYPE;
    v_nome usuario.nome%TYPE;
    v_sobrenome usuario.sobrenome%TYPE;
    v_qtd_seguidores NUMBER;
    v_media_seguidores NUMBER;

    CURSOR c_seguidores IS
        SELECT u.email, u.nome, u.sobrenome, COUNT(s.seguidor) AS qtd_seguidores FROM usuario u
        LEFT JOIN seguir s ON u.email = s.seguido
        GROUP BY u.email, u.nome, u.sobrenome;
    
    v_soma_total NUMBER := 0;
    v_contador NUMBER := 0;

BEGIN
    OPEN c_seguidores;
    
    LOOP
        FETCH c_seguidores INTO v_email, v_nome, v_sobrenome, v_qtd_seguidores;
        EXIT WHEN c_seguidores%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE('Email: ' || v_email || ', Usuário(a): ' || v_nome || ' ' || v_sobrenome || ', Quantidade de Seguidores: ' || v_qtd_seguidores);
        
        v_soma_total := v_soma_total + v_qtd_seguidores;
        v_contador := v_contador + 1;
    END LOOP;
    
    CLOSE c_seguidores;

    IF v_contador > 0 THEN
        v_media_seguidores := v_soma_total / v_contador;
    ELSE
        v_media_seguidores := 0;
    END IF;
    
    DBMS_OUTPUT.PUT_LINE('Média de Seguidores por Usuário: ' || v_media_seguidores);
END;
/

/* Exibe todas as publicações na plataforma, incluindo detalhes como o email do autor, o código da publicação, o conteúdo, a data de publicação, e o nome completo do autor. 
Cada publicação é exibida com um separador para melhor legibilidade. */
CREATE OR REPLACE FUNCTION listar_publicacoes
RETURN SYS_REFCURSOR
IS
    v_cursor SYS_REFCURSOR;
BEGIN
    OPEN v_cursor FOR
        SELECT p.email, p.cod_pub, p.conteudo, p.data_pub, a.nome, u.sobrenome FROM publicacao p
        JOIN usuario a ON p.email = a.email
        JOIN usuario u ON p.email = u.email;

    RETURN v_cursor;
    
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro inesperado: ' || SQLERRM);
        RETURN NULL;
END;
/

DECLARE
    v_cursor SYS_REFCURSOR;
    v_email VARCHAR2(50);
    v_cod_pub NUMBER;
    v_conteudo VARCHAR2(700);
    v_data_pub DATE;
    v_nome VARCHAR2(50);
    v_sobrenome VARCHAR2(50);
BEGIN
    v_cursor := listar_publicacoes;
    
    LOOP
        FETCH v_cursor INTO v_email, v_cod_pub, v_conteudo, v_data_pub, v_nome, v_sobrenome;
        EXIT WHEN v_cursor%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE('Usuário(a): ' || v_nome || ' ' || v_sobrenome);
        DBMS_OUTPUT.PUT_LINE('Código da Publicação: ' || v_cod_pub);
        DBMS_OUTPUT.PUT_LINE('Conteúdo: ' || v_conteudo);
        DBMS_OUTPUT.PUT_LINE('Data de Publicação: ' || TO_CHAR(v_data_pub, 'DD/MM/YYYY'));
        DBMS_OUTPUT.PUT_LINE(' ' || ' ');
    END LOOP;
    
    CLOSE v_cursor;
END;
/

/* Verifica a atividade de um usuário com base no número de publicações. Se o usuário tiver mais de 10 publicações, é 
considerado ativo. Já se ele tem entre 5 e 10 publicações, é considerado moderado. Por fim, se ele tiver menos de 5 
publicações, ele é considerado inativo. */
CREATE OR REPLACE FUNCTION verificar_atividade_usuario (p_email IN VARCHAR2)
RETURN VARCHAR2
IS
    v_num_pub NUMBER;
    v_mensagem VARCHAR2(50);
BEGIN
    SELECT COUNT(*) INTO v_num_pub FROM publicacao
    WHERE email = p_email;

    IF v_num_pub > 10 THEN
        v_mensagem := 'Usuário ativo';
    ELSIF v_num_pub BETWEEN 5 AND 10 THEN
        v_mensagem := 'Usuário moderado';
    ELSE
        v_mensagem := 'Usuário inativo';
    END IF;

    RETURN v_mensagem;
    
EXCEPTION
    WHEN OTHERS THEN
        RETURN 'Erro inesperado: ' || SQLERRM;
END;
/

DECLARE
    v_email VARCHAR2(50) := 'pms5@cin.ufpe.br';
    v_mensagem VARCHAR2(50);
BEGIN
    v_mensagem := verificar_atividade_usuario(v_email);
    DBMS_OUTPUT.PUT_LINE('Atividade do usuário: ' || v_mensagem);
END;
/

/* Calcula e exibe a classificação de cada usuário com base no número de seguidores em lotes. A classificação do usuário pode ser
influente, popular ou  novato */
CREATE OR REPLACE PROCEDURE classificar_usuario (
    p_email IN VARCHAR2,
    p_lote IN NUMBER,
    p_result OUT VARCHAR2
)
IS
    v_total_seguidores NUMBER := 0;
    v_count NUMBER := 0;
BEGIN
    SELECT COUNT(*) INTO v_count FROM seguir
    WHERE seguido = p_email;

    WHILE v_total_seguidores < v_count LOOP
        v_total_seguidores := v_total_seguidores + LEAST(v_count - v_total_seguidores, p_lote);
    END LOOP;

    p_result := CASE
                   WHEN v_total_seguidores > 10 THEN 'Influente'
                   WHEN v_total_seguidores BETWEEN 5 AND 10 THEN 'Popular'
                   ELSE 'Novato'
                END;
END;
/

DECLARE
    v_classificacao VARCHAR2(50);
BEGIN
    classificar_usuario(
        p_email => 'jane.austen@gmail.com',
        p_lote => 1,
        p_result => v_classificacao
    );

    DBMS_OUTPUT.PUT_LINE('Classificação do usuário: ' || v_classificacao);
END;
/
    
/* Calcula e exibe a quantidade de telefones que cada usuário possui na plataforma, incluindo o email do usuário e o número 
dos telefones associados. Além disso, no fim, o resultado é exibido de forma ordenada pelo email do usuário. */
CREATE OR REPLACE PACKAGE UsuarioTelefone_Package AS
    TYPE RefCursor IS REF CURSOR;
    PROCEDURE ListarUsuariosETelefones(p_cursor OUT RefCursor);
END UsuarioTelefone_Package;
/

CREATE OR REPLACE PACKAGE BODY UsuarioTelefone_Package AS
    PROCEDURE ListarUsuariosETelefones(p_cursor OUT RefCursor) IS
    BEGIN
        OPEN p_cursor FOR
            SELECT u.email, t.telefone FROM usuario u
            LEFT JOIN telefones t ON u.email = t.email
            ORDER BY u.email;
    END ListarUsuariosETelefones;
END UsuarioTelefone_Package;
/

DECLARE
    v_cursor UsuarioTelefone_Package.RefCursor;
    v_email usuario.email%TYPE;
    v_telefone telefones.telefone%TYPE;
BEGIN
    UsuarioTelefone_Package.ListarUsuariosETelefones(p_cursor => v_cursor);
    
    LOOP
        FETCH v_cursor INTO v_email, v_telefone;
        EXIT WHEN v_cursor%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE('Email: ' || v_email);
        DBMS_OUTPUT.PUT_LINE('Telefone: ' || NVL(v_telefone, 'Nenhum telefone'));
        DBMS_OUTPUT.PUT_LINE('-------------------------');
    END LOOP;
    
    CLOSE v_cursor;
END;
/

/* Exibe informações de todos os usuários da tabela usuario, incluindo email, nome, sobrenome e data de nascimento. */
DECLARE
    v_usuario usuario%ROWTYPE;
    CURSOR usuario_cursor IS
        SELECT * FROM usuario;
BEGIN
    FOR v_usuario IN usuario_cursor LOOP
        DBMS_OUTPUT.PUT_LINE('Email: ' || v_usuario.email);
        DBMS_OUTPUT.PUT_LINE('Nome: ' || v_usuario.nome);
        DBMS_OUTPUT.PUT_LINE('Sobrenome: ' || v_usuario.sobrenome);
        DBMS_OUTPUT.PUT_LINE('Data de Nascimento: ' || TO_CHAR(v_usuario.data_nasc, 'DD/MM/YYYY'));
        DBMS_OUTPUT.PUT_LINE(' ' || ' ');
    END LOOP;
END;
/
