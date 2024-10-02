// FIND e PRETTY: retorna os membros registrados na biblioteca
db.membros.find({}).pretty();

// FIND e COUNT: retorna a quantidade de autores
db.autores.find({}).count();

// FIND e ELEMMATCH: Selecionando os livros que receberam uma nota maior ou igual a 90 do The New York Times
db.livros.find({
    critica: {
      $elemMatch: {
        veiculo: "The New York Times",
        nota: { $gte: 90 }
      }
    }
});

// 

//FIND: retorna livros do genero aventura 
db.livros.find({generos: 'aventura'});
//FIND e GTE: retorna livros disponíveis
db.livros.find({qtdd_disponivel: {$gt: 0}});
//FIND: retorna livros indisponíveis
db.livros.find({qtdd_disponivel: 0});
//FIND: retorna livros publicados no ano mais recente
db.livros.find({data_pub: {$gt: new Date("2023-12-31T00:00:00.000Z")}});
  
