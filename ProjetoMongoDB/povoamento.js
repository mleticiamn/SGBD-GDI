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
	data_pub: new Date('2005-06-28'),
	sinopse: 'Um artefato precioso foi roubado do Monte Olimpo e Percy é o principal suspeito. Para restaurar a paz, ele e seus amigos – jovens heróis modernos – terão de fazer mais do que capturar o verdadeiro ladrão: precisam elucidar uma traição mais ameaçadora que fúria dos deuses.',
	generos: [
		'ação',
		'aventura'
		],
	status: 'emprestado',
	qtdd_disponivel: 3,
	critica: 92
	}
);

db.autores.insertOne(
	{
	_id: 1,
	nome: 'Richard Russell Riordan Jr',
	data_nasc: new Date('1964-06-05'),
	email: 'rickriordan@gmail.com',
	livros_escritos: [
		db.livros.findOne({titulo: 'Percy Jackson e o Ladrão de Raios'})	
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
	data_filiacao: new Date('2022-06-05'),
	email: 'josesilva@gmail.com'
	}
);

db.eventos.insertOne(
	{
	nome: 'Feira do Livro de Genebra',
	autores: [
		db.autores.findOne({nome: 'Richard Russell Riordan Jr'})
		],
	membros: [
		db.membros.findOne({nome: 'José da Silva'})
		]
	}
);

db.emprestimos.insertOne(
	{
	livro_id: 1,
	membro_id: 1,
	data: new Date('2024-06-05'),
	tempo: '7 dias'
	}
);

db.reservas.insertOne(
	{
	livro_id: 1,
	membro_id: 1,
	data: new Date('2024-06-09'),
	}
);
