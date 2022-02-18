void main() {
  double salarioa1 = 1000, aumento1 = 0.7, aumento2 = 0.6, aumento3 = 0.5;
  double salarioa, salario1, salario2, salario3;

  salarioa = salarioa1;
  print('Salario atual: ' + (salarioa.toString()));

  salario1 = salarioa + (salarioa * aumento1);
  print('Salario com primeiro reajuste anual: ' + (salario1.toString()));

  salario2 = salario1 + (salario1 * aumento2);
  print('Salario com segundo reajuste anual: ' + (salario2.toString()));

  salario3 = salario2 + (salario2 * aumento3);
  print('Salario com terceiro reajuste anual: ' + (salario3.toString()));
}
