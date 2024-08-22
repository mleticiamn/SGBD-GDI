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
