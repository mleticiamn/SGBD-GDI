use ('biblioteca');

db.createCollection("livros");
db.createCollection("autores");
db.createCollection("membros");
db.createCollection("eventos");
db.createCollection("emprestimos");
db.createCollection("reservas");

db.livros.insertMany([
	{
	  _id: 1,
	  titulo: 'Percy Jackson e o Ladrão de Raios',
	  data_pub: new Date('2005-06-28'),
	  sinopse: 'Um artefato precioso foi roubado do Monte Olimpo e Percy é o principal suspeito. Para restaurar a paz, ele e seus amigos – jovens heróis modernos – terão de fazer mais do que capturar o verdadeiro ladrão: precisam elucidar uma traição mais ameaçadora que fúria dos deuses.',
	  generos: ['ação', 'aventura'],
	  status: 'emprestado',
	  qtdd_disponivel: 3,
	  num_paginas: 256,
	  critica: [
	    { veiculo: 'The New York Times', nota: 90 },
	    { veiculo: 'Kirkus Reviews', nota: 88 },
	    { veiculo: 'Goodreads', nota: 92 }
	  ]
	},
	{
	  _id: 2,
	  titulo: 'Percy Jackson e o Mar de Monstros',
	  data_pub: new Date('2006-05-03'),
	  sinopse: 'Para salvar o mundo, Percy e seus amigos precisam encontrar o poderoso e mágico Velocino de Ouro.',
	  generos: ['ação', 'aventura'],
	  status: 'reservado',
	  qtdd_disponivel: 3,
	  num_paginas: 304,
	  critica: [
	    { veiculo: 'The New York Times', nota: 85 },
	    { veiculo: 'Kirkus Reviews', nota: 87 },
	    { veiculo: 'Goodreads', nota: 91 }
	  ]
	},
	{
	  _id: 3,
	  titulo: 'O Código Da Vinci',
	  data_pub: new Date('2003-03-18'),
	  sinopse: 'Uma história de conspiração envolvendo símbolos antigos e uma busca frenética pela verdade sobre a linhagem de Cristo.',
	  generos: ['mistério', 'suspense', 'aventura'],
	  status: 'disponível',
	  qtdd_disponivel: 10,
	  num_paginas: 432,
	  critica: [
	    { veiculo: 'The New York Times', nota: 80 },
	    { veiculo: 'Kirkus Reviews', nota: 85 },
	    { veiculo: 'Goodreads', nota: 90 }
	  ]
	},
	{
	  _id: 4,
	  titulo: 'O Senhor dos Anéis: A Sociedade do Anel',
	  data_pub: new Date('1954-07-29'),
	  sinopse: 'Frodo e seus amigos partem em uma jornada perigosa para destruir o Um Anel e derrotar Sauron.',
	  generos: ['fantasia', 'aventura'],
	  status: 'disponível',
	  qtdd_disponivel: 5,
	  num_paginas: 576,
	  critica: [
	    { veiculo: 'The New York Times', nota: 95 },
	    { veiculo: 'Kirkus Reviews', nota: 97 },
	    { veiculo: 'Goodreads', nota: 98 }
	  ]
	},
	{
	  _id: 5,
	  titulo: 'A Culpa é das Estrelas',
	  data_pub: new Date('2012-01-10'),
	  sinopse: 'Dois adolescentes com câncer se apaixonam e compartilham uma jornada emocionante sobre o significado da vida e do amor.',
	  generos: ['drama', 'romance'],
	  status: 'disponível',
	  qtdd_disponivel: 7,
	  num_paginas: 288,
	  critica: [
	    { veiculo: 'The New York Times', nota: 88 },
	    { veiculo: 'Kirkus Reviews', nota: 90 },
	    { veiculo: 'Goodreads', nota: 92 }
	  ]
	},
	{
	  _id: 6,
	  titulo: 'Orgulho e Preconceito',
	  data_pub: new Date('1813-01-28'),
	  sinopse: 'Uma jovem inteligente e independente enfrenta os desafios do orgulho, preconceito e mal-entendidos em uma sociedade inglesa rígida.',
	  generos: ['romance', 'drama'],
	  status: 'disponível',
	  qtdd_disponivel: 4,
	  num_paginas: 424,
	  critica: [
	    { veiculo: 'The New York Times', nota: 92 },
	    { veiculo: 'Publishers Weekly', nota: 94 },
	    { veiculo: 'Goodreads', nota: 95 }
	  ]
	}
]);
  

db.autores.insertMany([
	{
	  _id: 1,
	  nome: 'Richard Russell Riordan Jr',
	  data_nasc: new Date('1964-06-05'),
	  email: 'rickriordan@gmail.com',
	  livros_escritos: [
		db.livros.findOne({titulo: 'Percy Jackson e o Ladrão de Raios'}),
		db.livros.findOne({titulo: 'Percy Jackson e o Mar de Monstros'}),
	  ],
	  premios: ['melhor autor 2006', 'Hampshire Book Award', 'Shamus Award for Best First P. I. Novel']
	},
	{
	  _id: 2,
	  nome: 'Dan Brown',
	  data_nasc: new Date('1964-06-22'),
	  email: 'danbrown@gmail.com',
	  livros_escritos: [
		db.livros.findOne({titulo: 'O Código Da Vinci'})
	  ],
	  premios: ['melhor thriller 2003']
	},
	{
	  _id: 3,
	  nome: 'J.R.R. Tolkien',
	  data_nasc: new Date('1892-01-03'),
	  email: 'tolkien@gmail.com',
	  livros_escritos: [
		db.livros.findOne({titulo: 'O Senhor dos Anéis: A Sociedade do Anel'})
	  ],
	  premios: ['melhor fantasia 1955']
	},
	{
		_id: 4,
		nome: 'John Green',
		data_nasc: new Date('1977-08-24'),
		email: 'johngreen@gmail.com',
		livros_escritos: [
		  db.livros.findOne({titulo: 'A Culpa é das Estrelas'})
		],
		premios: []
	  },
	  {
		_id: 5,
		nome: 'Jane Austen',
		data_nasc: new Date('1775-12-16'),
		email: 'janeausten@gmail.com',
		livros_escritos: [
		  db.livros.findOne({titulo: 'Orgulho e Preconceito'})
		],
		premios: ['Clássico da Literatura Inglesa']
	  }
]);
  

db.membros.insertMany([
	{
	  _id: 1,
	  idade: 65,
	  nome: 'José da Silva',
	  data_filiacao: new Date('2022-06-05'),
	  email: 'josesilva@gmail.com'
	},
	{
	  _id: 2,
	  idade: 34,
	  nome: 'Maria Souza',
	  data_filiacao: new Date('2023-01-12'),
	  email: 'mariasouza@gmail.com'
	},
	{
	  _id: 3,
	  idade: 15,
	  nome: 'Ana Pereira',
	  data_filiacao: new Date('2021-11-22'),
	  email: 'anapereira@gmail.com'
	}
  ]);
  

  db.eventos.insertMany([
	{
	  nome: 'Feira do Livro de Genebra',
	  descricao: 'A Embaixada de Portugal em Genebra, em articulação com a Coordenação do Ensino Português na Suíça, participa na 35.ª feira anual do livro em Genebra, que decorre na PALEXPO entre os dias 6 e 10 de março de 2024.',
	  autores: [
		db.autores.findOne({nome: 'Richard Russell Riordan Jr'})
	  ],
	  membros: [
		db.membros.findOne({nome: 'José da Silva'})
	  ]
	},
	{
	  nome: 'Semana do Livro de Nova York',
	  descricao: 'Evento anual com autores renomados e novos escritores. Uma celebração do mundo literário, com palestras e autógrafos.',
	  autores: [
		db.autores.findOne({nome: 'Dan Brown'}),
		db.autores.findOne({nome: 'John Green'})
	  ],
	  membros: [
		db.membros.findOne({nome: 'José da Silva'}),
		db.membros.findOne({nome: 'Maria Souza'}),
		db.membros.findOne({nome: 'Ana Pereira'})
	  ]
	}
]);
  
db.emprestimos.insertOne(
	{
	livro_id: db.livros.findOne({titulo: 'Percy Jackson e o Ladrão de Raios'}),
	membro_id: db.membros.findOne({nome: 'José da Silva'}),
	data: new Date('2024-06-05'),
	tempo: '7 dias'
	}
);

db.reservas.insertOne(
	{
	livro_id: db.livros.findOne({titulo: 'Percy Jackson e o Mar de Monstros'}),
	membro_id: db.membros.findOne({nome: 'Ana Pereira'}),
	data: new Date('2024-06-09')
	}
);
