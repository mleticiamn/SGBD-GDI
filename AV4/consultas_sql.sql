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
