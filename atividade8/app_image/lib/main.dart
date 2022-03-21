import 'dart:math';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          title: Text('Imagens'),
          backgroundColor: Colors.blueAccent,
        ),
        body: Page(),
      )
  )
  );
}

class Page extends StatefulWidget {
  const Page({Key? key}) : super(key: key);

  @override
  _PageState createState() => _PageState();
}


class _PageState extends State<Page> {
  int image = 1;

  static const likedKey = 'liked_key';
  late bool click = false;


  void Face() {
    setState(() {
      image = Random().nextInt(5) + 1;
    }
    );
  }

  void Favorite() {
    super.initState();
    _restorePreference();

  }

  void  _restorePreference() async {
    var preferences = await SharedPreferences.getInstance();
    var click = preferences.getBool(likedKey);
    setState(() => this.click = click!);
  }

  void _preference() async {
    setState(() => click = !click);
    var preferences = await SharedPreferences.getInstance();
     preferences.setBool(likedKey, click);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: Icon(Icons.arrow_back),
                  onPressed: () {
                    Face();
                  },
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      Face();
                    },
                    child:
                    Image.asset('images/imagem$image.jpg'),

                  ),
                ),
                Column(
                    children: [
                      Container(
                        child: IconButton(
                          icon: (click
                              ? const Icon(Icons.favorite)
                              : const Icon(Icons.favorite_border)),
                          color: Colors.red,
                          onPressed: () {
                            _preference();
                            print('Like');
                          },

                        ),
                      ),

                    ]
                ),
                ElevatedButton(
                  child: Icon(Icons.arrow_forward),
                  onPressed: () {
                    Face();
                  },
                ),

              ],
            )
        )
    );
  }
}





