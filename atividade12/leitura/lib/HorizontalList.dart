import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  const HorizontalList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Encontra(),
        ],
      ),
    );
  }
}
class Encontra extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
     height: 200,
     child: Row(
       children: [
         Container(
           decoration: BoxDecoration(
             color: Colors.teal,
           ),
           child: Image.asset('images/05.jpg', width: 150,),
         ),
         SizedBox(height: 5,),
         Container(
           decoration: BoxDecoration(
             color: Colors.teal,
           ),
           child: Image.asset('images/06.jpg', width: 150,),
         ),
         SizedBox(height: 5,),
         Container(
           decoration: BoxDecoration(
             color: Colors.teal,
           ),
           child: Image.asset('images/07.jpg', width: 150,),
         ),
         SizedBox(height: 5,),
         Container(
           decoration: BoxDecoration(
             color: Colors.teal,
           ),
           child: Image.asset('images/08.jpg', width: 150,),
         ),
         SizedBox(height: 5,),
         Container(
           decoration: BoxDecoration(
             color: Colors.teal,
           ),
           child: Image.asset('images/09.jpg', width: 150,),
         ),
       ],
       
     ),
    );
  }
  
}
