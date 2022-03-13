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
       backgroundColor: Colors.lightBlue,
       body: SafeArea(child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: <Widget>[
           CircleAvatar(
             radius: 70.0,
             backgroundImage: AssetImage('assets/Foto.png'),
           ),
           Text(
             'Maria Eugênia',
             style: TextStyle(
               fontSize: 30.0,
                 letterSpacing: 1.0,
               color: Colors.white,
               fontWeight: FontWeight.bold,
               fontFamily: 'Pacifico'
             ),
           ),
           Text(
             'Estudante de ADS',
                 style: TextStyle(
                   fontSize: 20.0,
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
               color: Colors.black,
             ),
           ),
           Card(
             color: Colors.black12,
             margin: EdgeInsets.symmetric(
               vertical: 10.0,
               horizontal: 20.0,
               ),
             child: Padding(
               padding: EdgeInsets.all(10.0),
               child: ListTile(
                 trailing: Icon(
                    Icons.phone,
                   color: Colors.green,
                 ),
                 leading: Icon(
                     Icons.phone_android,
                     size: 25.0,
                     color: Colors.white,
                   ),
                   title: Text(
                     '+55 2586 8475',
                     style: TextStyle(
                       color: Colors.white,
                       fontSize: 20.0,
                       fontFamily: 'SourceSansPro',
                     ),
                   )
               ),
             ),
           ),
           Card(
             color: Colors.black12,
             margin: EdgeInsets.symmetric(
               vertical: 10.0,
               horizontal: 20.0,
             ),

             child: Padding(
               padding: EdgeInsets.all(10.0),
               child: ListTile(
                   leading: Icon(
                     Icons.email_outlined,
                     size: 30.0,
                     color: Colors.white,
                   ),
                   title: Text(
                     'mariaeugenia@gmail.com',
                     style: TextStyle(
                       color: Colors.white,
                       fontSize: 20.0,
                       fontFamily: 'SourceSansPro',
                     ),
                   )
               ),
             ),
           ),
           Card(
             color: Colors.black12,
             margin: EdgeInsets.symmetric(
               vertical: 10.0,
               horizontal: 20.0,
             ),

             child: Padding(
               padding: EdgeInsets.all(10.0),
               child: ListTile(
                   leading: Icon(
                     Icons.link_outlined,
                     size: 30.0,
                     color: Colors.white,
                   ),
                   title: Text(
                     'http://lattes.cnpq.br/3565825',
                     style: TextStyle(
                       color: Colors.white,
                       fontSize: 20.0,
                       fontFamily: 'SourceSansPro',
                     ),
                   )
               ),
             ),
           ),
           new Image.network(
             'https://cdn.dribbble.com/users/364116/screenshots/1899338/media/eec1961f07ec63787115fc1226c63fad.gif',
           width: 200,
           height: 180,
           )
         ],
       )),
     )
   );
  }
  
}

