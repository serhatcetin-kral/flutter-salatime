import 'package:flutter/material.dart';


class Ayetelkursi extends StatefulWidget {


  @override
  State<Ayetelkursi> createState() => _AyetelkursiState();
}

class _AyetelkursiState extends State<Ayetelkursi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[100],
      appBar: AppBar(
        title: Text("Ayetel kursi"),
        centerTitle: true,
      ),
      body: Center(
        child: ListView(

          children: [
            SizedBox(height: 20,),
            Container(
              height: 500,
              child: Expanded(
                child: Image.asset(
                  'assets/ayetel-kursi.jpg',
                  width: 600.0,
                  height: 240.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 40,),
            Container(
              child: Text( """ Allah'tan başka hiçbir İlah yoktur. O, daima yaşayan, daima duran,

bütün varlıkları ayakta tutandır. O'nu ne gaflet basar, ne de uyku.

Göklerdeki ve yerdeki herşey O'nundur. O'nun izni olmadan huzurunda şefaat etmek kimin haddine! Onların önlerinde ve arkalarında ne varsa hepsini bilir.

Onlar ise, O'nun dilediği kadarından başka ilminden hiçbir şey kavrayamazlar.

O'nun hükümdarlığı, bütün gökleri ve yeri kucaklamıştır. Her ikisini görüp gözetmek,

ona bir ağırlık da vermez. O, çok yüce, çok büyüktür.""",style: TextStyle(fontSize: 20),),
            ),


          ],

        ),
      ),

    );
  }
}