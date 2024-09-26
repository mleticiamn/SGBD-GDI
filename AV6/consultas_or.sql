-- Seleciona os emails dos usuários que possuem mais de 20 caracteres
SELECT U.email 
FROM tb_usuario U
WHERE LENGTH(U.email) > 20;

-- Descobre qual autor registrado tem mais prêmios e printa o seu nome completo
-- É uma consulta à nested table
SELECT A.nome_completo.nome AS nome, A.nome_completo.sobrenome AS sobrenome
FROM tb_autor A
WHERE CARDINALITY(A.lista_premios) = (
	SELECT MAX(CARDINALITY(B.lista_premios))
	FROM tb_autor B
);

-- Seleciona as publicações feitas em março de 2024 e exibe todos os atributos associados a essas publicações
SELECT DEREF(P.email).email AS email, P.cod_pub, P.conteudo, P.data_pub
FROM tb_publicacao P
WHERE P.data_pub >= TO_DATE('2024-03-01', 'YYYY-MM-DD')
	AND P.data_pub < TO_DATE('2024-04-01', 'YYYY-MM-DD');

-- Seleciona os usuários que realizaram publicações e exibe seus nomes em ordem alfabética, eliminando resultados duplicados
SELECT DISTINCT U.nome_completo.nome AS nome
FROM tb_usuario_pub T, tb_usuario U
WHERE u.email = DEREF(T.email).email
ORDER BY U.nome_completo.nome;

-- Seleciona o título de cada obra e os gêneros associados a ela. No fim, exibe os resultados em ordem alfabética de acordo com o título
-- É uma consulta à varray
SELECT O.titulo, G.genero
FROM tb_obra O,
	TABLE(O.lista_generos) G
ORDER BY O.titulo;

-- Seleciona o tamanho médio das sinopses por gênero
SELECT AVG(LENGTH(sinopse)) AS tamano_medio, genero
FROM(
    SELECT O.titulo, G.genero, S.sinopse 
    FROM tb_obra O, tb_sinopses S, 
    TABLE (O.lista_generos) G
    WHERE O.cod_obra = S.cod_obra.cod_obra )
GROUP BY genero;

-- Seleciona as informações das publicações do ano de 2024
SELECT U.email, U.nome_completo.nome AS nome, U.nome_completo.sobrenome AS sobrenome, P.cod_pub, P.conteudo, P.data_pub
FROM tb_usuario_pub UP
INNER JOIN tb_usuario U ON U.email = DEREF(UP.email).email
INNER JOIN tb_publicacao P ON P.cod_pub = DEREF(UP.cod_pub).cod_pub
WHERE P.data_pub > TO_DATE('31-12-2023', 'DD-MM-YYYY')  -- publicações do ano 2024
ORDER BY P.data_pub DESC;

-- Seleciona quantos comentarios por publicacao
SELECT P.cod_pub, P.conteudo, COUNT(C.cod_com) AS quantidade_comentarios
FROM tb_publicacao P
LEFT JOIN tb_comentario C ON C.cod_pub.cod_pub = P.cod_pub
GROUP BY P.cod_pub, P.conteudo
ORDER BY P.cod_pub, P.conteudo;

-- Seleciona os usuários que possuem a maior quantidade de telefones
SELECT U.nome_completo.nome AS nome, U.nome_completo.sobrenome AS sobrenome, U.email, U.qtdd_telefones() AS quantidade_telefones
FROM tb_usuario U
WHERE U.qtdd_telefones() = (
    SELECT MAX(U2.qtdd_telefones())
    FROM tb_usuario U2
);

--Seleciona os comentários de determinado usuário
SELECT CR.email.email AS EMAIL, CR.cod_pub.conteudo AS PUBLICACAO, CR.cod_com.conteudo AS COMENTARIO
FROM tb_comentar CR
WHERE CR.email.email = 'jdsilva@cin.ufpe.br'
GROUP BY CR.email.email, CR.cod_pub.conteudo, CR.cod_com.conteudo;

-- Retorna uma lista de usuários que possuem seguidores, exibindo o número de seguidores para cada um e organizando o resultado em ordem decrescente de seguidores
SELECT seguido.email AS seguido_email, COUNT(S.seguidor) AS num_seguidores
FROM tb_seguir S
JOIN tb_usuario seguido ON S.seguido = REF(seguido)
GROUP BY seguido.email
HAVING COUNT(S.seguidor) > 0
ORDER BY num_seguidores DESC;

--Seleciona o número de curtidas de uma determinada publicação
SELECT D.cod_pub.conteudo AS PUBLICACAO, D.email_publicou.email AS EMAIL, COUNT(REF(D)) AS numero_curtidas
FROM tb_curtir D
WHERE D.cod_pub.cod_pub = 9
GROUP BY D.cod_pub.conteudo, D.email_publicou.email;

--Seleciona o número de curtidas dadas por um determinado usuário
SELECT D.email_curte.email, COUNT(REF(D)) AS numero_curtidas_dadas
FROM tb_curtir D
WHERE D.email_curte.email = 'mlmn3@cin.ufpe.br'
GROUP BY D.email_curte.email;

-- Retorna a obra que aparece primeiro alfabéticamente
-- Utiliza a função compare_titulo
DECLARE
    obra1 tp_obra;
    obra2 tp_obra;
    comp_result NUMBER;

BEGIN
    SELECT VALUE(O)
    INTO obra1
    FROM tb_obra o
    WHERE o.titulo = 'Moby Dick';

    SELECT VALUE(O)
    INTO obra2
    FROM tb_obra O
    WHERE O.titulo = 'Percy Jackson e o Ladrão de Raios';

    comp_result := obra1.compare_titulo(obra2);

    IF comp_result = -1 THEN
        DBMS_OUTPUT.PUT_LINE('Obra1 vem antes de Obra2.');
    ELSIF comp_result = 1 THEN
        DBMS_OUTPUT.PUT_LINE('Obra1 vem depois de Obra2.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Obra1 e Obra2 têm o mesmo título.');
    END IF;
END;
/

-- Testando procedure print_info em usuario comum
DECLARE
    usuario tp_usuario;
BEGIN
    SELECT VALUE(U) INTO usuario FROM tb_usuario U WHERE U.email = 'mlmn3@cin.ufpe.br';
    usuario.print_info();
END;

-- Testando procedure print_info em autor (overriding)
DECLARE
    autor tp_autor;
BEGIN
    SELECT VALUE(A) INTO autor FROM tb_autor A WHERE A.email = 'george.martin@gmail.com';
    autor.print_info();
END;
