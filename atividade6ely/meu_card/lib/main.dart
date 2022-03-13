import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return MaterialApp(
     home: Scaffold(
       backgroundColor: Colors.indigo,
       body: SafeArea(child: Column(
         children: <Widget>[
           CircleAvatar(
             radius: 50.0,
             backgroundImage: AssetImage('assets/Foto.png'),
           ),
           Text(
             'Maria Eugênia',
             style: TextStyle(
               fontSize: 40.0,
                 letterSpacing: 1.0,
               color: Colors.white,
               fontWeight: FontWeight.bold,
               fontFamily: 'Pacifico'
             ),
           ),
           Text(
             'Estudante',
                 style: TextStyle(
                   fontSize: 30.0,
                   letterSpacing: 1.5,
                   color: Colors.white,
                   fontWeight: FontWeight.normal,
                   fontFamily: 'SourceSansPro',
                 ),
           ),
           SizedBox(
             height: 30.0 ,
             width: 150.0,
             child: Divider(
               color: Colors.lightBlue,
             ),
           ),
           Container(
             color: Colors.lightBlueAccent,
             margin: EdgeInsets.symmetric(
               vertical: 10.0,
               horizontal: 25.0,
               ),
             padding: EdgeInsets.all(10.0),
             child: Row(
               children: <Widget>[
                 Icon(
                   Icons.phone_android,
                   size: 25.0,
                   color: Colors.white,
                 ),
                 SizedBox(
                   width: 15.0,
                 ),
                 Text(
                   '+55 2586 8475',
                   style: TextStyle(
                     color: Colors.white,
                     fontSize: 20.0,
                     fontFamily: 'SourceSansPro',
                   ),
                 )
               ],
             ),
           ),
           Container(
             color: Colors.lightBlueAccent,
             margin: EdgeInsets.symmetric(
               vertical: 10.0,
               horizontal: 25.0,
             ),
             padding: EdgeInsets.all(10.0),
             child: Row(
               children: <Widget>[
                 Icon(
                   Icons.alternate_email,
                   size: 25.0,
                   color: Colors.white,
                 ),
                 SizedBox(
                   width: 15.0,
                 ),
                 Text(
                   'mariaeugenia@gmail.com',
                   style: TextStyle(
                     color: Colors.white,
                     fontSize: 20.0,
                     fontFamily: 'SourceSansPro',
                   ),
                 )
               ],
             ),
           )
         ],

       )),
     )
   );
  }
  
}

