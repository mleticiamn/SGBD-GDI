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
