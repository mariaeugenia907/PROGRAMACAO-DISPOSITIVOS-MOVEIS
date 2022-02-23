void main() {
  var list = [2, 3, 5];
  var soma = 1;

  for (var i = 0; i < list.length; i++) {
    soma *= list[i];
  }
  print(soma);
}