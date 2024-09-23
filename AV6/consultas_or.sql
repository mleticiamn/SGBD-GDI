-- Seleciona os emails dos usuários que possuem mais de 20 caracteres
SELECT U.email 
FROM tb_usuario U
WHERE LENGTH(U.email) > 20;

