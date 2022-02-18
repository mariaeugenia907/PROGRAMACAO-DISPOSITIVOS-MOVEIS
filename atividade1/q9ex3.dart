void main() {
  Biotipo object = Biotipo("Magro", endomorfo: "Obeso");
  print(object.toString());
}

// Nesse ultimo exemplo vamos mostrar outra forma de construir sem inicializaçao
//Vamos usar condicional if para determinar o nao nulo
// Necessitamos utilizar o ! e o return
// Dessa forma, se o valor no teste do endomorfo for nulo a mensagem ira avisar
// Vamos testar
// Note que como nao identificamos o endomorfo a mensagem indicou que tem um nulo
// Vamos colocar o que falta e testar novamente
class Biotipo {
  String ectomorfo;
  String? endomorfo;

  Biotipo(this.ectomorfo, {this.endomorfo});

  String toString() {
    if (this.endomorfo != null) {
      return this.ectomorfo + " " + this.endomorfo!;
    }
    return "Tem nulo";
  }
}
