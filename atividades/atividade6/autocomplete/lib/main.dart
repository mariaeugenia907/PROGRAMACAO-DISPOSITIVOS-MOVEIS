import 'package:autocomplete/pais.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyAutocomplete());
}

class MyAutocomplete extends StatelessWidget {
  const MyAutocomplete({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AutoComplete',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<String> data = [
    "Alemanha",
    "Brasil",
    "China",
    "Dinamarca",
    "Estados Unidos da América",
    "França",
    "Grécia",
    "Holanda",
    "Inglaterra",
    "Japão",
    "Líbano",
    "México",
    "Nova Zelândia",
    "Portugal",
    "Reino Unido",
    "Suíça",
    "Tailândia",
    "Uruguai"
  ];

  Future searchData(String param) async {
    List<String> result =
    data.where((element) => element.toLowerCase().contains(param.toLowerCase()))
        .toList();
    return result;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Auto Complete'),
      ),
      body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                children: [
                  TypeAheadField<String>(
                    textFieldConfiguration: TextFieldConfiguration(
                        autofocus: true,
                        decoration: InputDecoration(
                            border: OutlineInputBorder()
                        )
                    ),
                    suggestionsCallback: (pattern) async {
                      return await searchData(pattern);
                    },
                    itemBuilder: (context, suggestion) {
                      return ListTile(
                        leading: Icon(Icons.airplanemode_active),
                        title: Text(suggestion),
                      );
                    },
                    onSuggestionSelected: (suggestion) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text('País ${suggestion} selecionado!')
                        ),
                      );
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => PaisEscolhido()
                      ));
                      print(suggestion);
                    },
                  )
                ]
            ),
          )
      ),
    );
  }
}