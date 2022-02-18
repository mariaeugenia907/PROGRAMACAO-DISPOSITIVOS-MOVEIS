import 'dart:io';

void main() {
  double nota1, nota2, nota3, notafinal;
  stdout.write('Nota1: ');
  nota1 = double.parse(stdin.readLineSync().toString());

  stdout.write('Nota2: ');
  nota2 = double.parse(stdin.readLineSync().toString());

  stdout.write('Nota3: ');
  nota3 = double.parse(stdin.readLineSync().toString());

  notafinal = (nota1 + nota2 + nota3) / 3;
  print('Nota final: ' + notafinal.toString());

  if (notafinal < 4) {
    print('Reprovado');
  } else if (notafinal >= 4 && notafinal <= 6.9) {
    print('Exame final');
  } else {
    print('Aprovado');
  }
}
