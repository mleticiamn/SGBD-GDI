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

INSERT INTO tb_usuario VALUES(
    tp_usuario(
        'ram3@cin.ufpe.br',
        tp_nome_completo(
            'Rebeca',
            'Menezes'
        ),
        '28-11-2003',
        va_tp_telefones(tp_telefones('81922222431'))
    )
);
/
    
-- INSERINDO NA TABELA AUTOR
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

-- CRIANDO SEQUẼNCIA PARA COD_PUB
CREATE SEQUENCE seq_cod_pub INCREMENT BY 1 START WITH 1;
/
-- INSERINDO PUBLICAÇÕES
INSERT INTO tb_publicacao VALUES(
    tp_publicacao(
        (SELECT REF(E) FROM tb_usuario E WHERE E.email = 'mlmn3@cin.ufpe.br'),
        seq_cod_pub.NEXTVAL,
        'Ontem li it ends with us, não gostei! achei muito ruim',
        '06-11-2023'
    )
);
/

INSERT INTO tb_publicacao VALUES(
    tp_publicacao(
        (SELECT REF(E) FROM tb_usuario E WHERE E.email = 'rick.riordan@gmail.com'),
        seq_cod_pub.NEXTVAL,
        'Percy Jackson e o Ladrão de Raios é uma introdução épica ao mundo dos semideuses.',
        '23-02-2024'
    )
);
/

INSERT INTO tb_publicacao VALUES(
    tp_publicacao(
        (SELECT REF(E) FROM tb_usuario E WHERE E.email = 'jk.rowling@gmail.com'),
        seq_cod_pub.NEXTVAL,
        'Pensando em escrever algo novo. Alguma sugestão de tema?',
        '24-02-2024'
    )
);
/

INSERT INTO tb_publicacao VALUES(
    tp_publicacao(
        (SELECT REF(E) FROM tb_usuario E WHERE E.email = 'rick.riordan@gmail.com'),
        seq_cod_pub.NEXTVAL,
        'Estou trabalhando no próximo livro do universo Percy Jackson. Fiquem atentos!',
        '23-02-2024'
    )
);
/

INSERT INTO tb_publicacao VALUES(
    tp_publicacao(
        (SELECT REF(E) FROM tb_usuario E WHERE E.email = 'jdsilva@cin.ufpe.br'),
        seq_cod_pub.NEXTVAL,
        'Moby Dick é uma aventura intensa e filosófica em busca de uma baleia branca.',
        '01-03-2024'
    )
);
/

INSERT INTO tb_publicacao VALUES(
    tp_publicacao(
        (SELECT REF(E) FROM tb_usuario E WHERE E.email = 'anamaria@cin.ufpe.br'),
        seq_cod_pub.NEXTVAL,
        'Jane Eyre é um romance fascinante, abordando temas como independência e moralidade.',
        '11-03-2024'
    )
);
/

INSERT INTO tb_publicacao VALUES(
    tp_publicacao(
        (SELECT REF(E) FROM tb_usuario E WHERE E.email = 'jdsilva@cin.ufpe.br'),
        seq_cod_pub.NEXTVAL,
        'Relendo "O Grande Gatsby". A crítica social é mais relevante do que nunca.',
        '20-03-2024'
    )
);
/

INSERT INTO tb_publicacao VALUES(
    tp_publicacao(
        (SELECT REF(E) FROM tb_usuario E WHERE E.email = 'anamaria@cin.ufpe.br'),
        seq_cod_pub.NEXTVAL,
        'Alguém já leu "O Morro dos Ventos Uivantes"? O que acharam?',
        '23-03-2024'
    )
);
/

INSERT INTO tb_publicacao VALUES(
    tp_publicacao(
        (SELECT REF(E) FROM tb_usuario E WHERE E.email = 'lcosta@cin.ufpe.br'),
        seq_cod_pub.NEXTVAL,
        'Li "Crime e Castigo". Um mergulho profundo na mente humana.',
        '05-04-2024'
    )
);
/

INSERT INTO tb_publicacao VALUES(
    tp_publicacao(
        (SELECT REF(E) FROM tb_usuario E WHERE E.email = 'mlmn3@cin.ufpe.br'),
        seq_cod_pub.NEXTVAL,
        'Estou lendo "Morte no Nilo" de Agatha Christie. Estou intrigada até agora.',
        '07-04-2024'
    )
);
/

-- INSERINDO NA TABELA USUARIO-PUBLICACAO
INSERT INTO tb_usuario_pub (email, cod_pub) VALUES(
    (SELECT REF(E) FROM tb_usuario E WHERE E.email = 'mlmn3@cin.ufpe.br'),
    (SELECT REF(P) FROM tb_publicacao P WHERE P.cod_pub = 1)
);
/

INSERT INTO tb_usuario_pub (email, cod_pub) VALUES(
    (SELECT REF(E) FROM tb_usuario E WHERE E.email = 'rick.riordan@gmail.com'),
    (SELECT REF(P) FROM tb_publicacao P WHERE P.cod_pub = 2)
);
/

INSERT INTO tb_usuario_pub (email, cod_pub) VALUES(
    (SELECT REF(E) FROM tb_usuario E WHERE E.email = 'jk.rowling@gmail.com'),
    (SELECT REF(P) FROM tb_publicacao P WHERE P.cod_pub = 3)
);
/

INSERT INTO tb_usuario_pub (email, cod_pub) VALUES(
    (SELECT REF(E) FROM tb_usuario E WHERE E.email = 'rick.riordan@gmail.com'),
    (SELECT REF(P) FROM tb_publicacao P WHERE P.cod_pub = 4)
);
/

INSERT INTO tb_usuario_pub (email, cod_pub) VALUES(
    (SELECT REF(E) FROM tb_usuario E WHERE E.email = 'jdsilva@cin.ufpe.br'),
    (SELECT REF(P) FROM tb_publicacao P WHERE P.cod_pub = 5)
);
/

INSERT INTO tb_usuario_pub (email, cod_pub) VALUES(
    (SELECT REF(E) FROM tb_usuario E WHERE E.email = 'anamaria@cin.ufpe.br'),
    (SELECT REF(P) FROM tb_publicacao P WHERE P.cod_pub = 6)
);
/

INSERT INTO tb_usuario_pub (email, cod_pub) VALUES(
    (SELECT REF(E) FROM tb_usuario E WHERE E.email = 'jdsilva@cin.ufpe.br'),
    (SELECT REF(P) FROM tb_publicacao P WHERE P.cod_pub = 7)
);
/

INSERT INTO tb_usuario_pub (email, cod_pub) VALUES(
    (SELECT REF(E) FROM tb_usuario E WHERE E.email = 'anamaria@cin.ufpe.br'),
    (SELECT REF(P) FROM tb_publicacao P WHERE P.cod_pub = 8)
);
/

INSERT INTO tb_usuario_pub (email, cod_pub) VALUES(
    (SELECT REF(E) FROM tb_usuario E WHERE E.email = 'lcosta@cin.ufpe.br'),
    (SELECT REF(P) FROM tb_publicacao P WHERE P.cod_pub = 9)
);
/

INSERT INTO tb_usuario_pub (email, cod_pub) VALUES(
    (SELECT REF(E) FROM tb_usuario E WHERE E.email = 'mlmn3@cin.ufpe.br'),
    (SELECT REF(P) FROM tb_publicacao P WHERE P.cod_pub = 10)
);
/

-- CRIANDO SEQUÊNCIA PARA COD_OBRA
CREATE SEQUENCE seq_cod_obra INCREMENT BY 1 START WITH 1;
/
-- INSERINDO OBRAS
INSERT INTO tb_obra VALUES(
    tp_obra(
        cod_obra.NEXTVAL,
        'it ends with us',
        (SELECT REF(E) FROM tb_usuario_pub E WHERE E.email = 'mlmn3@cin.ufpe.br'),
        (SELECT REF(P) FROM tb_usuario_pub P WHERE P.cod_pub = 1),
        tp_nt_autores(
            tp_autor('Collen Hoover')
        ),
        va_tp_generos(tp_generos('Romance'), tp_generos('Drama'))
    )
);
/
INSERT INTO tb_obra VALUES(
    tp_obra(
        cod_obra.NEXTVAL,
        'Percy Jackson e o Ladrão de Raios',
        (SELECT REF(E) FROM tb_usuario_pub E WHERE E.email = 'rick.riordan@gmail.com'),
        (SELECT REF(P) FROM tb_usuario_pub P WHERE P.cod_pub = 2),
        tp_nt_autores(
            tp_autor('Rick Riordan')
        ),
        va_tp_generos(tp_generos('Aventura'), tp_generos('Ação'), tp_generos('Fantasia'))
    )
);
/
INSERT INTO tb_obra VALUES(
    tp_obra(
        cod_obra.NEXTVAL,
        'Moby Dick',
        (SELECT REF(E) FROM tb_usuario_pub E WHERE E.email = 'jdsilva@cin.ufpe.br'),
        (SELECT REF(P) FROM tb_usuario_pub P WHERE P.cod_pub = 5),
        tp_nt_autores(
            tp_autor('Herman Melville')
        ),
        va_tp_generos(tp_generos('Drama'), tp_generos('Aventura'))
    )
);
/
INSERT INTO tb_obra VALUES(
    tp_obra(
        cod_obra.NEXTVAL,
        'Jane Eyre',
        (SELECT REF(E) FROM tb_usuario_pub E WHERE E.email = 'anamaria@cin.ufpe.br'),
        (SELECT REF(P) FROM tb_usuario_pub P WHERE P.cod_pub = 6),
        tp_nt_autores(
            tp_autor('Charlotte Brontë')
        ),
        va_tp_generos(tp_generos('Romance'), tp_generos('Gótico'))
    )
);
/
INSERT INTO tb_obra VALUES(
    tp_obra(
        cod_obra.NEXTVAL,
        'O Grande Gatsby',
        (SELECT REF(E) FROM tb_usuario_pub E WHERE E.email = 'jdsilva@cin.ufpe.br'),
        (SELECT REF(P) FROM tb_usuario_pub P WHERE P.cod_pub = 7),
        tp_nt_autores(
            tp_autor('F. Scott Fitzgerald')
        ),
        va_tp_generos(tp_generos('Drama'))
    )
);
/
INSERT INTO tb_obra VALUES(
    tp_obra(
        cod_obra.NEXTVAL,
        'O Morro dos Ventos Uivantes',
        (SELECT REF(E) FROM tb_usuario_pub E WHERE E.email = 'anamaria@cin.ufpe.br'),
        (SELECT REF(P) FROM tb_usuario_pub P WHERE P.cod_pub = 8),
        tp_nt_autores(
            tp_autor('Emily Bronte'),
            tp_autor('Pei Sherman')
        ),
        va_tp_generos(tp_generos('Drama'), tp_generos('Romance'))
    )
);
/
INSERT INTO tb_obra VALUES(
    tp_obra(
        cod_obra.NEXTVAL,
        'Crime e Castigo',
        (SELECT REF(E) FROM tb_usuario_pub E WHERE E.email = 'lcosta@cin.ufpe.br'),
        (SELECT REF(P) FROM tb_usuario_pub P WHERE P.cod_pub = 9),
        tp_nt_autores(
            tp_autor('Fiódor Dostoiévski'),
            tp_autor('Guilherme')
        ),
        va_tp_generos(tp_generos('Ficção Policial'))
    )
);
/
INSERT INTO tb_obra VALUES(
    tp_obra(
        cod_obra.NEXTVAL,
        'Morte no Nilo',
        (SELECT REF(E) FROM tb_usuario_pub E WHERE E.email = 'mlmn3@cin.ufpe.br'),
        (SELECT REF(P) FROM tb_usuario_pub P WHERE P.cod_pub = 10),
        tp_nt_autores(
            tp_autor('Agatha Christie'),
        ),
        va_tp_generos(tp_generos('Suspense'))
    )
);
/

-- INSERINDO NA TABELA SINOPSES
INSERT INTO tb_sinopses VALUES(
    tp_sinopses(
        'Uma história tocante sobre amor, superação e os desafios de romper ciclos abusivos e tóxicos nas relações pessoais.',
        1
    )
);
/

INSERT INTO tb_sinopses VALUES(
    tp_sinopses(
        'Percy descobre ser um semideus e embarca em uma aventura épica para recuperar o raio mestre de Zeus, enfrentando criaturas mitológicas e deuses poderosos.',
        2
    )
);
/

INSERT INTO tb_sinopses VALUES(
    tp_sinopses(
        'O capitão Ahab parte em uma obsessiva caçada pela baleia branca Moby Dick, levando sua tripulação a uma jornada trágica e filosófica sobre vingança e destino.',
        3
    )
);
/

INSERT INTO tb_sinopses VALUES(
    tp_sinopses(
        'Jane, uma jovem órfã, enfrenta dificuldades e preconceitos para construir sua própria identidade e encontrar o amor, enquanto guarda segredos sombrios em sua vida.',
        4
    )
);
/

INSERT INTO tb_sinopses VALUES(
    tp_sinopses(
        'Um retrato do sonho americano na década de 1920, centrado em Jay Gatsby e sua obsessão por Daisy Buchanan em meio ao luxo e tragédias da alta sociedade.',
        5
    )
);
/

INSERT INTO tb_sinopses VALUES(
    tp_sinopses(
        'Uma história de paixão intensa e vingança que acompanha a complexa relação entre Heathcliff e Catherine, marcada por traições, ódio e amor em um cenário sombrio.',
        6
    )
);
/

INSERT INTO tb_sinopses VALUES(
    tp_sinopses(
        'Raskólnikov, um jovem estudante, luta com as consequências morais e psicológicas de cometer um assassinato, explorando temas de culpa, redenção e justiça.',
        7
    )
);
/

INSERT INTO tb_sinopses VALUES(
    tp_sinopses(
        'Hercule Poirot investiga um misterioso assassinato a bordo de um cruzeiro pelo rio Nilo, onde cada passageiro parece ter motivos para matar a vítima',
        8
    )
);
/

-- INSERINDO NA TABELA REFERENCIAR
INSERT INTO tb_referenciar VALUES(
    tb_referenciar(
        (SELECT REF(O) FROM tb_obra O WHERE O.cod_obra = 1),
        (SELECT REF(U) FROM tb_usuario_pub U WHERE U.email = 'mlmn3@cin.ufpe.br'),
        (SELECT REF(P) FROM tb_usuario_pub P WHERE P.cod_pub = 1)
    )
);
/

INSERT INTO tb_referenciar VALUES(
    tb_referenciar(
        (SELECT REF(O) FROM tb_obra O WHERE O.cod_obra = 2),
        (SELECT REF(U) FROM tb_usuario_pub U WHERE U.email = 'rick.riordan@gmail.com'),
        (SELECT REF(P) FROM tb_usuario_pub P WHERE P.cod_pub = 2)
    )
);
/

INSERT INTO tb_referenciar VALUES(
    tb_referenciar(
        (SELECT REF(O) FROM tb_obra O WHERE O.cod_obra = 3),
        (SELECT REF(U) FROM tb_usuario_pub U WHERE U.email = 'jdsilva@cin.ufpe.br'),
        (SELECT REF(P) FROM tb_usuario_pub P WHERE P.cod_pub = 3)
    )
);
/

INSERT INTO tb_referenciar VALUES(
    tb_referenciar(
        (SELECT REF(O) FROM tb_obra O WHERE O.cod_obra = 4),
        (SELECT REF(U) FROM tb_usuario_pub U WHERE U.email = 'anamaria@cin.ufpe.br'),
        (SELECT REF(P) FROM tb_usuario_pub P WHERE P.cod_pub = 6)
    )
);
/

INSERT INTO tb_referenciar VALUES(
    tb_referenciar(
        (SELECT REF(O) FROM tb_obra O WHERE O.cod_obra = 5),
        (SELECT REF(U) FROM tb_usuario_pub U WHERE U.email = 'jdsilva@cin.ufpe.br'),
        (SELECT REF(P) FROM tb_usuario_pub P WHERE P.cod_pub = 7)
    )
);
/

INSERT INTO tb_referenciar VALUES(
    tb_referenciar(
        (SELECT REF(O) FROM tb_obra O WHERE O.cod_obra = 6),
        (SELECT REF(U) FROM tb_usuario_pub U WHERE U.email = 'anamaria@cin.ufpe.br'),
        (SELECT REF(P) FROM tb_usuario_pub P WHERE P.cod_pub = 8)
    )
);
/

INSERT INTO tb_referenciar VALUES(
    tb_referenciar(
        (SELECT REF(O) FROM tb_obra O WHERE O.cod_obra = 7),
        (SELECT REF(U) FROM tb_usuario_pub U WHERE U.email = 'lcosta@cin.ufpe.br'),
        (SELECT REF(P) FROM tb_usuario_pub P WHERE P.cod_pub = 9)
    )
);
/

INSERT INTO tb_referenciar VALUES(
    tb_referenciar(
        (SELECT REF(O) FROM tb_obra O WHERE O.cod_obra = 8),
        (SELECT REF(U) FROM tb_usuario_pub U WHERE U.email = 'mlmn3@cin.ufpe.br'),
        (SELECT REF(P) FROM tb_usuario_pub P WHERE P.cod_pub = 10)
    )
);
/


-- CRIANDO SEQUÊNCIA PARA COD_COM
CREATE SEQUENCE seq_cod_com INCREMENT BY 1 START 1;
/
-- INSERINDO NA TABELA COMENTARIO
-- D É PARA O DONO DA PUBLICAÇÃO, P É PARA A PUBLICAÇÃO
INSERT INTO tb_comentario VALUES(
    tp_comentario(
        (SELECT REF(D) FROM tb_publicacao D WHERE D.email = 'mlmn3@cin.ufpe.br'), 
        (SELECT REF(P) FROM tb_publicacao P WHERE P.cod_com = 1),
        seq_cod_com.NEXTVAL,
        'Também não gostei!'
    )
);
/

INSERT INTO tb_comentario VALUES(
    tp_comentario(
        (SELECT REF(D) FROM tb_publicacao D WHERE D.email = 'anamaria@cin.ufpe.br'), 
        (SELECT REF(P) FROM tb_publicacao P WHERE P.cod_com = 8),
        seq_cod_com.NEXTVAL,
        'Sim, já li! Achei intenso e cheio de emoções, com personagens complexos e uma atmosfera sombria.'
    )
);
/

INSERT INTO tb_comentario VALUES(
    tp_comentario(
        (SELECT REF(D) FROM tb_publicacao D WHERE D.email = 'lcosta@cin.ufpe.br'), 
        (SELECT REF(P) FROM tb_publicacao P WHERE P.cod_com = 9),
        seq_cod_com.NEXTVAL,
        'Estou doido para ler esse, mas ainda não tive tempo'
    )
);
/

-- INSERINDO NA TABELA COMENTAR
-- U É PARA O USUÁRIO COMENTANDO, P É PARA A PUBLICAÇÃO E C É PARA O COMENTÁRIO
INSERT INTO tb_comentar VALUES(
    tp_comentar(
        (SELECT REF(U) FROM tb_usuario U WHERE U.email = 'jdsilva@cin.ufpe.br'),
        (SELECT REF(P) FROM tb_publicacao P WHERE P.cod_pub = 1),
        (SELECT REF(C) FROM tb_comentario C WHERE C.cod_com = 1)
    )
);
/

INSERT INTO tb_comentar VALUES(
    tp_comentar(
        (SELECT REF(U) FROM tb_usuario U WHERE U.email = 'lcosta@cin.ufpe.br'),
        (SELECT REF(P) FROM tb_publicacao P WHERE P.cod_pub = 8),
        (SELECT REF(C) FROM tb_comentario C WHERE C.cod_com = 2)
    )
);
/

INSERT INTO tb_comentar VALUES(
    tp_comentar(
        (SELECT REF(U) FROM tb_usuario U WHERE U.email = 'anamaria@cin.ufpe.br'),
        (SELECT REF(P) FROM tb_publicacao P WHERE P.cod_pub = 9),
        (SELECT REF(C) FROM tb_comentario C WHERE C.cod_com = 3)
    )
);
/

-- INSERINDO NA TABELA SEGUIR (S é o seguidor e F é o seguido)
INSERT INTO tb_seguir VALUES(
    (SELECT REF(S) FROM tb_usuario S WHERE S.email = 'mlmn3@cin.ufpe.br'), 
    (SELECT REF(F) FROM tb_usuario F WHERE F.email = 'jdsilva@cin.ufpe.br')  
);
/

INSERT INTO tb_seguir VALUES(
    (SELECT REF(S) FROM tb_usuario S WHERE S.email = 'anamaria@cin.ufpe.br'),
    (SELECT REF(F) FROM tb_usuario F WHERE F.email = 'lcosta@cin.ufpe.br')
);
/

INSERT INTO tb_seguir VALUES(
    (SELECT REF(S) FROM tb_usuario S WHERE S.email = 'lcosta@cin.ufpe.br'),
    (SELECT REF(F) FROM tb_usuario F WHERE F.email = 'anamaria@cin.ufpe.br')
);
/
    
INSERT INTO tb_seguir VALUES(
    (SELECT REF(S) FROM tb_usuario S WHERE S.email = 'rick.riordan@gmail.com'),
    (SELECT REF(F) FROM tb_usuario F WHERE F.email = 'jk.rowling@gmail.com')
);
/

INSERT INTO tb_seguir VALUES(
    (SELECT REF(S) FROM tb_usuario S WHERE S.email = 'mlmn3@cin.ufpe.br'),
    (SELECT REF(F) FROM tb_usuario F WHERE F.email = 'anamaria@cin.ufpe.br')
);
/

INSERT INTO tb_seguir VALUES(
    (SELECT REF(S) FROM tb_usuario S WHERE S.email = 'anamaria@cin.ufpe.br'),
    (SELECT REF(F) FROM tb_usuario F WHERE F.email = 'ram3@cin.ufpe.br')
);
/

-- INSERINDO NA TABELA CURTIR
INSERT INTO tb_curtir VALUES(
    tp_curtir(
        (SELECT REF(C) FROM tb_usuario C WHERE C.email = 'mlmn3@cin.ufpe.br'),
        (SELECT REF(P) FROM tb_usuario P WHERE P.email = 'jdsilva@cin.ufpe.br'),
        (SELECT REF(A) FROM tB_usuario A WHERE A.cod_pub = 5)
    )
);
/

INSERT INTO tb_curtir VALUES(
    tp_curtir(
        (SELECT REF(C) FROM tb_usuario C WHERE C.email = 'mlmn3@cin.ufpe.br'),
        (SELECT REF(P) FROM tb_usuario P WHERE P.email = 'rick.riordan@gmail.com'),
        (SELECT REF(A) FROM tB_usuario A WHERE A.cod_pub = 2)
    )
);
/

INSERT INTO tb_curtir VALUES(
    tp_curtir(
        (SELECT REF(C) FROM tb_usuario C WHERE C.email = 'mlmn3@cin.ufpe.br'),
        (SELECT REF(P) FROM tb_usuario P WHERE P.email = 'rick.riordan@gmail.com'),
        (SELECT REF(A) FROM tB_usuario A WHERE A.cod_pub = 4)
    )
);
/

INSERT INTO tb_curtir VALUES(
    tp_curtir(
        (SELECT REF(C) FROM tb_usuario C WHERE C.email = 'anamaria@cin.ufpe.br'),
        (SELECT REF(P) FROM tb_usuario P WHERE P.email = 'lcosta@cin.ufpe.br'),
        (SELECT REF(A) FROM tB_usuario A WHERE A.cod_pub = 9)
    )
);
/

INSERT INTO tb_curtir VALUES(
    tp_curtir(
        (SELECT REF(C) FROM tb_usuario C WHERE C.email = 'anamaria@cin.ufpe.br'),
        (SELECT REF(P) FROM tb_usuario P WHERE P.email = 'ram3@cin.ufpe.br'),
        (SELECT REF(A) FROM tB_usuario A WHERE A.cod_pub = 9)
    )
);
/