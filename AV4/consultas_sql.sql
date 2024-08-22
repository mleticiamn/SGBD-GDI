-- Insere novo telefone para Rebeca Menezes
INSERT INTO
    telefones (email, telefone)
VALUES
    ('ram3@cin.ufpe.br', '23-088769235');

-- Atualiza a data de nascimento de Pedro Martins
UPDATE usuario
SET data_nasc = '30-04-2003'
WHERE email = 'pms5@cin.ufpe.br';

-- Faz com que Rick Riordan não siga mais Jane Austen 
DELETE FROM seguir
WHERE seguidor = 'rick.riordan@gmail.com' AND seguido = 'jane.austen@gmail.com';

-- Seleciona todos os usuários que seguem Paula Pimenta, Rick Riordan ou Machado de Assis
SELECT * FROM seguir
WHERE seguido IN ('paula.pimenta@gmail.com', 'rick.riordan@gmail.com', 'machado.de.assis@gmail.com');

-- Seleciona a média de postagens de cada usuário a partir da seleção do número de publicações de cada usuário 
SELECT Email, AVG(Postagens) AS MediaPostagens
FROM (
    SELECT Email, COUNT(*) AS Postagens
    FROM Publicacao
    GROUP BY Email
) AS Subconsulta
GROUP BY Email;


-- Seleciona todos os usuários que seguem Paula Pimenta, Rick Riordan ou Machado de Assis e mostra em ordem alfabética crescente
SELECT * FROM seguir
WHERE seguido IN ('paula.pimenta@gmail.com', 'rick.riordan@gmail.com', 'machado.de.assis@gmail.com')
ORDER BY seguidor ASC;

-- Seleciona todos os usuários cujos telefones começam com '81-' e exibe email e telefone
SELECT u.email, t.telefone
FROM usuario u
INNER JOIN telefones t ON u.email = t.email
WHERE t.telefone LIKE '81-%';

-- Seleciona os usuários que possuem mais de 1 seguidor, em ordem decrescente de total de seguidores
SELECT seguido, COUNT(seguidor) AS total_seguidores
FROM seguir
GROUP BY seguido
HAVING COUNT(seguidor) > 1
ORDER BY total_seguidores DESC;

-- Seleciona todas as publicações feitas entre 01 de janeiro de 2023 e 31 de dezembro de 2023
SELECT email, cod_pub, conteudo, data_pub
FROM publicacao
WHERE data_pub BETWEEN DATE '2023-01-01' AND DATE '2023-12-31';

-- Seleciona a data de nascimento mais antiga e a mais recente dos usuários
SELECT MIN(data_nasc) AS data_nasc_mais_antiga,
       MAX(data_nasc) AS data_nasc_mais_recente
FROM usuario

-- Cria uma visão que mostra todos os usuários e seus telefones, incluindo usuários sem telefone
CREATE VIEW usuarios_telefones AS
SELECT u.email, u.nome, u.sobrenome, t.telefone
FROM usuario u
LEFT JOIN telefones t ON u.email = t.email;

-- Seleciona todos os emails de usuários que não estão na tabela de autores
SELECT email
FROM usuario
MINUS
SELECT email
FROM autor;

-- Seleciona os usuários que têm publicações feitas entre 01 de janeiro de 2023 e 31 de dezembro de 2023.
SELECT email
FROM usuario
WHERE email IN (
    SELECT email
    FROM publicacao
    WHERE data_pub BETWEEN DATE '2023-01-01' AND DATE '2023-12-31'
);

-- Seleciona os usuários que publicaram todos os livros na lista fornecida.
SELECT nome
FROM usuario
WHERE email = ALL (
    SELECT email
    FROM usuario_publicacao
    WHERE cod_pub IN (
        SELECT cod_pub
        FROM publicacao
        WHERE conteudo LIKE '%Percy Jackson%' 
    )
);


--Seleciona  os usuários que publicaram um livro após a data de publicação de "1984" de George Orwell.
SELECT nome
FROM usuario
WHERE email = ANY (
    SELECT email
    FROM publicacao
    WHERE data_pub > (
        SELECT data_pub
        FROM publicacao
        WHERE conteudo LIKE '%1984%'
    )
);


-- Seleciona autores que têm uma biografia registrada
SELECT email, biografia
FROM autor
WHERE biografia IS NOT NULL;


--Altera o nome da coluna de 'telefone' para 'num_telefone' e então desfaz
SELECT *
FROM telefones;

ALTER TABLE telefones
RENAME COLUMN telefone TO num_telefone;

SELECT *
FROM telefones;

ALTER TABLE telefones
RENAME COLUMN num_telefone TO telefone;

SELECT *
FROM telefones;

-- Cria um índice na coluna 'email' da tabela 'usuario' e depois remove
CREATE INDEX idx_nome_usuario
ON usuario (nome);

SELECT index_name, column_name
FROM all_ind_columns
WHERE table_name = 'USUARIO';

DROP INDEX idx_nome_usuario;

-- Criação da visão combinando títulos, autores e sinopses das obras
CREATE VIEW view_obras_completas AS
SELECT 
    o.cod_obra,
    o.titulo,
    a.autor,
    s.sinopse
FROM 
    obra o
LEFT JOIN 
    autores a ON o.cod_obra = a.cod_obra
LEFT JOIN 
    sinopses s ON o.cod_obra = s.cod_obra;

-- Conceder permissão de SELECT para todos os usuários na visão
GRANT SELECT ON view_obras_completas TO PUBLIC;




