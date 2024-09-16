-- TABELA USUÁRIO
CREATE TABLE tb_usuario OF tp_usuario(
    email PRIMARY KEY, 
    nome_completo NOT NULL,
    data_nasc NOT NULL,
    lista_telefones NOT NULL
);
/
-- TABELA AUTOR
CREATE TABLE tb_autor OF tp_autor(
    email PRIMARY KEY
) NESTED TABLE lista_premios STORE AS nt_premios;
/
-- TABELA PUBLICAÇÃO
CREATE TABLE tb_publicacao OF tp_publicacao(
    cod_pub PRIMARY KEY,
    email WITH ROWID REFERENCES tb_usuario
);
/
-- TABELA USUARIO-PUBLICACAO
CREATE TABLE tb_usuario_pub OF tp_usuario_pub(
    email WITH ROWID REFERENCES tb_usuario,
    cod_pub WITH ROWID REFERENCES tb_publicacao
);
/
-- TABELA OBRA
CREATE TABLE tb_obra OF tp_obra(
    cod_obra PRIMARY KEY,
    titulo NOT NULL,
    email_cad WITH ROWID REFERENCES tb_usuario_pub,
    pub_cad WITH ROWID REFERENCES tb_usuario_pub
) NESTED TABLE lista_autores STORE AS nt_autores;
/
-- TABELA SINOPSES
CREATE TABLE tb_sinopses OF tp_sinopses(
    sinopse PRIMARY KEY,
    cod_obra SCOPE IS tb_obra
);
/
-- TABELA REFERENCIAR
CREATE TABLE tb_referenciar OF tp_referenciar(
    cod_obra WITH ROWID REFERENCES tb_obra,
    email WITH ROWID REFERENCES tb_usuario_pub,
    cod_pub WITH ROWID REFERENCES tb_usuario_pub
);
/
-- TABELA COMENTARIO
CREATE TABLE tb_comentario OF tp_comentario(
    cod_com PRIMARY KEY,
    email WITH ROWID REFERENCES tb_publicacao,
    cod_pub WITH ROWID REFERENCES tb_publicacao
);
/
-- TABELA COMENTAR
CREATE TABLE tb_comentar OF tp_comentar(
    email WITH ROWID REFERENCES tb_usuario,
    cod_pub WITH ROWID REFERENCES tb_publicacao,
    cod_com WITH ROWID REFERENCES tb_comentario
);
/
-- TABELA SEGUIR
CREATE TABLE tb_seguir OF tp_seguir(
    seguidor WITH ROWID REFERENCES tb_usuario,
    seguido WITH ROWID REFERENCES tb_usuario
);
/
-- TABELA CURTIR
CREATE TABLE tb_curtir OF tp_curtir(
    email_curte WITH ROWID REFERENCES tb_usuario,
    email_publicou WITH ROWID REFERENCES tb_usuario,
    cod_pub WITH ROWID REFERENCES tb_publicacao
);
/