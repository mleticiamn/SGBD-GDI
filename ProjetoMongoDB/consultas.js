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
  