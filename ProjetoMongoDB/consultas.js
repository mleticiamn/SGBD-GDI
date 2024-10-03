// FIND e PRETTY: retorna os membros registrados na biblioteca de uma forma elegante
db.membros.find({}).pretty();

// FIND e COUNT: retorna a quantidade de autores
db.autores.find({}).count();

//FIND e GT: retorna livros disponíveis
db.livros.find({qtdd_disponivel: {$gt: 0}});

//FIND: retorna livros publicados após 31 de dezembro de 2023
db.livros.find({data_pub: {$gt: new Date("2023-12-31T00:00:00.000Z")}});

// FIND, ELEMMATCH e GTE: retorna todos os livros que têm pelo menos uma crítica do veículo The New York Times com uma nota maior ou igual a 90
// FIND, ELEMMATCH e GTE: seleciona os livros que receberam uma nota maior ou igual a 90 do The New York Times
db.livros.find({
    critica: {
      $elemMatch: {
        veiculo: "The New York Times",
        nota: { $gte: 90 }
      }
    }
});

// FIND e EXISTS: retorna os eventos que têm listas de autores e membros que não estão vazias
db.eventos.find({
  $and: [
    { autores: { $exists: true, $ne: [] } }, 
    { membros: { $exists: true, $ne: [] } }  
  ]
});

// FIND e ALL: retorna os autores que possuem todos os prêmios listados
db.autores.find({premios: {$all: ['Hampshire Book Award', 'Shamus Award for Best First P. I. Novel']}});

// AGGREGATE, PROJECT, SORT e LIMIT: retorna o nome e a quantidade de prêmios recebidos do autor que possui o maior número de prêmios
db.autores.aggregate([
  {$project: {nome: 1, n_premios: {$size: "$premios"}}},
  {$sort: {n_premios: -1}},
  {$limit: 1}
]);

// AGGREGATE, MATCH, GTE, GROUP e AVG: seleciona a média do número de páginas dos livros lançados a partir dos anos 2000
db.livros.aggregate([
  { $match: { data_pub: { $gte: new Date('2000-01-01') } } },
  { $group: { _id: null,  media_paginas: { $avg: "$num_paginas" } } }
]);

//FIND: retorna títulos, sinopses, quantidades disponíveis e datas de publicação dos livros que pertencem ao gênero aventura
db.livros.find({ generos: 'aventura'},
  {
      titulo: 1,
      sinopse: 1,
      qtdd_disponivel: 1,
      data_pub: 1,
      _id: 0
  }
);

//FIND, FILTER, WHERE, COND e PRETTY: retorna alguns dados dos livros com número de páginas entre 300 e 500 que possuem pelo menos uma crítica do The New York Times
db.livros.find({
    $where: "this.num_paginas >= 300 && this.num_paginas <= 500 && this.critica.some(critica => critica.veiculo === 'The New York Times')"
}, {
    titulo: 1,                          
    num_paginas: 1,                
    critica: {                        
        $filter: {
            input: "$critica",
            as: "critica",
            cond: { $eq: ["$$critica.veiculo", "The New York Times"] }
        }
    },
    autor_id: 1                          
}).pretty();

//AGGREGATE, UNWIND, MATCH, GROUP e AVG: retorna a média das notas das críticas que são maiores que 90 para cada título de livro
db.livros.aggregate([
  { $unwind: '$critica' },
  { $match: { 'critica.nota': { $gt: 90 } } },
  { $group: { _id: '$titulo', media: { $avg: '$critica.nota' } } }
]);

//AGGREGATE, GROUP e SUM: retorna a quantidade total de livros disponíveis  por status
db.livros.aggregate([
  { $group: { _id: "$status", totalDisponivel: { $sum: "$qtdd_disponivel" } } }
]);

//AGGREGATE, LOOKUP, PROJECT e PRETTY: retorna a relação entre cada evento, seus autores e os livros publicados por esses autores
db.eventos.aggregate([
  {
    $lookup: {
      from: "autores",                   
      localField: "autores.nome",        
      foreignField: "nome",          
      as: "detalhes_autores"          
    }
  },
  {
    $lookup: {
      from: "livros",                   
      localField: "detalhes_autores._id",
      foreignField: "autor_id",         
      as: "livros_autores_evento"    
    }
  },
  {
    $project: {                          
      nome: 1,
      descricao: 1,
      "detalhes_autores.nome": 1,
      livros_autores_evento: 1
    }
  }
]).pretty();

// UNWIND, AGGREGATE, GROUP e MAX: retorna o período máximo de empréstimo de cada livro em dias
db.membros.aggregate([
  { $unwind: "$emprestimos" },
  { $addFields: {
    periodo_emprestimo: {$subtract: ["$emprestimos.data_fim", "$emprestimos.data_inicio"]}
  }},
    { $addFields: {
    periodo_emprestimo_dias: { $divide: ["$periodo_emprestimo", 1000 * 60 * 60 * 24]}
  }},
  { $group: {
    _id: "$emprestimos.livro_id", maior_periodo: { $max: "$periodo_emprestimo_dias" }
  }}
]);

// Criando índice de texto nos campos que desejamos pesquisar
db.eventos.createIndex({
	nome: "text",
	descricao: "text"
});

// AGGREGATE, MATCH, TEXT, SEARCH, PROJECT, EXPR e SIZE: retorna os eventos que mencionam a palavra "livro" e que têm mais de um autor
db.eventos.aggregate([
	{ $match: { $text: {  $search: "livro" } }},
	{ $match: {$expr: { $gt: [{ $size: "$autores" }, 1] }}},
  { $project: {
      _id: 0, 
      nome: 1,
      descricao: 1,
      num_autores: { $size: "$autores" },
      num_membros: { $size: "$membros" }
    }}
]);

// AGGREGATE, PROJECT, COND e SIZE: se o autor escreveu mais de um livro, retorna o número de livros. Caso contrário, retorna o título do único livro que ele escreveu
db.autores.aggregate([
  {$project: {
      nome: 1,
      livros_info: {
        $cond: {
          if: { $gt: [{ $size: "$livros_escritos" }, 1] },
          then: { $size: "$livros_escritos" },
          else: { $arrayElemAt: ["$livros_escritos.titulo", 0] }
        }
      }
    }
  }
]);

// RENAMECOLLETION: renomeia a coleção livros para livros_cadastrados no banco de dados biblioteca
db.adminCommand({ renameCollection: "biblioteca.livros", to: "biblioteca.livros_cadastrados" });

// UPDATEONE e SET: atualiza o campo qtdd_disponivel do livro com _id igual a 1 para 8
db.livros.updateOne(
  { _id: 1 },
  { $set: { qtdd_disponivel: 8 } }
);

// Remoção de dado
db.eventos.deleteOne({ nome: 'Conferência Internacional de Literatura' });

// MAP REDUCE: contar os empréstimos por membro
var mapFunction = function() {
  this.emprestimos.forEach(function(emprestimo) {
      emit(this._id, 1); 
  }, this);
};

var reduceFunction = function(key, values) {
  return Array.sum(values);  // Soma os valores para cada membro
};

db.membros.mapReduce(
  mapFunction,
  reduceFunction,
  {
      out: "emprestimos_por_membro"  // Nova coleção para os resultados
  }
);
