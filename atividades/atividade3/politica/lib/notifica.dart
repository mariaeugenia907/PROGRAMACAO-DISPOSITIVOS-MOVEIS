import 'package:flutter/material.dart';

class Privacidade extends StatelessWidget {
  const Privacidade({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PoliticaP();
  }
}

class PoliticaP extends StatefulWidget {
  const PoliticaP({Key? key}) : super(key: key);

  @override
  State<PoliticaP> createState() => _PoliticaPState();
}

class _PoliticaPState extends State<PoliticaP> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Politica de Privacidade'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Container(
          color: Colors.blue[100],
              padding: EdgeInsets.all(8),
          child: Text(' Company name criou o aplicativo como supported/commercial. Este SERVIÇO é fornecido pela empresaSA sem custo e destina-se ao uso como está.\nEsta página é usada para informar os visitantes sobre nossas políticas com a coleta, uso e divulgação de Informações Pessoais se alguém decidir usar nosso Serviço.\nSe você optar por usar o Serviço nosso, concorda com a coleta e uso de informações em relação a esta política.\nAs Informações Pessoais que Nós coletamos são usadas para fornecer e melhorar o Serviço.\nNós não usaremos ou compartilharemos suas informações com ninguém, exceto conforme descrito nesta Política de Privacidade.\nOs termos usados nesta Política de Privacidade têm os mesmos significados que em nossos Termos e Condições, que podem ser acessados em salvo definição em contrário nesta Política de Privacidade.\n\n\nSe você tiver dúvidas ou sugestões sobre a nossa Política de Privacidade, não hesite em entrar em contato.\nEsta página de política de privacidade foi criada em privacypolicytemplate.net e modificada/gerada pelo App Privacy Policy Generator',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize:14,
          )

          ),
        ),
      ),
    );
  }
}

