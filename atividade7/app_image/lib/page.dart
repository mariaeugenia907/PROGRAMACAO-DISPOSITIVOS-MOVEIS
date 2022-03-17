import 'package:flutter/material.dart';

class App_image extends StatelessWidget {
  const App_image({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: Text('Imagens')
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('images/imagem1.jpg'),
                Container(
                  child: Column(
                    children: [
                      Icon(Icons.favorite),
                      Text('Like'),
                    ],
                  ),
                ),
                _builderbuton()
              ],
            )
        )
    );
  }

  Widget _builderbuton() {
    return Padding(padding: EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {},
              child: Icon(Icons.arrow_back)
          ),

          ElevatedButton(
              onPressed: () {},
              child: Icon(Icons.arrow_forward)
          ),

        ],
      ),
    );
  }
}