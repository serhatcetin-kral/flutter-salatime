import 'package:flutter/material.dart';

class Nazar extends StatefulWidget {
  const Nazar({Key? key}) : super(key: key);

  @override
  State<Nazar> createState() => _NazarState();
}

class _NazarState extends State<Nazar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellow[100],
        appBar: AppBar(
          title: Text("NAZAR"),
          centerTitle: true,
        ),

        body: Column(

            children:[
              SizedBox(height: 30,),
              Image.asset("assets/nazarduasi.jpg",height: 250,),
              Text(""" Şüphesiz inkâr edenler Zikr’i (Kur’an’ı) duydukları zaman neredeyse seni gözleriyle devirecekler. (Senin için,)
         “Hiç şüphe yok o bir delidir” diyorlar. Hâlbuki o (Kur’an), âlemler için ancak bir öğüttür. """,style: TextStyle(fontSize: 30),)]

        )
    );
  }
}