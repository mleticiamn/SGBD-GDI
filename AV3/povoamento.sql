ALTER SESSION
SET
    NLS_DATE_FORMAT = 'DD-MM-YYYY';

-------- Usuario ----------
INSERT INTO
    usuario (email, nome, sobrenome, data_nasc)
VALUES
    ('ram3@cin.ufpe.br', 'Rebeca','Menezes', '28-11-2003');

INSERT INTO
    usuario (email, nome, sobrenome, data_nasc)
VALUES
    ('lblp@cin.ufpe.br', 'Letícia', 'Pedrosa', '17-09-2002');

INSERT INTO
    usuario (email, nome, sobrenome, data_nasc)
VALUES
    ('pms5@cin.ufpe.br', 'Pedro','Martins', '30-04-2002');

INSERT INTO
    usuario (email, nome, sobrenome, data_nasc)
VALUES
    ('jane.austen@gmail.com', 'Jane','Austen', '16-12-1775');

INSERT INTO
    usuario (email, nome, sobrenome, data_nasc)
VALUES
    ('rick.riordan@gmail.com', 'Rick','Riordan', '05-06-1964');

INSERT INTO
    usuario (email, nome, sobrenome, data_nasc)
VALUES
    ('john.green@gmail.com', 'John','Green', '24-08-1977');

INSERT INTO
    usuario (email, nome, sobrenome, data_nasc)
VALUES
    ('machado.de.assis@gmail.com', 'Machado','de Assis', '21-06-1839');

INSERT INTO
    usuario (email, nome, sobrenome, data_nasc)
VALUES
    ('paula.pimenta@gmail.com', 'Paula','Pimenta', '02-06-1975');

INSERT INTO
    usuario (email, nome, sobrenome, data_nasc)
VALUES
    ('mlmn3@cin.ufpe.br', 'maria leticia','maranhao', '17-06-2003');

INSERT INTO
    usuario (email, nome, sobrenome, data_nasc)
VALUES
    ('gmsmr@cin.ufpe.br', 'guilherme', 'maranhao', '02-03-2004');

INSERT INTO
    usuario (email, nome, sobrenome, data_nasc)
VALUES
    ('mcta@cin.ufpe.br', 'maria clara', 'albuquerque', '23-08-2002');

INSERT INTO
    usuario (email, nome, sobrenome, data_nasc)
VALUES
    ('jrco@cin.ufpe.br', 'joao victor', 'omena', '05-11-2004');

INSERT INTO
    usuario (email, nome, sobrenome, data_nasc)
VALUES
    ('cristaldog@gmail.com', 'cristal', 'cachorra', '06-07-2010');


---------- TELEFONES ----------
INSERT INTO
    telefones (email, telefone)
VALUES
    ('ram3@cin.ufpe.br', '23-098761234');

INSERT INTO
    telefones (email, telefone)
VALUES
    ('lblp@cin.ufpe.br', '67-231435465');

INSERT INTO
    telefones (email, telefone)
VALUES
    ('pms5@cin.ufpe.br', '81-987123531');

INSERT INTO
    telefones (email, telefone)
VALUES
    ('jane.austen@gmail.com', '29-483718293');

INSERT INTO
    telefones (email, telefone)
VALUES
    ('rick.riordan@gmail.com', '28-318373928');
    
INSERT INTO
    telefones (email, telefone)
VALUES
    ('john.green@gmail.com', '21-829574625');
    
INSERT INTO
    telefones (email, telefone)
VALUES
    ('machado.de.assis@gmail.com', '21-382817293');
    
INSERT INTO
    telefones (email, telefone)
VALUES
    ('paula.pimenta@gmail.com', '11-383726384');

INSERT INTO
    telefones (email, telefone)
VALUES
    ('mlmn3@cin.ufpe.br','81-998124438');

INSERT INTO
    telefones (email, telefone)
VALUES
    ('gmsmr@cin.ufpe.br', '81-918374641');

INSERT INTO
    telefones (email, telefone)
VALUES
    ('mcta@cin.ufpe.br', '81-976153812');

INSERT INTO
    telefones (email, telefone)
VALUES
    ('jrco@cin.ufpe.br', '82-978432451');

INSERT INTO
    telefones (email, telefone)
VALUES
    ('cristaldog@gmail.com', '83-178123451');


---------- AUTOR ----------
INSERT INTO
    autor (email, biografia)
VALUES ('jane.austen@gmail.com', 'Jane Austen foi uma escritora inglesa, considerada uma das maiores romancistas da literatura inglesas do século XIX.');

INSERT INTO
    autor (email, biografia)
VALUES ('rick.riordan@gmail.com', 'Richard Russell Riordan Jr. é um escritor, mais conhecido por escrever a série Percy Jackson e Os Olimpianos');
    
INSERT INTO
    autor (email, biografia)
VALUES ('john.green@gmail.com', 'John Michael Green é um vlogger, empresário, produtor e autor de livros para jovens.');
    
INSERT INTO
    autor (email, biografia)
VALUES ('machado.de.assis@gmail.com', 'Joaquim Maria Machado de Assis foi um escritor brasileiro, amplamente reconhecido por críticos, estudiosos, escritores e leitores como o maior expoente da literatura brasileira.');
    
INSERT INTO
    autor (email, biografia)
VALUES ('paula.pimenta@gmail.com', 'Paula Pimenta é uma escritora brasileira, conhecida principalmente por suas séries de livros Fazendo Meu Filme e Minha Vida Fora de Série.');


------ PREMIOS ------
INSERT INTO
    premios (email, premio)
VALUES ('rick.riordan@gmail.com', 'Hampshire Book Award');
    
INSERT INTO
    premios (email, premio)
VALUES ('rick.riordan@gmail.com', 'Shamus Award for Best First P. I. Novel');

INSERT INTO
    premios (email, premio)
VALUES ('rick.riordan@gmail.com', 'Prêmio Edgar: Melhor Brochura Original');

INSERT INTO
    premios (email, premio)
VALUES ('john.green@gmail.com', 'Prêmio Michael L. Printz');

INSERT INTO
    premios (email, premio)
VALUES ('machado.de.assis@gmail.com', 'Prêmio Oceanos.');

INSERT INTO
    premios (email, premio)
VALUES ('machado.de.assis@gmail.com', 'Prémio Internacional Pena de Ouro');

INSERT INTO
    premios (email, premio)
VALUES ('machado.de.assis@gmail.com', 'Prêmio Leya');

INSERT INTO
    premios (email, premio)
VALUES ('machado.de.assis@gmail.com', 'Prêmio Jabuti.');


-------- PUBLICACAO --------
CREATE SEQUENCE seq_codpub
START WITH 1
INCREMENT BY 1;

INSERT INTO publicacao (email, cod_pub, conteudo, data_pub)
VALUES ('rick.riordan@gmail.com', seq_codpub.NEXTVAL, 'Percy Jackson e o Ladrão de Raios é uma introdução épica ao mundo dos semideuses.', TO_DATE('2023-08-15', 'YYYY-MM-DD'));

INSERT INTO publicacao (email, cod_pub, conteudo, data_pub)
VALUES ('john.green@gmail.com', seq_codpub.NEXTVAL, 'A Culpa é das Estrelas é uma história tocante que explora o amor e a perda.', TO_DATE('2023-08-20', 'YYYY-MM-DD'));

INSERT INTO publicacao (email, cod_pub, conteudo, data_pub)
VALUES ('paula.pimenta@gmail.com', seq_codpub.NEXTVAL, 'Fazendo Meu Filme é uma leitura leve e encantadora sobre a vida adolescente.', TO_DATE('2023-08-30', 'YYYY-MM-DD'));

INSERT INTO publicacao (email, cod_pub, conteudo, data_pub)
VALUES ('ram3@cin.ufpe.br', seq_codpub.NEXTVAL, 'Recém li "1984" de George Orwell. É um livro impactante e perturbador.', TO_DATE('2023-09-01', 'YYYY-MM-DD'));

INSERT INTO publicacao (email, cod_pub, conteudo, data_pub)
VALUES ('lblp@cin.ufpe.br', seq_codpub.NEXTVAL, 'Acabei de ler "Dom Quixote". Uma jornada épica e hilária pela Espanha medieval.', TO_DATE('2023-09-05', 'YYYY-MM-DD'));

INSERT INTO publicacao (email, cod_pub, conteudo, data_pub)
VALUES ('pms5@cin.ufpe.br', seq_codpub.NEXTVAL, 'O Senhor dos Anéis é uma trilogia épica que redefine o gênero de fantasia.', TO_DATE('2023-09-10', 'YYYY-MM-DD'));

INSERT INTO publicacao (email, cod_pub, conteudo, data_pub)
VALUES ('mcta@cin.ufpe.br', seq_codpub.NEXTVAL, 'Jane Eyre é um romance fascinante, abordando temas como independência e moralidade.', TO_DATE('2023-09-15', 'YYYY-MM-DD'));

INSERT INTO publicacao (email, cod_pub, conteudo, data_pub)
VALUES ('jrco@cin.ufpe.br', seq_codpub.NEXTVAL, 'Moby Dick é uma aventura intensa e filosófica em busca de uma baleia branca.', TO_DATE('2023-09-20', 'YYYY-MM-DD'));

INSERT INTO publicacao (email, cod_pub, conteudo, data_pub)
VALUES ('gmsmr@cin.ufpe.br', seq_codpub.NEXTVAL, 'Alguém tem alguma recomendação de livro curto de suspense?', TO_DATE('2024-02-24', 'YYYY-MM-DD'));

INSERT INTO publicacao (email, cod_pub, conteudo, data_pub)
VALUES ('mlmn3@cin.ufpe.br', seq_codpub.NEXTVAL, 'Ontem li it ends with us, não gostei! achei muito ruim', TO_DATE('2023-09-15', 'YYYY-MM-DD'));


INSERT INTO publicacao (email, cod_pub, conteudo, data_pub)
VALUES ('rick.riordan@gmail.com', seq_codpub.NEXTVAL, 'Estou trabalhando no próximo livro do universo Percy Jackson. Fiquem atentos!', TO_DATE('2023-10-01', 'YYYY-MM-DD'));

INSERT INTO publicacao (email, cod_pub, conteudo, data_pub)
VALUES ('john.green@gmail.com', seq_codpub.NEXTVAL, 'Pensando em escrever algo novo. Alguma sugestão de tema?', TO_DATE('2023-10-05', 'YYYY-MM-DD'));

INSERT INTO publicacao (email, cod_pub, conteudo, data_pub)
VALUES ('paula.pimenta@gmail.com', seq_codpub.NEXTVAL, 'Adorei o novo livro de Nicholas Sparks! Super recomendo...', TO_DATE('2023-10-10', 'YYYY-MM-DD'));

INSERT INTO publicacao (email, cod_pub, conteudo, data_pub)
VALUES ('ram3@cin.ufpe.br', seq_codpub.NEXTVAL, 'Recomendo a leitura de "O Processo" de Kafka. Uma obra intrigante.', TO_DATE('2023-10-12', 'YYYY-MM-DD'));

INSERT INTO publicacao (email, cod_pub, conteudo, data_pub)
VALUES ('lblp@cin.ufpe.br', seq_codpub.NEXTVAL, 'Li "Crime e Castigo". Um mergulho profundo na mente humana.', TO_DATE('2023-10-15', 'YYYY-MM-DD'));

INSERT INTO publicacao (email, cod_pub, conteudo, data_pub)
VALUES ('pms5@cin.ufpe.br', seq_codpub.NEXTVAL, 'Acabei de ler "Harry Potter e a Pedra Filosofal" novamente. A magia nunca envelhece!', TO_DATE('2023-10-18', 'YYYY-MM-DD'));

INSERT INTO publicacao (email, cod_pub, conteudo, data_pub)
VALUES ('mcta@cin.ufpe.br', seq_codpub.NEXTVAL, 'Alguém já leu "O Morro dos Ventos Uivantes"? O que acharam?', TO_DATE('2023-10-20', 'YYYY-MM-DD'));

INSERT INTO publicacao (email, cod_pub, conteudo, data_pub)
VALUES ('jrco@cin.ufpe.br', seq_codpub.NEXTVAL, 'Relendo "O Grande Gatsby". A crítica social é mais relevante do que nunca.', TO_DATE('2023-10-22', 'YYYY-MM-DD'));

INSERT INTO publicacao (email, cod_pub, conteudo, data_pub)
VALUES ('gmsmr@cin.ufpe.br', seq_codpub.NEXTVAL, 'Acabei de ler "O Conto da Aia". Que história poderosa!', TO_DATE('2023-10-25', 'YYYY-MM-DD'));

INSERT INTO publicacao (email, cod_pub, conteudo, data_pub)
VALUES ('mlmn3@cin.ufpe.br', seq_codpub.NEXTVAL, 'Estou lendo "Morte no Nilo" de Agatha Christie. Estou intrigada até agora.', TO_DATE('2023-10-28', 'YYYY-MM-DD'));

INSERT INTO publicacao (email, cod_pub, conteudo, data_pub)
VALUES ('john.green@gmail.com', seq_codpub.NEXTVAL, 'Recentemente, tenho refletido muito sobre o impacto das redes sociais na forma como os jovens percebem o mundo ao seu redor. É fascinante e, ao mesmo tempo, um pouco assustador perceber como as plataformas digitais moldam nossa percepção de realidade, alteram a maneira como nos relacionamos e, em muitos casos, influenciam até mesmo nossos sentimentos mais íntimos. Estou considerando abordar esse tema em meu próximo livro, talvez criando uma história onde os personagens principais naveguem entre as realidades virtual e física, explorando as complexidades e dilemas que surgem dessa interseção. Gostaria de saber o que vocês, meus leitores, pensam sobre isso.', TO_DATE('2023-10-30', 'YYYY-MM-DD'));


-------- USUARIO_PUBLICACAO --------
TRUNCATE TABLE usuario_publicacao;

INSERT INTO
    usuario_publicacao (email, cod_pub)
VALUES ('rick.riordan@gmail.com', 1);
    
INSERT INTO
    usuario_publicacao (email, cod_pub)
VALUES ('john.green@gmail.com', 2);
 
INSERT INTO
    usuario_publicacao (email, cod_pub)
VALUES ('paula.pimenta@gmail.com', 3);
    
INSERT INTO
    usuario_publicacao (email, cod_pub)
VALUES ('ram3@cin.ufpe.br', 4);
    
INSERT INTO
    usuario_publicacao (email, cod_pub)
VALUES ('lblp@cin.ufpe.br', 5);
    
INSERT INTO
    usuario_publicacao (email, cod_pub)
VALUES ('pms5@cin.ufpe.br', 6);
    
INSERT INTO
    usuario_publicacao (email, cod_pub)
VALUES ('mcta@cin.ufpe.br', 7);
    
INSERT INTO
    usuario_publicacao (email, cod_pub)
VALUES ('jrco@cin.ufpe.br', 8);
    
INSERT INTO
    usuario_publicacao (email, cod_pub)
VALUES ('gmsmr@cin.ufpe.br', 9);
    
INSERT INTO
    usuario_publicacao (email, cod_pub)
VALUES ('mlmn3@cin.ufpe.br', 10);
    
INSERT INTO
    usuario_publicacao (email, cod_pub)
VALUES ('rick.riordan@gmail.com', 11);
    
INSERT INTO
    usuario_publicacao (email, cod_pub)
VALUES ('john.green@gmail.com', 12);
    
INSERT INTO
    usuario_publicacao (email, cod_pub)
VALUES ('paula.pimenta@gmail.com', 13);
    
INSERT INTO
    usuario_publicacao (email, cod_pub)
VALUES ('ram3@cin.ufpe.br', 14);
    
INSERT INTO
    usuario_publicacao (email, cod_pub)
VALUES ('lblp@cin.ufpe.br', 15);
    
INSERT INTO
    usuario_publicacao (email, cod_pub)
VALUES ('pms5@cin.ufpe.br', 16);

INSERT INTO
    usuario_publicacao (email, cod_pub)
VALUES ('mcta@cin.ufpe.br', 17);

INSERT INTO
    usuario_publicacao (email, cod_pub)
VALUES ('jrco@cin.ufpe.br', 18);

INSERT INTO
    usuario_publicacao (email, cod_pub)
VALUES ('gmsmr@cin.ufpe.br', 19);

INSERT INTO
    usuario_publicacao (email, cod_pub)
VALUES ('mlmn3@cin.ufpe.br', 20);


------ OBRA -------
CREATE SEQUENCE seq_cod_obra
START WITH 1
INCREMENT BY 1;

INSERT INTO
    obra (cod_obra, titulo, email_cad, pub_cad)
VALUES (seq_cod_obra.NEXTVAL, 'Percy Jackson e o Ladrão de Raios', 'rick.riordan@gmail.com', 1);

INSERT INTO
    obra (cod_obra, titulo, email_cad, pub_cad)
VALUES (seq_cod_obra.NEXTVAL, 'A Culpa é das Estrelas', 'john.green@gmail.com', 2);

INSERT INTO
    obra (cod_obra, titulo, email_cad, pub_cad)
VALUES (seq_cod_obra.NEXTVAL, 'Fazendo Meu Filme', 'paula.pimenta@gmail.com', 3);

INSERT INTO
    obra (cod_obra, titulo, email_cad, pub_cad)
VALUES (seq_cod_obra.NEXTVAL, '1984', 'ram3@cin.ufpe.br', 4);

INSERT INTO
    obra (cod_obra, titulo, email_cad, pub_cad)
VALUES (seq_cod_obra.NEXTVAL, 'Dom Quixote', 'lblp@cin.ufpe.br', 5);

INSERT INTO
    obra (cod_obra, titulo, email_cad, pub_cad)
VALUES (seq_cod_obra.NEXTVAL, 'O Senhor dos Anéis', 'pms5@cin.ufpe.br', 6);

INSERT INTO
    obra (cod_obra, titulo, email_cad, pub_cad)
VALUES (seq_cod_obra.NEXTVAL, 'Jane Eyre', 'mcta@cin.ufpe.br', 7);

INSERT INTO
    obra (cod_obra, titulo, email_cad, pub_cad)
VALUES (seq_cod_obra.NEXTVAL, 'Moby Dick', 'jrco@cin.ufpe.br', 8);

INSERT INTO
    obra (cod_obra, titulo, email_cad, pub_cad)
VALUES (seq_cod_obra.NEXTVAL, 'it ends with us', 'mlmn3@cin.ufpe.br', 10);

INSERT INTO
    obra (cod_obra, titulo, email_cad, pub_cad)
VALUES (seq_cod_obra.NEXTVAL, 'O Processo', 'ram3@cin.ufpe.br', 14);

INSERT INTO
    obra (cod_obra, titulo, email_cad, pub_cad)
VALUES (seq_cod_obra.NEXTVAL, 'Crime e Castigo', 'lblp@cin.ufpe.br', 15);

INSERT INTO
    obra (cod_obra, titulo, email_cad, pub_cad)
VALUES (seq_cod_obra.NEXTVAL, 'Harry Potter e a Pedra Filosofal', 'pms5@cin.ufpe.br', 16);

INSERT INTO
    obra (cod_obra, titulo, email_cad, pub_cad)
VALUES (seq_cod_obra.NEXTVAL, 'O Morro dos Ventos Uivantes', 'mcta@cin.ufpe.br', 17);

INSERT INTO
    obra (cod_obra, titulo, email_cad, pub_cad)
VALUES (seq_cod_obra.NEXTVAL, 'O Grande Gatsby', 'jrco@cin.ufpe.br', 18);

INSERT INTO
    obra (cod_obra, titulo, email_cad, pub_cad)
VALUES (seq_cod_obra.NEXTVAL, 'O Conto da Aia', 'gmsmr@cin.ufpe.br', 19);

INSERT INTO
    obra (cod_obra, titulo, email_cad, pub_cad)
VALUES (seq_cod_obra.NEXTVAL, 'Morte no Nilo', 'mlmn3@cin.ufpe.br', 20);


------- SINOPSES -------
INSERT INTO
    sinopses (cod_obra, sinopse)
VALUES
    (1, 'Percy Jackson e o Ladrão de Raios segue a jornada de um adolescente que descobre ser um semideus e embarca em uma aventura para recuperar o raio roubado de Zeus. Este livro é a introdução perfeita ao universo de Percy Jackson e ao mundo dos mitos gregos modernos.');

INSERT INTO
    sinopses (cod_obra, sinopse)
VALUES
    (2, 'A Culpa é das Estrelas é uma história tocante que acompanha Hazel Grace Lancaster, uma jovem com câncer, enquanto ela se apaixona por Augustus Waters, um sobrevivente de câncer. Juntos, eles exploram temas profundos de amor e perda.');

INSERT INTO
    sinopses (cod_obra, sinopse)
VALUES
    (3, 'Fazendo Meu Filme é uma série de livros que narra a vida de uma adolescente chamada Fani, que enfrenta desafios típicos da idade, enquanto tenta realizar seu sonho de se tornar uma roteirista de cinema. É uma leitura leve e encantadora.');

INSERT INTO
    sinopses (cod_obra, sinopse)
VALUES
    (4, '1984 é um romance distópico de George Orwell que apresenta um regime totalitário e vigilante, explorando temas de controle social, manipulação da verdade e a perda de identidade pessoal em uma sociedade opressiva.');

INSERT INTO
    sinopses (cod_obra, sinopse)
VALUES
    (5, 'Dom Quixote, escrito por Miguel de Cervantes, é a história de um nobre espanhol que, enlouquecido pela leitura de romances de cavalaria, decide se tornar um cavaleiro andante e vive várias aventuras hilárias e trágicas na Espanha medieval.');

INSERT INTO
    sinopses (cod_obra, sinopse)
VALUES
    (6, 'O Senhor dos Anéis é uma trilogia épica de J.R.R. Tolkien que narra a jornada de um grupo de heróis em sua missão para destruir o Anel do Poder e derrotar o Senhor das Trevas, Sauron. É uma obra seminal no gênero de fantasia.');

INSERT INTO
    sinopses (cod_obra, sinopse)
VALUES
    (7, 'Jane Eyre é um romance de Charlotte Brontë que segue a vida de uma jovem órfã, Jane Eyre, que enfrenta adversidades e injustiças, mas encontra amor e independência ao longo de sua jornada. É um estudo profundo sobre moralidade e autonomia.');

INSERT INTO
    sinopses (cod_obra, sinopse)
VALUES
    (8, 'Moby Dick, de Herman Melville, é a história de uma obsessiva busca por uma baleia branca, Moby Dick, pelo capitão Ahab. O livro explora temas como vingança, obsessão e a luta do homem contra as forças da natureza.');

INSERT INTO
    sinopses (cod_obra, sinopse)
VALUES
    (9, 'it ends with us é um romance de Colleen Hoover que explora temas complexos de amor, relacionamentos e superação, seguindo a vida de Lily Bloom enquanto ela lida com o impacto de suas escolhas e passado no presente.');

INSERT INTO
    sinopses (cod_obra, sinopse)
VALUES
    (10, 'O Processo, de Franz Kafka, narra a história de Josef K., um homem que é preso e julgado por um crime que nunca é revelado a ele. A obra explora temas de burocracia e a alienação do indivíduo na sociedade moderna.');

INSERT INTO
    sinopses (cod_obra, sinopse)
VALUES
    (11, 'Crime e Castigo, escrito por Fiódor Dostoiévski, é um romance psicológico que acompanha Rodion Raskólnikov, um ex-estudante que comete um assassinato e enfrenta o tormento psicológico e moral que se segue.');

INSERT INTO
    sinopses (cod_obra, sinopse)
VALUES
    (12, 'Harry Potter e a Pedra Filosofal segue o jovem Harry Potter enquanto ele descobre que é um bruxo e começa sua jornada na Escola de Magia e Bruxaria de Hogwarts, enfrentando desafios e inimigos em seu caminho.');

INSERT INTO
    sinopses (cod_obra, sinopse)
VALUES
    (13, 'O Morro dos Ventos Uivantes é um romance de Emily Brontë que conta a história complexa e turbulenta da família Earnshaw e seus vizinhos, os Lintons, explorando temas de amor, vingança e a natureza humana.');

INSERT INTO
    sinopses (cod_obra, sinopse)
VALUES
    (14, 'O Grande Gatsby, de F. Scott Fitzgerald, é um romance que retrata a vida de Jay Gatsby e suas tentativas de reconquistar seu amor perdido, Daisy Buchanan, explorando temas de riqueza, status e o sonho americano.');

INSERT INTO
    sinopses (cod_obra, sinopse)
VALUES
    (15, 'O Conto da Aia, de Margaret Atwood, é uma distopia que imagina um futuro em que as mulheres são subordinadas a um regime teocrático e totalitário. A história segue uma aia chamada Defred enquanto ela luta por sua liberdade e identidade.');

INSERT INTO
    sinopses (cod_obra, sinopse)
VALUES
    (16, 'Morte no Nilo é um romance de Agatha Christie que apresenta a detetive Hercule Poirot investigando um assassinato em um cruzeiro pelo rio Nilo. O livro é uma intrigante mistura de mistério e suspense com uma trama envolvente.');


------- AUTORES -------
INSERT INTO
    autores (cod_obra, autor)
VALUES (1,'Rick Riordan');

INSERT INTO
    autores (cod_obra, autor)
VALUES (2,'John Green');

INSERT INTO
    autores (cod_obra, autor)
VALUES (3,'Paula Pimenta');

INSERT INTO
    autores (cod_obra, autor)
VALUES (4,'George Orwell');

INSERT INTO
    autores (cod_obra, autor)
VALUES (5,'Miguel de Cervantes');

INSERT INTO
    autores (cod_obra, autor)
VALUES (6,'J. R. R. Tolkien');

INSERT INTO
    autores (cod_obra, autor)
VALUES (7,'Charlotte Brontë');

INSERT INTO
    autores (cod_obra, autor)
VALUES (8,'Herman Melville');

INSERT INTO
    autores (cod_obra, autor)
VALUES (9,'Colleen Hoover');

INSERT INTO
    autores (cod_obra, autor)
VALUES (10,'Franz Kafka');

INSERT INTO
    autores (cod_obra, autor)
VALUES (11,'Fiódor Dostoiévski');

INSERT INTO
    autores (cod_obra, autor)
VALUES (12,'J.K Rowling');

INSERT INTO
    autores (cod_obra, autor)
VALUES (13,'Emily Brontë');

INSERT INTO
    autores (cod_obra, autor)
VALUES (14,'F. Scott Fitzgerald');

INSERT INTO
    autores (cod_obra, autor)
VALUES (15,'Margaret Atwood');

INSERT INTO
    autores (cod_obra, autor)
VALUES (16,'Agatha Christie');


------- GENEROS -------
INSERT INTO generos (cod_obra, genero)
VALUES (1, 'Fantasia');

INSERT INTO generos (cod_obra, genero)
VALUES (2, 'Romance');

INSERT INTO generos (cod_obra, genero)
VALUES (3, 'Juvenil');

INSERT INTO generos (cod_obra, genero)
VALUES (4, 'Distopia');

INSERT INTO generos (cod_obra, genero)
VALUES (5, 'Clássico');

INSERT INTO generos (cod_obra, genero)
VALUES (6, 'Fantasia');

INSERT INTO generos (cod_obra, genero)
VALUES (7, 'Romance Clássico');

INSERT INTO generos (cod_obra, genero)
VALUES (8, 'Aventura');

INSERT INTO generos (cod_obra, genero)
VALUES (9, 'Romance');

INSERT INTO generos (cod_obra, genero)
VALUES (10, 'Drama');

INSERT INTO generos (cod_obra, genero)
VALUES (11, 'Realismo');

INSERT INTO generos (cod_obra, genero)
VALUES (12, 'Fantasia');

INSERT INTO generos (cod_obra, genero)
VALUES (13, 'Romance Gótico');

INSERT INTO generos (cod_obra, genero)
VALUES (14, 'Ficção');

INSERT INTO generos (cod_obra, genero)
VALUES (15, 'Realismo');

INSERT INTO generos (cod_obra, genero)
VALUES (16, 'Mistério');


-------- REFERENCIAR ---------
INSERT INTO
    referenciar (cod_obra, email, cod_pub)
VALUES (1,'rick.riordan@gmail.com', 1);

INSERT INTO
    referenciar (cod_obra, email, cod_pub)
VALUES (2,'john.green@gmail.com', 2);

INSERT INTO
    referenciar (cod_obra, email, cod_pub)
VALUES (3,'paula.pimenta@gmail.com', 3);

INSERT INTO
    referenciar (cod_obra, email, cod_pub)
VALUES (4,'ram3@cin.ufpe.br', 4);

INSERT INTO
    referenciar (cod_obra, email, cod_pub)
VALUES (5,'lblp@cin.ufpe.br', 5);

INSERT INTO
    referenciar (cod_obra, email, cod_pub)
VALUES (6,'pms5@cin.ufpe.br', 6);

INSERT INTO
    referenciar (cod_obra, email, cod_pub)
VALUES (7,'mcta@cin.ufpe.br', 7);

INSERT INTO
    referenciar (cod_obra, email, cod_pub)
VALUES (8,'jrco@cin.ufpe.br', 8);

INSERT INTO
    referenciar (cod_obra, email, cod_pub)
VALUES (9,'mlmn3@cin.ufpe.br' , 10);

INSERT INTO
    referenciar (cod_obra, email, cod_pub)
VALUES (10,'ram3@cin.ufpe.br' , 14);

INSERT INTO
    referenciar (cod_obra, email, cod_pub)
VALUES (11,'lblp@cin.ufpe.br' , 15);

INSERT INTO
    referenciar (cod_obra, email, cod_pub)
VALUES (12,'pms5@cin.ufpe.br' , 16);

INSERT INTO
    referenciar (cod_obra, email, cod_pub)
VALUES (13,'mcta@cin.ufpe.br' , 17);

INSERT INTO
    referenciar (cod_obra, email, cod_pub)
VALUES (14,'jrco@cin.ufpe.br' , 18);

INSERT INTO
    referenciar (cod_obra, email, cod_pub)
VALUES (15,'gmsmr@cin.ufpe.br' , 19);

INSERT INTO
    referenciar (cod_obra, email, cod_pub)
VALUES (16,'mlmn3@cin.ufpe.br' , 20);

------- COMENTARIO --------
CREATE SEQUENCE seq_cod_com
START WITH 1
INCREMENT BY 1;

INSERT INTO comentario (email, cod_pub, cod_com, conteudo)
VALUES ('gmsmr@cin.ufpe.br', 9, seq_cod_com.NEXTVAL, 'Que tal começar a ler Desventuras em Série? A saga é grande, mas cada livro é curto.');

INSERT INTO comentario (email, cod_pub, cod_com, conteudo)
VALUES ('gmsmr@cin.ufpe.br', 9, seq_cod_com.NEXTVAL, 'Tem alguns contos legais de Edgar Allan Poe que são curtos');

INSERT INTO comentario (email, cod_pub, cod_com, conteudo)
VALUES ('john.green@gmail.com', 12, seq_cod_com.NEXTVAL, 'Que tal algo com redes sociais?');

INSERT INTO comentario (email, cod_pub, cod_com, conteudo)
VALUES ('john.green@gmail.com', 12, seq_cod_com.NEXTVAL, 'Sem ideias no momento...');

INSERT INTO comentario (email, cod_pub, cod_com, conteudo)
VALUES ('mcta@cin.ufpe.br', 17, seq_cod_com.NEXTVAL, 'Simplesmente magnífico! Adoro');

INSERT INTO comentario (email, cod_pub, cod_com, conteudo)
VALUES ('mcta@cin.ufpe.br', 17, seq_cod_com.NEXTVAL, 'é um clássico, mas não sou fã..');

INSERT INTO comentario (email, cod_pub, cod_com, conteudo)
VALUES ('mlmn3@cin.ufpe.br', 20, seq_cod_com.NEXTVAL, 'Não darei spoilers, mas o final é bem interessante');


--------- COMENTAR --------


--------- SEGUIR --------
INSERT INTO seguir (seguidor, seguido)
VALUES ('ram3@cin.ufpe.br', 'jane.austen@gmail.com');

INSERT INTO seguir (seguidor, seguido)
VALUES ('lblp@cin.ufpe.br', 'jane.austen@gmail.com');

INSERT INTO seguir (seguidor, seguido)
VALUES ('pms5@cin.ufpe.br', 'jane.austen@gmail.com');

INSERT INTO seguir (seguidor, seguido)
VALUES ('rick.riordan@gmail.com', 'jane.austen@gmail.com');

INSERT INTO seguir (seguidor, seguido)
VALUES ('paula.pimenta@gmail.com', 'jane.austen@gmail.com');

INSERT INTO seguir (seguidor, seguido)
VALUES ('mlmn3@cin.ufpe.br', 'jane.austen@gmail.com');

INSERT INTO seguir (seguidor, seguido)
VALUES ('gmsmr@cin.ufpe.br', 'jane.austen@gmail.com');

INSERT INTO seguir (seguidor, seguido)
VALUES ('gmsmr@cin.ufpe.br', 'mlmn3@cin.ufpe.br');

INSERT INTO seguir (seguidor, seguido)
VALUES ('mcta@cin.ufpe.br', 'mlmn3@cin.ufpe.br');

INSERT INTO seguir (seguidor, seguido)
VALUES ('mlmn3@cin.ufpe.br', 'gmsmr@cin.ufpe.br');

INSERT INTO seguir (seguidor, seguido)
VALUES ('mcta@cin.ufpe.br', 'gmsmr@cin.ufpe.br');

INSERT INTO seguir (seguidor, seguido)
VALUES ('mlmn3@cin.ufpe.br', 'mcta@cin.ufpe.br');

INSERT INTO seguir (seguidor, seguido)
VALUES ('gmsmr@cin.ufpe.br', 'mcta@cin.ufpe.br');
INSERT INTO seguir (seguidor, seguido)
VALUES ('ram3@cin.ufpe.br', 'lblp@cin.ufpe.br');

INSERT INTO seguir (seguidor, seguido)
VALUES ('pms5@cin.ufpe.br', 'lblp@cin.ufpe.br');

INSERT INTO seguir (seguidor, seguido)
VALUES ('rick.riordan@gmail.com', 'pms5@cin.ufpe.br');

INSERT INTO seguir (seguidor, seguido)
VALUES ('john.green@gmail.com', 'rick.riordan@gmail.com');

INSERT INTO seguir (seguidor, seguido)
VALUES ('paula.pimenta@gmail.com', 'machado.de.assis@gmail.com');

INSERT INTO seguir (seguidor, seguido)
VALUES ('mlmn3@cin.ufpe.br', 'machado.de.assis@gmail.com');

INSERT INTO seguir (seguidor, seguido)
VALUES ('gmsmr@cin.ufpe.br', 'machado.de.assis@gmail.com');

INSERT INTO seguir (seguidor, seguido)
VALUES ('mcta@cin.ufpe.br', 'machado.de.assis@gmail.com');

INSERT INTO seguir (seguidor, seguido)
VALUES ('jrco@cin.ufpe.br', 'paula.pimenta@gmail.com');

INSERT INTO seguir (seguidor, seguido)
VALUES ('ram3@cin.ufpe.br', 'jrco@cin.ufpe.br');

INSERT INTO seguir (seguidor, seguido)
VALUES ('cristaldog@gmail.com', 'ram3@cin.ufpe.br');

INSERT INTO seguir (seguidor, seguido)
VALUES ('jane.austen@gmail.com', 'cristaldog@gmail.com');

INSERT INTO seguir (seguidor, seguido)
VALUES ('rick.riordan@gmail.com', 'mcta@cin.ufpe.br');

INSERT INTO seguir (seguidor, seguido)
VALUES ('john.green@gmail.com', 'mlmn3@cin.ufpe.br');

