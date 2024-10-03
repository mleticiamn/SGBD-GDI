use ('biblioteca');

// ------- EVENTOS -------
db.createCollection("livros");

db.livros.insertMany([
	{
	 _id: 1,
    	 titulo: 'Percy Jackson e o Ladrão de Raios',
    	 data_pub: new Date('2005-06-28'),
    	 sinopse: 'Um artefato precioso foi roubado do Monte Olimpo e Percy é o principal suspeito. Para restaurar a paz, ele e seus amigos – jovens heróis modernos – terão de fazer mais do que capturar o verdadeiro ladrão: precisam elucidar uma traição mais ameaçadora que fúria dos deuses.',
    	 generos: ['ação', 'aventura'],
    	 qtdd_disponivel: 10,
    	 critica: [
        	{ veiculo: 'The New York Times', nota: 90 },
        	{ veiculo: 'Kirkus Reviews', nota: 88 },
        	{ veiculo: 'Goodreads', nota: 92 }
    	],
    	emprestimo: [
        	{membro_id: 1,
        	data_inicio: new Date('2024-06-05'),
        	data_fim: new Date('2024-06-12')}
    	],
	reserva: [],
   	autor_id: 1 
	},
	{
	  _id: 2,
	  titulo: 'Percy Jackson e o Mar de Monstros',
	  data_pub: new Date('2006-05-03'),
	  sinopse: 'Para salvar o mundo, Percy e seus amigos precisam encontrar o poderoso e mágico Velocino de Ouro.',
	  generos: ['ação', 'aventura'],
	  status: 'reservado',
	  qtdd_disponivel: 0,
	  num_paginas: 304,
	  critica: [
	    { veiculo: 'The New York Times', nota: 85 },
	    { veiculo: 'Kirkus Reviews', nota: 87 },
	    { veiculo: 'Goodreads', nota: 91 }
	  ],
	  emprestimo: [
        	{membro_id: 3,
        	data_inicio: new Date('2024-02-05'),
        	data_fim: new Date('2024-02-12')},
		{membro_id: 1,
        	data_inicio: new Date('2024-02-07'),
        	data_fim: new Date('2024-02-14')},
    	],
	  reserva: [
		{membro_id: 2,
		data_pedido: new Date('2024-07-08')
		}
	],
	  autor_id: 1
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
	  ],
	  emprestimo: [
	  	{membro_id: 2,
	 	 data_inicio: new Date('2024-06-21'),
	  	 data_fim: new Date('2024-06-28')}
    	  ],
	  reserva: [],
	  autor_id: 2
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
	  ],
	  emprestimo: [
            {membro_id: 2,
             data_inicio: new Date('2024-05-15'),
             data_fim: new Date('2024-05-22')}
    	  ],
	  reserva: [],
	  autor_id: 3
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
	  ],
	  emprestimo: [
            {membro_id: 3,
             data_inicio: new Date('2024-07-18'),
             data_fim: new Date('2024-07-25')}
    	  ],
	    reserva: [],
	    autor_id: 4
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
	  ],
	  emprestimo: [
            {membro_id: 1,
             data_inicio: new Date('2024-04-15'),
             data_fim: new Date('2024-04-22')}
    	  ],
	  reserva: [],
	  autor_id: 5
	},
	{
		_id: 7,
		titulo: 'A Menina que Roubava Livros',
		data_pub: new Date('2005-09-01'),
		sinopse: 'Durante a Segunda Guerra Mundial, uma jovem alemã encontra conforto ao roubar livros e compartilhá-los com seus vizinhos.',
		generos: ['drama', 'histórico'],
		status: 'disponível',
		qtdd_disponivel: 8,
		num_paginas: 552,
		critica: [
		  { veiculo: 'The Guardian', nota: 85 },
		  { veiculo: 'The New York Times', nota: 88 },
		  { veiculo: 'Goodreads', nota: 91 }
		],
		emprestimo: [],
		reserva: [],
		autor_id: 6
	  },
	  {
		_id: 8,
		titulo: 'O Hobbit',
		data_pub: new Date('1937-09-21'),
		sinopse: 'Bilbo Bolseiro é levado em uma aventura inesperada para recuperar o tesouro guardado pelo dragão Smaug.',
		generos: ['fantasia', 'aventura'],
		status: 'disponível',
		qtdd_disponivel: 6,
		num_paginas: 310,
		critica: [
		  { veiculo: 'The New York Times', nota: 92 },
		  { veiculo: 'Kirkus Reviews', nota: 95 },
		  { veiculo: 'Goodreads', nota: 96 }
		],
		emprestimo: [],
		reserva: [],
		autor_id: 3
	  },
	  {
		_id: 9,
		titulo: '1984',
		data_pub: new Date('1949-06-08'),
		sinopse: 'Em uma sociedade totalitária, Winston Smith luta contra o governo onipresente e a vigilância constante do Grande Irmão.',
		generos: ['ficção científica', 'distopia'],
		status: 'disponível',
		qtdd_disponivel: 5,
		num_paginas: 328,
		critica: [
		  { veiculo: 'The Guardian', nota: 94 },
		  { veiculo: 'The New York Times', nota: 96 },
		  { veiculo: 'Publishers Weekly', nota: 93 }
		],
		emprestimo: [
			  {membro_id: 2,
			   data_inicio: new Date('2024-03-15'),
			   data_fim: new Date('2024-03-22')}
			],
		reserva: [],
		autor_id: 7
	  },
	  {
		_id: 10,
		titulo: 'Dom Quixote',
		data_pub: new Date('1605-01-16'),
		sinopse: 'A história das aventuras de Dom Quixote de La Mancha, um fidalgo que acredita ser um cavaleiro medieval.',
		generos: ['clássico', 'aventura'],
		status: 'disponível',
		qtdd_disponivel: 4,
		num_paginas: 1072,
		critica: [
		  { veiculo: 'The Guardian', nota: 88 },
		  { veiculo: 'Goodreads', nota: 90 }
		],
		emprestimo: [
			{membro_id: 5,
				data_inicio: new Date('2024-06-30'),
				data_fim: new Date('2024-06-31')}
		],
		reserva: [],
		autor_id: 8
	  },
	  {
		_id: 11,
		titulo: 'O Apanhador no Campo de Centeio',
		data_pub: new Date('1951-07-16'),
		sinopse: 'Holden Caulfield, um adolescente perturbado, narra sua fuga de um colégio interno e suas reflexões sobre a vida.',
		generos: ['drama', 'ficção'],
		status: 'disponível',
		qtdd_disponivel: 9,
		num_paginas: 234,
		critica: [
		  { veiculo: 'The New York Times', nota: 89 },
		  { veiculo: 'Kirkus Reviews', nota: 87 },
		  { veiculo: 'Goodreads', nota: 88 }
		],
		emprestimo: [],
		reserva: [
			{membro_id: 2,
			data_pedido: new Date('2024-07-29')
			}
		],
		autor_id: 9
	  },
	  {
		_id: 12,
		titulo: 'Cem Anos de Solidão',
		data_pub: new Date('1967-05-30'),
		sinopse: 'A saga da família Buendía ao longo de várias gerações na cidade fictícia de Macondo, explorando temas de realismo mágico.',
		generos: ['realismo mágico', 'drama'],
		status: 'disponível',
		qtdd_disponivel: 3,
		num_paginas: 417,
		critica: [
		  { veiculo: 'The New York Times', nota: 95 },
		  { veiculo: 'Goodreads', nota: 97 }
		],
		emprestimo: [],
		reserva: [],
		autor_id: 10
	  },
	  {
		_id: 13,
		titulo: 'A Revolução dos Bichos',
		data_pub: new Date('1945-08-17'),
		sinopse: 'Uma fábula política sobre uma revolta dos animais contra seus donos humanos em uma fazenda.',
		generos: ['ficção', 'sátira', 'política'],
		status: 'disponível',
		qtdd_disponivel: 7,
		num_paginas: 112,
		critica: [
		  { veiculo: 'The Guardian', nota: 90 },
		  { veiculo: 'Publishers Weekly', nota: 92 }
		],
		emprestimo: [],
		reserva: [],
		autor_id: 7
	  },
	  {
		_id: 14,
		titulo: 'Admirável Mundo Novo',
		data_pub: new Date('1932-12-31'),
		sinopse: 'Uma distopia que explora um futuro onde as pessoas são geneticamente criadas e controladas por um governo totalitário.',
		generos: ['ficção científica', 'distopia'],
		status: 'disponível',
		qtdd_disponivel: 6,
		num_paginas: 268,
		critica: [
		  { veiculo: 'The New York Times', nota: 91 },
		  { veiculo: 'Goodreads', nota: 89 }
		],
		emprestimo: [],
		reserva: [],
		autor_id: 11
	  },
	  {
		_id: 15,
		titulo: 'O Pequeno Príncipe',
		data_pub: new Date('1943-04-06'),
		sinopse: 'Um piloto que cai no deserto do Saara encontra um jovem príncipe que lhe conta sobre suas viagens a vários planetas.',
		generos: ['infantil', 'filosofia', 'aventura'],
		status: 'disponível',
		qtdd_disponivel: 10,
		num_paginas: 96,
		critica: [
		  { veiculo: 'The New York Times', nota: 98 },
		  { veiculo: 'Goodreads', nota: 96 }
		],
		emprestimo: [],
		reserva: [
			{membro_id: 7,
			data_pedido: new Date('2024-07-08')
			}
		],
		autor_id: 12
	  }
]);


//------- AUTORES ------
db.createCollection("autores");

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
		db.livros.findOne({titulo: 'O Senhor dos Anéis: A Sociedade do Anel'}),
		db.livros.findOne({titulo: 'O Hobbit'})
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
	  },
	  {
		_id: 6,
		nome: 'Markus Zusak',
		data_nasc: new Date('1975-06-23'),
		email: 'markuszusak@gmail.com',
		livros_escritos: [
		  db.livros.findOne({titulo: 'A Menina que Roubava Livros'})
		],
		premios: ['Prêmio da Crítica da Austrália', 'Prêmio de Melhor Livro do Ano de 2006']
	  },
	  {
		_id: 7,
		nome: 'George Orwell',
		data_nasc: new Date('1903-06-25'),
		email: 'georgeorwell@gmail.com',
		livros_escritos: [
		  db.livros.findOne({titulo: '1984'}),
		  db.livros.findOne({titulo: 'A Revolução dos Bichos'})
		],
		premios: ['Prêmio Hugo de Melhor Romance', 'Prêmio Prometheus']
	  },
	  {
		_id: 8,
		nome: 'Miguel de Cervantes',
		data_nasc: new Date('1547-09-29'),
		email: 'cervantes@gmail.com',
		livros_escritos: [
		  db.livros.findOne({titulo: 'Dom Quixote'})
		],
		premios: ['Reconhecimento como um dos maiores romancistas da literatura']
	  },
	  {
		_id: 9,
		nome: 'J.D. Salinger',
		data_nasc: new Date('1919-01-01'),
		email: 'jd.salinger@gmail.com',
		livros_escritos: [
		  db.livros.findOne({titulo: 'O Apanhador no Campo de Centeio'})
		],
		premios: ['Prêmio de Melhor Livro do Ano de 1951']
	  },
	  {
		_id: 10,
		nome: 'Gabriel García Márquez',
		data_nasc: new Date('1927-03-06'),
		email: 'gabrielgarcia@gmail.com',
		livros_escritos: [
		  db.livros.findOne({titulo: 'Cem Anos de Solidão'})
		],
		premios: ['Prêmio Nobel de Literatura', 'Prêmio de Literatura Latino-Americana']
	  },
	  {
		_id: 11,
		nome: 'A. Huxley',
		data_nasc: new Date('1894-07-26'),
		email: 'aldoushuxley@gmail.com',
		livros_escritos: [
		  db.livros.findOne({titulo: 'Admirável Mundo Novo'})
		],
		premios: ['Prêmio James Tait Black']
	  },
	  {
		_id: 12,
		nome: 'Antoine de Saint-Exupéry',
		data_nasc: new Date('1900-06-29'),
		email: 'saint-exupery@gmail.com',
		livros_escritos: [
		  db.livros.findOne({titulo: 'O Pequeno Príncipe'})
		],
		premios: ['Prêmio de Literatura Juvenil']
	  }
]);


//-------- MEMBROS -------
db.createCollection("membros");

db.membros.insertMany([
    {
        _id: 1,
        idade: 65,
        nome: 'José da Silva',
        data_filiacao: new Date('2022-06-05'),
        email: 'josesilva@gmail.com',
        emprestimos: [
            {livro_id: 1, data_inicio: new Date('2024-06-05'), data_fim: new Date('2024-06-12')},
            {livro_id: 2, data_inicio: new Date('2024-02-07'), data_fim: new Date('2024-02-14')},
            {livro_id: 6, data_inicio: new Date('2024-04-15'), data_fim: new Date('2024-04-22')}
        ],
        reservas: []
    },
    {
        _id: 2,
        idade: 34,
        nome: 'Maria Souza',
        data_filiacao: new Date('2023-01-12'),
        email: 'mariasouza@gmail.com',
        emprestimos: [
            {livro_id: 3, data_inicio: new Date('2024-06-21'), data_fim: new Date('2024-06-28')},
            {livro_id: 4, data_inicio: new Date('2024-05-15'), data_fim: new Date('2024-05-22')}
        ],
        reservas: [
            {livro_id: 2, data_pedido: new Date('2024-07-08')},
			{livro_id: 11, data_pedido: new Date('2024-07-29')}
        ]
    },
    {
        _id: 3,
        idade: 15,
        nome: 'Ana Pereira',
        data_filiacao: new Date('2021-11-22'),
        email: 'anapereira@gmail.com',
        emprestimos: [
            {livro_id: 5, data_inicio: new Date('2024-07-18'), data_fim: new Date('2024-07-25')},
            {livro_id: 2, data_inicio: new Date('2024-02-05'), data_fim: new Date('2024-02-12')}
        ],
        reservas: []
    },
    {
        _id: 4,
        idade: 28,
        nome: 'Ricardo Lima',
        data_filiacao: new Date('2022-11-10'),
        email: 'ricardolima@gmail.com',
        emprestimos: [
            {livro_id: 1, data_inicio: new Date('2024-06-10'), data_fim: new Date('2024-06-17')},
            {livro_id: 3, data_inicio: new Date('2024-07-05'), data_fim: new Date('2024-07-12')}
        ],
        reservas: [
            {livro_id: 4, data_pedido: new Date('2024-06-01')}
        ]
    },
    {
        _id: 5,
        idade: 42,
        nome: 'Claudia Martins',
        data_filiacao: new Date('2021-05-15'),
        email: 'claudiamartins@gmail.com',
        emprestimos: [
            {livro_id: 2, data_inicio: new Date('2024-03-01'), data_fim: new Date('2024-03-08')},
            {livro_id: 6, data_inicio: new Date('2024-04-22'), data_fim: new Date('2024-04-29')},
			{livro_id: 10, data_inicio: new Date('2024-04-30'), data_fim: new Date('2024-04-31')}
        ],
        reservas: []
    },
    {
        _id: 6,
        idade: 22,
        nome: 'Lucas Oliveira',
        data_filiacao: new Date('2023-02-28'),
        email: 'lucasoliveira@gmail.com',
        emprestimos: [
            {livro_id: 5, data_inicio: new Date('2024-08-01'), data_fim: new Date('2024-08-08')},
            {livro_id: 4, data_inicio: new Date('2024-06-20'), data_fim: new Date('2024-06-27')}
        ],
        reservas: [
            {livro_id: 3, data_pedido: new Date('2024-07-15')}
        ]
    },
    {
        _id: 7,
        idade: 19,
        nome: 'Fernanda Costa',
        data_filiacao: new Date('2022-01-20'),
        email: 'fernandacosta@gmail.com',
        emprestimos: [
            {livro_id: 6, data_inicio: new Date('2024-05-10'), data_fim: new Date('2024-05-17')}
        ],
        reservas: [
            {livro_id: 1, data_pedido: new Date('2024-08-15')},
			{livro_id: 15, data_pedido: new Date('2024-07-15')},
        ]
    },
    {
        _id: 8,
        idade: 37,
        nome: 'André Gomes',
        data_filiacao: new Date('2020-09-05'),
        email: 'andregomes@gmail.com',
        emprestimos: [
            {livro_id: 2, data_inicio: new Date('2024-02-15'), data_fim: new Date('2024-02-22')}
        ],
        reservas: [
            {livro_id: 5, data_pedido: new Date('2024-07-10')}
        ]
    }
]);


//--------- EVENTOS -------
db.createCollection("eventos");

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
	},
	{
        nome: 'Festival Literário de Brasília',
        descricao: 'Um festival literário que amantes da literatura em um evento cultural vibrante. O festival acontecerá de 15 a 18 de agosto de 2024, com atividades para todas as idades.',
        autores: [],
        membros: [
            db.membros.findOne({nome: 'Ricardo Lima'}),
            db.membros.findOne({nome: 'Claudia Martins'}),
            db.membros.findOne({nome: 'José da Silva'}),
            db.membros.findOne({nome: 'Maria Souza'}),
            db.membros.findOne({nome: 'Ana Pereira'})
        ]
    },
    {
        nome: 'Encontro de Escritores de São Paulo',
        descricao: 'Um encontro anual de escritores e leitores para discutir tendências literárias, troca de ideias e networking. O evento acontecerá no dia 25 de novembro de 2024.',
        autores: [
            db.autores.findOne({nome: 'Richard Russell Riordan Jr'}),
            db.autores.findOne({nome: 'Dan Brown'}),
            db.autores.findOne({nome: 'John Green'})
        ],
        membros: [
            db.membros.findOne({nome: 'José da Silva'}),
            db.membros.findOne({nome: 'Ana Pereira'}),
            db.membros.findOne({nome: 'Lucas Oliveira'}),
            db.membros.findOne({nome: 'Maria Souza'})
        ]
    },
    {
        nome: 'Conferência Internacional de Literatura',
        descricao: 'Um evento que reúne autores de renome mundial para discutir a literatura contemporânea, seus desafios e inovações. A conferência ocorrerá de 10 a 12 de outubro de 2024.',
        autores: [
            db.autores.findOne({nome: 'J.R.R. Tolkien'}),
            db.autores.findOne({nome: 'Jane Austen'}),
            db.autores.findOne({nome: 'Dan Brown'})
        ],
        membros: [
            db.membros.findOne({nome: 'Maria Souza'}),
        ]
    },
    {
        nome: 'Feira do Livro de Porto Alegre',
        descricao: 'Evento literário que promove a venda de livros, autógrafos com autores e palestras sobre literatura. A feira acontecerá de 5 a 8 de setembro de 2024.',
        autores: [
            db.autores.findOne({nome: 'John Green'}),
            db.autores.findOne({nome: 'Richard Russell Riordan Jr'})
        ],
        membros: [
            db.membros.findOne({nome: 'Claudia Martins'}),
            db.membros.findOne({nome: 'André Gomes'}),
            db.membros.findOne({nome: 'Ana Pereira'}),
            db.membros.findOne({nome: 'José da Silva'}),
            db.membros.findOne({nome: 'Maria Souza'})
        ]
    },
    {
        nome: 'Grande Encontro de Membros da Biblioteca',
        descricao: 'Um evento especial para todos os membros da biblioteca. Haverá palestras, workshops e oportunidades de networking. O evento acontecerá em 20 de dezembro de 2024.',
        autores: [
            db.autores.findOne({nome: 'Richard Russell Riordan Jr'}),
            db.autores.findOne({nome: 'Dan Brown'}),
            db.autores.findOne({nome: 'John Green'}),
            db.autores.findOne({nome: 'J.R.R. Tolkien'}),
            db.autores.findOne({nome: 'Jane Austen'})
        ],
        membros: [
            db.membros.findOne({nome: 'José da Silva'}),
            db.membros.findOne({nome: 'Maria Souza'}),
            db.membros.findOne({nome: 'Ana Pereira'}),
            db.membros.findOne({nome: 'Ricardo Lima'}),
            db.membros.findOne({nome: 'Claudia Martins'}),
            db.membros.findOne({nome: 'André Gomes'}),
            db.membros.findOne({nome: 'Lucas Oliveira'}),
            db.membros.findOne({nome: 'Fernanda Costa'})
        ]
    }
]);

//FUNCTION: Função para emprestar um livro a um membro
function emprestarLivro(membro_id, livro_id, data_inicio, data_fim) {
    const livro = db.livros.findOne({_id: livro_id});
    
    if (!livro || livro.qtdd_disponivel === 0) {
        print(`Livro ${livro_id} não está disponível para empréstimo.`);
        return;
    }
    db.livros.updateOne(
        { _id: livro_id },
        {
            $inc: { qtdd_disponivel: -1 }, 
            $push: { emprestimo: { membro_id: membro_id, data_inicio: data_inicio, data_fim: data_fim } }
        }
    );
    db.membros.updateOne(
        { _id: membro_id },
        {
            $push: { emprestimos: { livro_id: livro_id, data_inicio: data_inicio, data_fim: data_fim } }
        }
    );

    print(`Livro ${livro.titulo} emprestado ao membro ${membro_id}.`);
}

//FUNCTIO, UPDATEONE e ADDTOSET: Função para adicionar gênero a um livro caso não exista
const generosValidos = ['ação', 'aventura', 'fantasia', 'drama', 'romance'];
function adicionarGenero(livroId, genero) {
    if (generosValidos.includes(genero)) {
        db.livros.updateOne(
            { _id: livroId },
            { $addToSet: { generos: genero } } 
        );

    } else {
        print(`Gênero ${genero} não é válido.`);
    }
}
