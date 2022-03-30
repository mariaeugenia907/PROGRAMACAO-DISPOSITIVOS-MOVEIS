import 'package:app_quiz/perguntas.dart';

class Ajuda{
  int _numDaQuestaoAtual = 0;

  List<Perguntas> _bancoPerguntas = [
    Perguntas('A radiação solar causa câncer de pele', 'verdadeiro'),
    Perguntas('Um profissional da radiologia pode morrer de câncer', 'talvez'),
    Perguntas('Os profissionais da radiologia não estão expostos a radiação', 'falso'),
    Perguntas('O microondas emite um tipo de radiação não ionizante, como a TV', 'verdadeiro'),
    Perguntas('Os raios X não são prejudiciais para a saúde, podendo ser usado indiscriminadamente', 'falso'),
    Perguntas('A ressonancia magnetica pode ser usada em mulheres grávidas', 'talvez'),
    Perguntas('A radiação cósmica é um tipo de radiação natural', 'verdadeiro'),
    Perguntas('Os raios gama são considerados uma radiação artificial', 'falso'),
    Perguntas('Os meios de contraste não auxiliam no diagnóstico por imagem', 'falso'),
    Perguntas('O diagnóstico precoce aumenta o sucesso do tratamento de câncer', 'verdadeiro'),
    Perguntas(' ', ' '),
  ];

  void proximaPergunta(){
    if (_numDaQuestaoAtual < _bancoPerguntas.length - 1){
      _numDaQuestaoAtual++;
    }
    print(_numDaQuestaoAtual);
    print(_bancoPerguntas);
  }

void reset() {
    _numDaQuestaoAtual = 0;

}
bool fim() {
    if(_numDaQuestaoAtual == _bancoPerguntas.length - 1 ) {
      return true;
    } else {
      return false;
    }
}
  String obterQuestao(){
    return _bancoPerguntas[_numDaQuestaoAtual].questao.toString();

  }
  String obterResposta(){
    return _bancoPerguntas[_numDaQuestaoAtual].respostaDaQuestao.toString();
  }
  int pontuacao() {
    return _bancoPerguntas.length;
  }

}

