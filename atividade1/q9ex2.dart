void main() {
  GraduacaoLate objectLate = GraduacaoLate("Direito");
  objectLate.licenciatura = "Matemática"; //inicializacao necessaria
  print(objectLate.toString());
}

// Nesse exemplo vamos usar o Late para permitir que iniciemos com o nulo
//Dessa forma, dizemos que a licenciatura sera recebida depois
//Mas nesse caso se formos fazer um teste temos que ter o cuidado de inicializar a licenciatura
//Vamos demostrar isso com um teste
//Note que nesse teste usamos o late sem utilizar o ? ou !
class GraduacaoLate {
  String bacharelado;
  late String licenciatura;

  GraduacaoLate(this.bacharelado);

  String toString() {
    return this.bacharelado + " " + this.licenciatura;
  }
}
