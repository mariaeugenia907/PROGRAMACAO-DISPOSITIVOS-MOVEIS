import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class Game {
  static const int tentativas = 10;
  static const int max = 100;
  static const int min = 1;

  int _currentTentativas = 0;

  int _adivinhaNumber =10;

  Game(){
    _currentTentativas = 0;
    _adivinhaNumber = new Random(1).nextInt(100);
  }

  Resultado nextTentativa(int usuario_entrada){
    if (usuario_entrada < min || usuario_entrada > max) {
      return Resultado.INVALIDO;
    }
    if (_currentTentativas >= tentativas){
      return Resultado.FIM_TENTATIVAS;
    }
    if(usuario_entrada == _adivinhaNumber){
      return Resultado.CORRETO;
    }else{
      if (usuario_entrada > _adivinhaNumber){
        return Resultado.MAIS_BAIXO;
      }else{
        return Resultado.MAIS_ALTO;
      }
    }
  }
}

enum Resultado{CORRETO, MAIS_ALTO, MAIS_BAIXO, INVALIDO, FIM_TENTATIVAS}
