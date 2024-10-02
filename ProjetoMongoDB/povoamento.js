use ('biblioteca');

db.createCollection("livros");
db.createCollection("autores");
db.createCollection("membros");
db.createCollection("emprestimos");
db.createCollection("reservas");
db.createCollection("eventos");

db.livros.insertOne(
	{
	_id: 1,
	titulo: 'Percy Jackson e o Ladrão de Raios',
	data_pub: Date('28/06/2005'),
	sinopse: 'Um artefato precioso foi roubado do Monte Olimpo e Percy é o principal suspeito. Para restaurar a paz, ele e seus amigos – jovens heróis modernos – terão de fazer mais do que capturar o verdadeiro ladrão: precisam elucidar uma traição mais ameaçadora que fúria dos deuses.',
	generos: [
		'ação',
		'aventura'
		],
	status: 'emprestado',
	qtdd_disponivel: 3
	}
);

db.autores.insertOne(
	{
	_id: 1,
	nome: 'Richard Russell Riordan Jr',
	data_nasc: Date('05/06/1964'),
	email: 'rickriordan@gmail.com',
	livros_escritos: [
		{titulo_livro: 1,
			critica: 92
		}
		],
	premios: [
		'melhor autor 2006'
		]	
	}
);

db.membros.insertOne(
	{
	_id: 1,
	nome: 'José da Silva',
	data_filiacao: Date('05/06/2022'),
	email: 'josesilva@gmail.com'
	}
);

db.eventos.insertOne(
	{
	nome: 'Livros do ano',
	autores: [
		{autor_id: 1,
		nome: 'Richard Russell Riordan Jr'}
		],
	membros: [
		{membro_id: 1,
		nome: 'José da Silva'}
		]
	}
);

db.emprestimos.insertOne(
	{
	livro_id: 1,
	membro_id: 1,
	data: Date('05/06/2024'),
	tempo: '7 dias'
	}
);

db.reservas.insertOne(
	{
	livro_id: 1,
	membro_id: 1,
	data: Date('09/06/2024'),
	}
);
