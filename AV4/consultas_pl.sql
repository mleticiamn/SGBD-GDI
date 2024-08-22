/* Exibe todos os usuários da plataforma que nasceram antes do ano 2000,
incluindo seus respectivos emails, nomes, sobrenomes e datas de nascimento */
DECLARE
    CURSOR usuario_cursor IS
        SELECT u.email, u.nome, u.sobrenome, u.data_nasc FROM usuario u
        WHERE u.data_nasc < TO_DATE('01-01-2000', 'DD-MM-YYYY');
        
    v_email       usuario.email%TYPE;
    v_nome        usuario.nome%TYPE;
    v_sobrenome   usuario.sobrenome%TYPE;
    v_data_nasc   usuario.data_nasc%TYPE;

BEGIN
    OPEN usuario_cursor;
    LOOP
        FETCH usuario_cursor INTO v_email, v_nome, v_sobrenome, v_data_nasc;
        EXIT WHEN usuario_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Email: ' || v_email || ', Nome: ' || v_nome || ' ' || v_sobrenome || ', Data de Nascimento: ' || TO_CHAR(v_data_nasc, 'DD-MM-YYYY'));
    END LOOP;
    CLOSE usuario_cursor;
END;
