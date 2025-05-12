import 'package:flutter/material.dart';

class Tefriciye extends StatefulWidget {


  @override
  State<Tefriciye> createState() => _TefriciyeState();
}

class _TefriciyeState extends State<Tefriciye> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[100],
      appBar: AppBar(
        title: Text("TEFRICIYE"),
        centerTitle: true,
      ),
      body: Center(
        child: ListView(
          children: [
            SizedBox(height: 35,),
            Container(
              child:Expanded( child: Image.asset("assets/tefriciye.jpg",height: 300,),),

            ),
            SizedBox(height: 20,),
            Container(
              child: Text( """
              Allah’ım! Efendimiz Muhammed’e kâmil bir salât ile salât ve selâm eyle! O öyle bir zâttır ki,
               kendisiyle düğümler çözülür, sıkıntılar kolaylaşır, ihtiyaçlar hallolur, arzulara kavuşulur ve güzel sonuçlara ulaşılır. Kendisinin yüzü suyu hürmetine yağmur istenir. Her göz açıp kapamada ve her nefeste 
              tarafından bilinen varlıklar sayısınca O’nun âline ve ashâbına da salât ve selâm olsun
              
              """, style: TextStyle(fontSize: 20),),
            )


          ],
        ),

      ),
    );
  }
}