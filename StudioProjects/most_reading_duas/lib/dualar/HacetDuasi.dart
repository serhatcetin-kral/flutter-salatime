import 'package:flutter/material.dart';

class HacetDuasi extends StatefulWidget {
  const HacetDuasi({Key? key}) : super(key: key);

  @override
  State<HacetDuasi> createState() => _HacetDuasiState();
}

class _HacetDuasiState extends State<HacetDuasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellow[100],
        appBar: AppBar(
          title: Text("Hacet Duasi"),
          centerTitle: true,
        ),

        body: Center(
          child: ListView(

              children:[
                SizedBox(height: 30,),



                Text("""لَا إِلٰهَ إِلَّا اللّٰهُ الْحَلٖيمُ الْكَرٖيمُ سُبْحَانَ اللّٰهِ رَبِّ الْعَرْشِ الْعَظٖيمِ اَلْحَمْدُ لِلّٰهِ رَبِّ الْعَالَمٖينَ أَسْأَلُكَ مُوجِبَاتِ رَحْمَتِكَ وَعَزَائِمَ مَغْفِرَتِكَ وَالْغَنٖيمَةَ مِنْ كُلِّ بِرٍّ وَالسَّلَامَةَ مِنْ كُلِّ إِثْمٍ لَا تَدَعْ لٖي ذَنْبًا إِلَّا غَفَرْتَهُ وَلَا هَمًّا إِلَّا فَرَّجْتَهُ وَلَا حَاجَةً هِيَ لَكَ رِضاً إِلَّا قَضَيْتَهَا يَا أَرْحَمَ الرَّاحِمٖينَ


""",style: TextStyle(fontSize: 30),),
                SizedBox(height: 30,),
                Text("""
                Halîm ü Kerîm Allah'tan başka ilah yoktur. Arş-ı Azîm'in Rabbi Allah'ı tesbih ederim. Hamd alemlerin
Rabbi Allah'a mahsustur. Rabbim, Senden, rahmetinin gereklerini, merhametini celbedecek şeyleri,
gerçekleşmesi muhakkak olan mağfiretini, günahtan korunmayı, her türlü iyiliği kazanmayı, her türlü
günahtan da selâmette olmayı istiyorum. Bende bağışlamadığın hiçbir günah, gidermediğin hiçbir keder,
Senin rızana muvafık olup da karşılamadığın hiçbir ihtiyaç bırakma Ya Erhamerrahimin.
Allah’ım, Sen kullarının ihtilaf ettikleri şeylerde hüküm verirsin. Yüce ve Azim Allah'tan başka ilah
yoktur. Halîm ve Kerîm Allah yegâne ilahtır. Yedi semanın ve Arş-ı Azîm'in Rabbi Allah'ı tesbih ederim.
Hamd alemlerin Rabbi Allah'a mahsustur.
Ey kederleri gideren, tasaları kaldıran, Sana dua ettiklerinde çaresizlerin duasına icabet eden Allahım, ey
dünya ve ahiretin Rahman ve Rahîm’i! Şu ihtiyacımın giderilmesi ve tamamlanması hususunda beni
başkalarının merhametinden müstağni kılacak bir şekilde bana merhamet et.
                """,style: TextStyle(fontSize: 30),),
                SizedBox(height: 30,),

                Text("""
                Allah’ım Sen'den diliyor ve dileniyorum, Rahmet Peygamberi Hazreti Muhammed'i vesile edinerek Sana
teveccüh ediyorum. Ya Muhammed (aleyhissalâtu vesselâm) şu hacetimin yerine getirilmesi için seni
vesile yaparak Rabbime yöneliyorum. Allah’ım peygamberimizi hakkımda şefaatçi eyle.
                """,style: TextStyle(fontSize: 30),)
                ,SizedBox(height: 30,),
                Text("""
                لَا إِلٰهَ إِلَّا اللّٰهُ وَحْدَهُ لَا شَرٖيكَ لَهُ الْعَلِيُّ الْعَظٖيمُ لَا إِلٰهَ إِلَّا اللّٰهُ وَحْدَهُ لَا شَرٖيكَ لَهُ الْحَكٖيمُ الْكَرٖيمُ



                """,style: TextStyle(fontSize: 30),),
                SizedBox(height: 30,),
                Text("""
                
Allah’tan başka ilâh yoktur, sadece O vardır. O’nun ortağı yoktur. O, yücedir, uludur. Allah’tan başka ilâh yoktur, sadece O vardır. O’nun ortağı yoktur. 
O, her işi hikmetli olan, çok ikram edendir. (İbn Ebî Şeybe, Dua, 26, No: 29319)
                """,style: TextStyle(fontSize: 30),)


              ],
              padding: EdgeInsets.all(16.0),
        ),
        )
    );
  }
}