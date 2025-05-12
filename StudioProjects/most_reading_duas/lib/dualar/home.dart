import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("DUALAR"),
        centerTitle: true,
      ),
      body: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/kuran.jpg"), fit: BoxFit.cover),
        ),
        child: Center(
          child:Column(
            children: [

              SizedBox(height: 20,),
              TextButton( onPressed: (){
                Navigator.pushNamed(context, "/ayetelkursi");
              },
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue.shade500,
                    side: const BorderSide(color: Colors.white,width: 1.5),
                  ), child:Text("Ayetel kursi"),
                   // borderRadius: BorderRadius.circular(50)),
              //

              ),
              SizedBox(height: 20,),
              TextButton( onPressed: (){
                Navigator.pushNamed(context, "/yasin");
              },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue.shade500,
                  side: const BorderSide(color: Colors.white,width: 1.5),
                ), child:Text("Yasin"),
                // borderRadius: BorderRadius.circular(50)),
                //

              ),
              SizedBox(height: 20,),
              TextButton( onPressed: (){
                Navigator.pushNamed(context, "/fetih");
              },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue.shade500,
                  side: const BorderSide(color: Colors.white,width: 1.5),
                ), child:Text("Fetih"),
                // borderRadius: BorderRadius.circular(50)),
                //

              ),
              SizedBox(height: 20,),
              TextButton( onPressed: (){
                Navigator.pushNamed(context, "/nazar");
              },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue.shade500,
                  side: const BorderSide(color: Colors.white,width: 1.5),
                ), child:Text("Nazar duasi"),
                // borderRadius: BorderRadius.circular(50)),
                //

              ),
              SizedBox(height: 20,),
              TextButton( onPressed: (){
                Navigator.pushNamed(context, "/tefriciye");
              },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue.shade500,
                  side: const BorderSide(color: Colors.white,width: 1.5),
                ), child:Text("Tefriciye"),
                // borderRadius: BorderRadius.circular(50)),
                //

              ),
              SizedBox(height: 20,),
              TextButton( onPressed: (){
                Navigator.pushNamed(context, "/amenerresulu");
              },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue.shade500,
                  side: const BorderSide(color: Colors.white,width: 1.5),
                ), child:Text("Amenerresulu"),
                // borderRadius: BorderRadius.circular(50)),
                //

              ),
              SizedBox(height: 20,),
              TextButton( onPressed: (){
                Navigator.pushNamed(context, "/huvallahullezi");
              },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue.shade500,
                  side: const BorderSide(color: Colors.white,width: 1.5),

                ), child:Text("Huvallahullezi"),
                // borderRadius: BorderRadius.circular(50)),
                //

              ),
              SizedBox(height: 20,),
              TextButton( onPressed: (){
                Navigator.pushNamed(context, "/HacetDuasi");
              },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue.shade500,
                  side: const BorderSide(color: Colors.white,width: 1.5),

                ), child:Text("Hacet Duasi"),
                // borderRadius: BorderRadius.circular(50)),
                //

              ),
              SizedBox(height: 20,),
              TextButton( onPressed: (){
                Navigator.pushNamed(context, "/SabahAksamDualari");
              },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue.shade500,
                  side: const BorderSide(color: Colors.white,width: 1.5),

                ), child:Text("Sabah Dualari"),
                // borderRadius: BorderRadius.circular(50)),
                //

              ),
              SizedBox(height: 20,),
              TextButton( onPressed: (){
                Navigator.pushNamed(context, "/AksamDualari");
              },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue.shade500,
                  side: const BorderSide(color: Colors.white,width: 1.5),

                ), child:Text("Aksam Dualari"),
                // borderRadius: BorderRadius.circular(50)),
                //

              ),
             // SizedBox(height: 20,),
            ],
          ) ,
        ),
      ),
    );
  }
}