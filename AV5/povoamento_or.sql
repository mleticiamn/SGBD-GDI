ALTER SESSION
SET
    NLS_DATE_FORMAT = 'DD-MM-YYYY';

-- INSERINDO USUARIOS
INSERT INTO tb_usuario VALUES(
    tp_usuario(
        'mlmn3@cin.ufpe.br',
        tp_nome_completo(
            'Maria Leticia',
            'Maranhao'
        ),
        '17-06-2003',
        va_tp_telefones(tp_telefones('81900000000'), tp_telefones('81932280000'))
    )
);
/

INSERT INTO tb_usuario VALUES(
    tp_usuario(
        'jdsilva@cin.ufpe.br',
        tp_nome_completo(
            'João',
            'da Silva'
        ),
        '21-09-1998',
        va_tp_telefones(tp_telefones('81911111111'), tp_telefones('81932281111'), tp_telefones('81932282222'))
    )
);
/

INSERT INTO tb_usuario VALUES(
    tp_usuario(
        'anamaria@cin.ufpe.br',
        tp_nome_completo(
            'Ana Maria',
            'Santos'
        ),
        '05-03-2000',
        va_tp_telefones(tp_telefones('81922222222'))
    )
);
/

INSERT INTO tb_usuario VALUES(
    tp_usuario(
        'lcosta@cin.ufpe.br',
        tp_nome_completo(
            'Lucas',
            'Costa'
        ),
        '12-12-2001',
        va_tp_telefones(tp_telefones('81933333333'), tp_telefones('81932283333'))
    )
);
/

-- INSERINDO AUTORES
INSERT INTO tb_autor VALUES(
    tp_autor(
        'rick.riordan@gmail.com',
        tp_nome_completo(
            'Rick',
            'Riordan'
        ),
        '05-06-1964',
        va_tp_telefones(tp_telefones('81944444444')),
        'Richard Russell Riordan Jr. é um escritor, mais conhecido por escrever a série Percy Jackson e Os Olimpianos',
        tp_nt_premios(
            tp_premios('Hampshire Book Award'),
            tp_premios('Shamus Award for Best First P. I. Novel'),
            tp_premios('Prêmio Edgar: Melhor Brochura Original')
        )
    )
);
/

INSERT INTO tb_autor VALUES(
    tp_autor(
        'jk.rowling@gmail.com',
        tp_nome_completo(
            'J.K.',
            'Rowling'
        ),
        '31-07-1965',
        va_tp_telefones(tp_telefones('81955555555'), tp_telefones('81932283333'), tp_telefones('81932284444')),
        'Joanne Rowling, conhecida por seu pseudônimo J.K. Rowling, é uma escritora britânica, autora da série Harry Potter',
        tp_nt_premios(
            tp_premios('Prêmio Bram Stoker')
        )
    )
);
/

INSERT INTO tb_autor VALUES(
    tp_autor(
        'george.martin@gmail.com',
        tp_nome_completo(
            'George',
            'R.R. Martin'
        ),
        '20-09-1948',
        va_tp_telefones(tp_telefones('81966666666')),
        'George Raymond Richard Martin, conhecido como George R.R. Martin, é um escritor e roteirista norte-americano, autor de As Crônicas de Gelo e Fogo',
        tp_nt_premios(
            tp_premios('Hugo Award for Best Novella'),
            tp_premios('Nebula Award for Best Novella')
        )
    )
);
/