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

