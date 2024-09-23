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
