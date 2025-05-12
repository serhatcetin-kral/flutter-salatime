import 'package:flutter/material.dart';


class Huvallahullezi extends StatefulWidget {


  @override
  State<Huvallahullezi> createState() => _HuvallahulleziState();
}

class _HuvallahulleziState extends State<Huvallahullezi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[100],
      appBar: AppBar(
        title: Text("Huvallahullezi"),
        centerTitle: true,
      ),
      body: Center(
        child: ListView(

          children: [
            SizedBox(height: 20,),
        Container(
          child: Text( "هُوَ ٱللَّهُ ٱلَّذِى لَآ إِلَٰهَ إِلَّا هُوَ ۖ عَٰلِمُ ٱلْغَيْبِ وَٱلشَّهَٰدَةِ ۖ هُوَ ٱلرَّحْمَٰنُ ٱلرَّحِيمُ"

          "هُوَ ٱللَّهُ ٱلَّذِى لَآ إِلَٰهَ إِلَّا هُوَ ٱلْمَلِكُ ٱلْقُدُّوسُ ٱلسَّلَٰمُ ٱلْمُؤْمِنُ ٱلْمُهَيْمِنُ ٱلْعَزِيزُ ٱلْجَبَّارُ ٱلْمُتَكَبِّرُ ۚ سُبْحَٰنَ ٱللَّهِ عَمَّا يُشْرِكُونَ"

              " هُوَ ٱللَّهُ ٱلْخَٰلِقُ ٱلْبَارِئُ ٱلْمُصَوِّرُ ۖ لَهُ ٱلْأَسْمَآءُ ٱلْحُسْنَىٰ ۚ يُسَبِّحُ لَهُۥ مَا فِى ٱلسَّمَٰوَٰتِ وَٱلْأَرْضِ ۖ وَهُوَ ٱلْعَزِيزُ ٱلْحَكِيمُ",style: TextStyle(fontSize: 40),),
        ),

            SizedBox(height: 40,),
            Container(
              child: Text( "O, kendisinden başka hiçbir ilâh olmayan Allah’tır. Gaybı da, görünen âlemi de bilendir. O, Rahmân’dır, Rahîm’dir."

                 " O, kendisinden başka hiçbir ilâh bulunmayan Allah’tır. O, mülkün gerçek sahibi, kutsal (her türlü eksiklikten uzak), barış ve esenliğin kaynağı, güvenlik veren, gözetip koruyan, mutlak güç sahibi, düzeltip ıslah eden ve dilediğini yaptıran ve büyüklükte eşsiz olan Allah’tır. Allah, onların ortak koştuklarından uzaktır."

                 " O, yaratan, yoktan var eden, şekil veren Allah’tır. Güzel isimler O’nundur. Göklerdeki ve yerdeki her şey O’nu tesbih eder. O, mutlak güç sahibidir, hüküm ve hikmet sahibidir.",style: TextStyle(fontSize: 30,),),
            ),


          ],

        ),
      ),

    );
  }
}