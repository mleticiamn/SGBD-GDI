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
        va_tp_telefones(tp_telefones('819000000'), tp_telefones('32280000'))
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
        va_tp_telefones(tp_telefones('819111111'), tp_telefones('32281111'))
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
        va_tp_telefones(tp_telefones('819222222'), tp_telefones('32282222'))
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
        va_tp_telefones(tp_telefones('819333333'), tp_telefones('32283333'))
    )
);
/