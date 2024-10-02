// FIND e PRETTY: retorna os membros registrados na biblioteca
db.membros.find({}).pretty();

// FIND e COUNT: retorna a quantidade de autores
db.autores.find({}).count();

// FIND e ELEMMATCH: seleciona os livros que receberam uma nota maior ou igual a 90 do The New York Times
db.livros.find({
    critica: {
      $elemMatch: {
        veiculo: "The New York Times",
        nota: { $gte: 90 }
      }
    }
});

// FIND e EXISTS: retorna os eventos que tẽm autores e membros e são não vazios
db.eventos.find({
  $and: [
    { autores: { $exists: true, $ne: [] } }, 
    { membros: { $exists: true, $ne: [] } }  
  ]
});

// FIND e ALL: retorna os autores que possuem todos os prêmios listados
db.autores.find({premios: {$all: ['Hampshire Book Award', 'Shamus Award for Best First P. I. Novel']}});

// AGGREGATE, PROJECT, SORT e LIMIT: retorna o nome autor que possui o maior número de prêmios
db.autores.aggregate([
  {$project: {nome: 1, n_premios: {$size: "$premios"}}},
  {$sort: {n_premios: -1}},
  {$limit: 1}
]);

// AGGREGATE, MATCH e GROUP: seleciona a média do número de páginas dos livros lançados a partir dos anos 2000
db.livros.aggregate([
  { $match: { data_pub: { $gte: new Date('2000-01-01') } } },
  { $group: { _id: null,  media_paginas: { $avg: "$num_paginas" } } }
]);

//FIND: retorna livros do genero aventura 
db.livros.find({generos: 'aventura'});
//FIND e GTE: retorna livros disponíveis
db.livros.find({qtdd_disponivel: {$gt: 0}});
//FIND: retorna livros indisponíveis
db.livros.find({qtdd_disponivel: 0});
//FIND: retorna livros publicados no ano mais recente
db.livros.find({data_pub: {$gt: new Date("2023-12-31T00:00:00.000Z")}});

//AGGREGATE, MATCH, GROUP e AVG: retorna a média das críticas de cada livro
db.livros.aggregate([
  { $unwind: '$critica' },
  { $match: { 'critica.nota': { $gt: 90 } } },
  { $group: { _id: '$titulo', media: { $avg: '$critica.nota' } } }
]);

//AGGREGATE, GROUP, SUM: retorna a quantidade total de livros disponíveis  por status
db.livros.aggregate([
  { $group: { _id: "$status", totalDisponivel: { $sum: "$qtdd_disponivel" } } }
]);

//AGGREGATE, LOOKUP: retorna a relação entre cada evento, seus autores e os livros publicados por esses autores
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

