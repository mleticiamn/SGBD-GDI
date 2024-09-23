-- Seleciona os emails dos usuários que possuem mais de 20 caracteres
SELECT U.email 
FROM tb_usuario U
WHERE LENGTH(U.email) > 20;

-- Descobre qual autor registrado tem mais prêmios e printa o seu nome completo
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
