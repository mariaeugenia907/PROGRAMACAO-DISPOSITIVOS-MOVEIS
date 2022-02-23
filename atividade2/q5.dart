void main() {
  ContaCorrente conta = ContaCorrente(); // incializando a conta
  ContaCorrente conta2 = ContaCorrente();
  //atribuir valores na variavel conta
  conta.proprietario = 'Maria';
  conta.ag = 777;
  conta.cc = 987456;

  // imprimir os valores
  print("Proprietario: ${conta.proprietario}");
  print("Agencia: ${conta.ag}");
  print("Conta: ${conta.cc}");
  // adicionando valor no saldo
  conta._saldo += 100.0;
  print("Saldo: ${conta._saldo}");

  // saque de valores
  print('Saldo da ${conta.proprietario} :  ${conta.saldo}');
  conta.saque(80.0);
  print('Saldo da ${conta.proprietario} :  ${conta.saldo}');
  conta.saque(50.0);
  print('Saldo da ${conta.proprietario} :  ${conta.saldo}');
  conta.deposito(200.0);
  print('Saldo da ${conta.proprietario} :  ${conta.saldo}');

  bool transf = conta.transferencia(80.0, conta);
  print(transf);
  print('Saldo da ${conta.proprietario} :  ${conta.saldo}');

  Cliente client = Cliente();
  client.nome = 'Amanda';
  client.cpf = '018.963.587-24';
  conta2.proprietario = client.toString();

  //conta2.definirSaldo(800.0);
  //print('Saldo da ${client.nome}: ${conta2.obterSaldo()}');
  conta2.saldo = 800;
  print('Saldo da ${client.nome}: ${conta2.saldo}');
}

// gerar clientes
class Cliente {
  late String nome;
  late String cpf;
}

//gerar objetos
class ContaCorrente {
  late String proprietario;
  late int ag;
  late int cc;
  late double _saldo = 0.0; // inicializar variavel padrao
  // o saldo se tornou privado para melhorar as movimentaçoes, e isso faz com que ele seja usado so dentro da ContaCorrente
// traz uma necessidade de outro metodo para o _saldo ser acessado em outras classes

  double get saldo {
    return _saldo;
  }

  set saldo(double novoSaldo) {
    if (novoSaldo > 0.0) {
      _saldo = novoSaldo;
    } else {
      print('ERRO');
    }
  }
  //agora podemos ate tirar o _ de saldo dos outros locais

// os metodos get e set podem ser usados para evitar esse definirSaldo e obtersaldo de uma variavel privada
//Vamos buscar fazer isso agora
  // void definirSaldo(double novoSaldo) {
  // if (novoSaldo > 0.0) {
  //  this._saldo = novoSaldo;
  // } else {
  //  print('erro');
  // }
  // }

  // double obterSaldo() {
  //   return this._saldo;
  //}

  // metodo saque
  //colocar retorno na operaçao
  bool saque(double saque) {
    if (verificaSaldo(saque)) {
      print('Saldo insuficiente');
      return false;
    } else {
      print('Sacando $saque reais...');
      this.saldo -= saque;
      return true;
    }
  }

  // metodo deposito
  //colocar retorno na operaçao
  double deposito(double deposito) {
    this.saldo += deposito;
    return this.saldo;
  }

  // metodo transferencia
  bool transferencia(double transferencia, ContaCorrente contaDestino) {
    if (verificaSaldo(transferencia)) {
      print('Saldo insuficiente');
      return false;
    } else {
      this._saldo -= transferencia;
      contaDestino.deposito(transferencia);
      return true;
    }
  }

  // metodo verificar saldo
  bool verificaSaldo(double valor) {
    if (this._saldo - valor < 0.0) {
      print('Saldo insuficiente');
      return false;
    } else {
      print('Movimentando $valor reais...');
      return true;
    }
  }
}
