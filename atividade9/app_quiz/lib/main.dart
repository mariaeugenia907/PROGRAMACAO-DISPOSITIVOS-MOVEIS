import 'package:app_quiz/perguntas.dart';
import 'package:flutter/material.dart';
import 'ajuda.dart';

Ajuda ajuda = Ajuda();

void main() => runApp(Quizz());

class Quizz extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: QuizPage(),
        ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> marcadorPontos = [

  ];
void conferirRespostas(String respostaUsuario){
  String respostaCerta = ajuda.obterResposta();

  setState(() {
  if(respostaUsuario == respostaCerta){
    marcadorPontos.add(Icon(Icons.check,
        color: Colors.green));
    print('Resposta certa');
  } else {
    marcadorPontos.add(Icon(Icons.close,
        color: Colors.red));
    print('Resposta errada');
  }


    ajuda.proximaPergunta();
  });
}

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                ajuda.obterQuestao(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: ElevatedButton(
              child: Text(
                'Verdadeiro',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
conferirRespostas('verdadeiro');
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: ElevatedButton(
              child: Text(
                'Talvez',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                conferirRespostas('talvez');
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: ElevatedButton(
             child: Text(
                'Falso',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                conferirRespostas('falso');
              },
            ),
          ),
        ),
        Row(
          children: marcadorPontos,
        )
      ],
    );
  }
}

