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
            {livro_id: 2, data_pedido: new Date('2024-07-08')}
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
