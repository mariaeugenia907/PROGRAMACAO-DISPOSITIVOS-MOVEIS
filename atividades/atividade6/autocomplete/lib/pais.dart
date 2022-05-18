import 'package:flutter/material.dart';

class PaisEscolhido extends StatelessWidget {
  const PaisEscolhido({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PaisSelecionado();
  }
}
class PaisSelecionado extends StatefulWidget {
  const PaisSelecionado({Key? key}) : super(key: key);

  @override
  State<PaisSelecionado> createState() => _PaisSelecionadoState();
}

class _PaisSelecionadoState extends State<PaisSelecionado> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Interação do usuario'),
      ),
     body: Container(
        child: Center(
            child: Text('Obrigado por selecionar um país!',
            style: TextStyle(fontSize: 20, color: Colors.indigo),
            ),
        ),
      ),
    );
  }
}



