import 'package:flutter/material.dart';
import 'package:politica/notifica.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CheckBox(),
    );
  }
}

class CheckBox extends StatefulWidget {
  const CheckBox({Key? key}) : super(key: key);

  @override
  State<CheckBox> createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {
 bool isChecked = false;
 final allChecked = Notificacao (title: 'Aceito todos os termos');
 final notificacao = [
   Notificacao(title: 'Aceito todos os cookies'),
   Notificacao(title: 'Aceito receber notificações por email'),
   Notificacao(title: 'Aceito compartilhar dados'),
 ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Politica de Privacidade'),
      ),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            GestureDetector(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => PoliticaP())
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.link_outlined,
                    size: 25,
                    color:Colors.lightBlue
                  ),
                  Text('Termos de Aceite', style: TextStyle(
                    color: Colors.lightBlue, fontSize: 25,
                  ),
                  ),
                ]
              ),
            ),
            SizedBox(height: 20),
            ListTile(
              onTap: () => onAllClicked(allChecked),
              leading: Checkbox(
                  value: allChecked.value,
                  onChanged: (value) => onAllClicked(allChecked)
                ),
                title: Text(allChecked.title),

            ),
            Divider(),
           ...notificacao.map((item) =>
               ListTile(
                 onTap: () => onItemClicked(item),
                 leading: Checkbox(
                     value: item.value,
                     onChanged: (value) => onItemClicked(item)
                 ),
                 title: Text(item.title),

               ),
           ).toList()

          ],

        ),

      ),

    );
  }
onAllClicked(Notificacao ckbItem) {
    final newValue = !ckbItem.value;
  setState(() {
    ckbItem.value = newValue;
    notificacao.forEach((element) {
      element.value = newValue;
    });
  });
}
onItemClicked(Notificacao ckbItem) {
  final newValue = !ckbItem.value;
  setState(() {
    ckbItem.value = newValue;
    if (!newValue) {
      allChecked.value = false;
    } else {
      final allListChecked = notificacao.every((element) => element.value);
      allChecked.value = allListChecked;
    }
  });
}
}
class Notificacao {
  late String title;
  late bool value;

  Notificacao({
    required this.title,
    this.value = false,
  });
}



