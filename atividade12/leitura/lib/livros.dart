class Livros {
  final int id;
  final String livro;
  final String situacao;

  Livros(this.id, this.livro, this.situacao);

  @override
  String toString(){
    return 'Livros{id: $id, livro: $livro, situacao: $situacao}';
  }
}