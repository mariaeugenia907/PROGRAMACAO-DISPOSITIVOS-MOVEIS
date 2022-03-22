import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'game.dart';


void main() {
  runApp(MaterialApp(
    home: GameAdivinha(),
  ));
}

class GameAdivinha extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => new GameState();
 }

class GameState extends State<GameAdivinha>{
 var game = new Game();
var displayMensagem = '';
var textEditeController = TextEditeController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text( "Adivinhe o numero"),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Adivinhe o numero entre 1 e 100'
              ),
              controller: textEditeController,
              onSubmitted: (String input){
                setState((){
                  int number = int.parse(input);

                Resultado resultado = game.nextTentativa(number);
                var mensagem;
                switch (resultado) {
                  case Resultado.CORRETO:
                    mensagem = 'Correto! Você venceu!';
                    break;
                  case Resultado.MAIS_ALTO:
                    mensagem = 'adivinhe mais alto da próxima vez!';
                    break;
                  case Resultado.MAIS_BAIXO:
                    mensagem = 'Adivinhe mais baixo da próxima vez!';
                    break;
                  case Resultado.INVALIDO:
                    mensagem = 'Numero invalido! Fora do intervalo!';
                    break;
                  case Resultado.FIM_TENTATIVAS:
                    mensagem = 'Que pena, acabou suas chances!';
                    break;
                }
                displayMensagem = displayMensagem +
                    "\n" +
                number.toString() + ":" + mensagem;
                }
                );

                textEditeController.text = "";
              },
            ),
            new Text(displayMensagem),
          ],
        ),
        
      ),
    );
  }
  }

TextEditeController() {
}



