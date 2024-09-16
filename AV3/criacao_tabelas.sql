CREATE TABLE usuario(
    email VARCHAR2(50),
    nome VARCHAR(50) NOT NULL,
    sobrenome VARCHAR(50) NOT NULL,
    data_nasc DATE NOT NULL,
    CONSTRAINT usuario_pkey PRIMARY KEY (email)
);

CREATE TABLE telefones (
    email VARCHAR2(50),
    telefone VARCHAR2(14),
    CONSTRAINT telefones_pkey PRIMARY KEY (email, telefone),
    CONSTRAINT telefones_usuario_fkey FOREIGN KEY (email) REFERENCES usuario (email),
    CONSTRAINT telefone_format CHECK (telefone LIKE '__-_________')
);

CREATE TABLE autor (
    email VARCHAR2(50),
    biografia VARCHAR2(250),
    CONSTRAINT autor_pkey PRIMARY KEY (email),
    CONSTRAINT autor_usuario_fkey FOREIGN KEY (email) REFERENCES usuario (email)
);

CREATE TABLE premios (
    email VARCHAR2(50),
    premio VARCHAR2(50),
    CONSTRAINT premios_pkey PRIMARY KEY (email, premio),
    CONSTRAINT premios_autor_fkey FOREIGN KEY (email) REFERENCES autor (email)
);

CREATE TABLE publicacao (
    email VARCHAR2(50),
    cod_pub NUMBER,
    conteudo VARCHAR2(700) NOT NULL,
    data_pub DATE NOT NULL,
    CONSTRAINT publicacao_pkey PRIMARY KEY (email, cod_pub)
    CONSTRAINT publicacao_usuario_fkey FOREIGN KEY (email) REFERENCES usuario (email)
);
    
CREATE TABLE usuario_publicacao (
    email VARCHAR2(50),
    cod_pub NUMBER,
    CONSTRAINT usuario_publicacao_pkey PRIMARY KEY (email, cod_pub),
    CONSTRAINT usuario_publicacao_usu_fkey FOREIGN KEY (email) REFERENCES usuario (email),
    CONSTRAINT usuario_publicacao_pub_fkey FOREIGN KEY (email, cod_pub) REFERENCES publicacao (email, cod_pub)
);

CREATE TABLE obra (
    cod_obra NUMBER,
    titulo VARCHAR2(50) NOT NULL,
    email_cad VARCHAR2(50),
    pub_cad NUMBER,
    CONSTRAINT obra_pkey PRIMARY KEY (cod_obra),
    CONSTRAINT obra_usuario_publicacao_fkey FOREIGN KEY (email_cad, pub_cad) REFERENCES usuario_publicacao (email, cod_pub)
);
    
CREATE TABLE sinopses (
    cod_obra NUMBER,
    sinopse VARCHAR(400) NOT NULL,
    CONSTRAINT sinopses_pkey PRIMARY KEY (cod_obra, sinopse),
    CONSTRAINT sinopses_obra_fkey FOREIGN KEY (cod_obra) REFERENCES obra (cod_obra)
);
    
CREATE TABLE autores (
    cod_obra NUMBER,
    autor VARCHAR2(50),
    CONSTRAINT autores_pkey PRIMARY KEY (cod_obra, autor),
    CONSTRAINT autores_obra_fkey FOREIGN KEY (cod_obra) REFERENCES obra (cod_obra)
);

CREATE TABLE generos (
    cod_obra NUMBER,
    genero VARCHAR2(20),
    CONSTRAINT generos_pkey PRIMARY KEY (cod_obra, genero),
    CONSTRAINT generos_obra_fkey FOREIGN KEY (cod_obra) REFERENCES obra (cod_obra)
);
    
CREATE TABLE referenciar (
    cod_obra NUMBER,
    email VARCHAR2(50),
    cod_pub NUMBER,
    CONSTRAINT referenciar_pkey PRIMARY KEY (cod_obra, email, cod_pub),
    CONSTRAINT referenciar_obra_fkey FOREIGN KEY (cod_obra) REFERENCES obra (cod_obra),
    CONSTRAINT referenciar_usuario_pub_fkey FOREIGN KEY (email, cod_pub) REFERENCES usuario_publicacao (email, cod_pub)
);

CREATE TABLE comentario (
    email VARCHAR2(50),
    cod_pub NUMBER,
    cod_com NUMBER,
    conteudo VARCHAR2(100),
    CONSTRAINT comentario_pkey PRIMARY KEY (email, cod_pub, cod_com)
);

CREATE TABLE comentar (
    email VARCHAR2(50),
    cod_pub NUMBER,
    cod_com NUMBER,
    CONSTRAINT comentar_pkey PRIMARY KEY (email, cod_pub, cod_com),
    CONSTRAINT comentar_usuario_fkey FOREIGN KEY (email) REFERENCES usuario (email),
    CONSTRAINT comentar_publicacao_fkey FOREIGN KEY (email, cod_pub) REFERENCES publicacao (email, cod_pub),
    CONSTRAINT comentar_comentario_fkey FOREIGN KEY (email, cod_pub, cod_com) REFERENCES comentario (email, cod_pub, cod_com)
);

CREATE TABLE seguir (
    seguidor VARCHAR2(50),
    seguido VARCHAR2(50),
    CONSTRAINT seguir_pkey PRIMARY KEY (seguidor, seguido),
    CONSTRAINT seguir_seguidor_fkey FOREIGN KEY (seguidor) REFERENCES usuario (email),
    CONSTRAINT seguir_seguido_fkey FOREIGN KEY (seguido) REFERENCES usuario (email)
);

CREATE TABLE curtir (
    email_curte VARCHAR2(50),
    email_publicou VARCHAR2(50),
    cod_pub NUMBER,
    CONSTRAINT curtir_fkey PRIMARY KEY (email_curte, email_publicou, cod_pub),
    CONSTRAINT curtir_usuario_fkey FOREIGN KEY (email_curte) REFERENCES usuario (email),
    CONSTRAINT curtir_publicacao_fkey FOREIGN KEY (email_publicou, cod_pub) REFERENCES publicacao (email, cod_pub)
);
