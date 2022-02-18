void main() {
  Elemento object = Elemento("terra arenosa", fogo: "fogo azul");
  print(object.toString());
}

// Ao criar essa classe string sem o uso da ? isso quer dizer que nao pode ser vazio
// Assim vamos precisar de um construtor
// Mas mesmo assim surge um novo problema, e se eu nao quiser colocar algo em um dos elementos?
// Nessa situação precisaria do nulo
//Para isso precisamos usar o ?
//Agora vamos fazer uma operação com isso
//Observe que ocorreu um erro, pois o this.fogo pode ser um nulo e se ele for não é mais valido
//Para corrigir podemos colocar o ! que vai indicar que nao sera nulo
// Agora vamos testar
class Elemento {
  String terra;
  String? fogo;

  Elemento(this.terra, {this.fogo});

  String toString() {
    return this.terra + " " + this.fogo!;
  }
}
