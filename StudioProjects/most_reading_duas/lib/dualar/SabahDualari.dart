import 'package:flutter/material.dart';

class SabahAksamDualari extends StatefulWidget {
  const SabahAksamDualari({Key? key}) : super(key: key);

  @override
  State<SabahAksamDualari> createState() => _SabahAksamDualariState();
}

class _SabahAksamDualariState extends State<SabahAksamDualari> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellow[100],
        appBar: AppBar(
          title: Text("Sabah Dualari"),
          centerTitle: true,
        ),

        body: Center(
          child: ListView(

            children:[
              SizedBox(height: 30,),
              Text("Sabah Dualari",style: TextStyle(fontSize: 50),),
              SizedBox(height: 30,),
              Text("[اَللّٰهُمَّ إِنِّي أَعُوذُ بِكَ مِنْ أَنْ أُشْرِكَ بِكَ شَيْـئًا وَأَنَا أَعْلَمُ، وَأَسْتَغْفِرُكَ لِمَا لَا أَعلَمُ (3)] ",style: TextStyle(fontSize: 30),),
              SizedBox(height: 30,),
              Text("[Allahım! Bilerek şirk koşmaktan Sana sığınıyor, bilemediklerimden dolayı da mağfiretini diliyorum. (3 defa)]",style: TextStyle(fontSize: 30),),
              SizedBox(height: 30,),
              Text("اَللّٰهُمَّ أَحْسِنْ عَاقِـبَـتَـنَا فِي الْأُمُورِ كُلِّهَا، وَأَجِرْنَا مِنْ خِزْيِ الدُّنْيَا وَعَذَابِ الْأٰخِرَةِ",style: TextStyle(fontSize: 30),),
              SizedBox(height: 30,),
              Text("Allahım! Her işte âkıbetimizi güzel eyle ve bizi dünyada rezil rüsvay olmaktan, ahirette de azaba uğramaktan muhafaza buyur.",style: TextStyle(fontSize: 30),),
              SizedBox(height: 30,),
              Text("رَبِّ إِنِّي أَسْأَلُكَ خَيْرَ مَا فِي هٰذَا الْيَوْمِ وَخَيْرَ مَا بَعْدَهُ، وَأَعُوذُ بِكَ مِنْ شَرِّ مَا فِي هٰذَا الْيَوْمِ وَشَرِّ مَا بَعْدَهُ ",style: TextStyle(fontSize: 30),),
              SizedBox(height: 30,),
              Text("Rabbim! Bu ve bundan sonraki günlerin hayrını Senden diler, bugünün ve daha sonraki günlerin şerrinden de Sana sığınırım.",style: TextStyle(fontSize: 30),),
              SizedBox(height: 30,),
              Text("رَبِّ أَعُوذُ بِكَ مِنَ الْكَسَلِ وَسُوءِ الْكِـبَـرِ ",style: TextStyle(fontSize: 30),),
              SizedBox(height: 30,),
              Text("Rabbim! Tembellikten ve ihtiyarlığın dertlerinden Sana sığınırım.",style: TextStyle(fontSize: 30),),
              SizedBox(height: 30,),
              Text("رَبِّ أَعُوذُ بِكَ مِنْ عَذَابٍ فِي النَّارِ، وَعَذَابٍ فِي الْقَبْرِ ",style: TextStyle(fontSize: 30),),
              SizedBox(height: 30,),
              Text("Rabbim! Cehennem’deki ve kabirdeki azaptan Sana sığınırım.",style: TextStyle(fontSize: 30),),
              SizedBox(height: 30,),
              Text("يَا حَيُّ يَا قَـيُّومُ، بِرَحْمَتِكَ أَسْتَغِيثُ، أَصْلِحْ لِي شَأْنِي كُلَّهُ، وَلَا تَـكِلْنِي إِلَى نَفْسِي طَرْفَةَ عَيْنٍ ",style: TextStyle(fontSize: 30),),
              SizedBox(height: 30,),
              Text("Ya Hayy u ya Kayyûm! Rahmetin hürmetine Senden yardım dileniyorum; her halimi ıslah buyur ve göz açıp kapayıncaya kadar olsun beni kendime ve nefsime terk etme.",style: TextStyle(fontSize: 30),),
              SizedBox(height: 30,),
              Text("[حَسْبِيَ اللهُ۬ لَۤا إِلٰهَ إِلَّا هُوَۘ عَلَيْهِ تَوَكَّلْتُ وَهُوَ رَبُّ الْعَرْشِ الْعَظِيمِ(٧)] ",style: TextStyle(fontSize: 30),),
              SizedBox(height: 30,),
              Text("[Allah bana yeter. O’ndan başka ilah yoktur. Ona tevekkül ettim. O, Arş-ı Azîm’in Rabbidir. (7 defa)]",style: TextStyle(fontSize: 30),),
              SizedBox(height: 30,),
              Text("اَللّٰهُمَّ إِنِّي أَسْأَلُكَ مِنْ فَجْأَةِ الْخَيْرِ، وَأَعُوذُ بِكَ مِنْ فَجْأَةِ الشَّرِّ ",style: TextStyle(fontSize: 30),),
              SizedBox(height: 30,),
              Text("Allahım, Senden sürpriz hayırlar diler ve beklenmedik şerlerden Sana sığınırım.",style: TextStyle(fontSize: 30),),

              SizedBox(height: 30,),
              Text("اَللّٰهُمَّ إِنِّي أَصْبَحْتُ مِنْكَ فِي نِعْمَةٍ وَعَافِـيَةٍ وَسَتْرٍ، فَأَتِمَّ نِعْمَتَكَ عَلَيَّ وَعَافِـيَـتَكَ وَسَتْرَكَ فِي الدُّنْـيَا وَالْأٰخِرَةِ ",style: TextStyle(fontSize: 30),),
              SizedBox(height: 30,),
              Text("Allahım, şu sabaha Senden gelen bir nimet ve afiyet ile ve günahlarım örtülmüş olarak çıktım. Dünyada ve ahirette üzerimdeki nimetini, afiyetini ve sıyanetini tamamlamanı diliyorum.",style: TextStyle(fontSize: 30),),
              SizedBox(height: 30,),
              Text("[اَللّٰهُمَّ إِنِّي أَعُوذُ بِكَ مِنَ الْهَمِّ وَالْحَزَنِ، وَأَعُوذُ بِكَ مِنَ الْعَجْزِ وَالْكَسَلِ، وَأَعُوذُ بِكَ مِنَ الْجُبْنِ وَالْبُخْلِ، وَأَعُوذُ بِكَ مِنْ غَلَبَةِ الدَّيْنِ وَقَهْرِ الرِّجَالِ (٣)] ",style: TextStyle(fontSize: 30),),
              SizedBox(height: 30,),
              Text("[Allahım! Her türlü gam ve hüzünden Sana sığınıyorum; acizlik ve tembellikten de Sana sığınıyorum; korkaklık ve cimrilikten de yine Sana sığınıyorum; borca mağlup olmaktan ve düşmanların kahrına uğramaktan da yine Sana sığınıyorum. (3 defa)]",style: TextStyle(fontSize: 30),),
              SizedBox(height: 30,),
              Text("أَصْبَحْنَا وَأَصْبَحَ الْمُلْكُ لِلهِ لَا شَرِيكَ لَهُ، لَا إِلٰهَ إِلَّا هُوَ وَإِلَيْهِ النُّشُورُ ",style: TextStyle(fontSize: 30),),
              SizedBox(height: 30,),
              Text("Biz de, bütün mülk de, Allah’a ait olarak sabahladık; O’nun ortağı yoktur. O’ndan başka ilah bulunmaz ve dönüş de yine O’nadır.",style: TextStyle(fontSize: 30),),
              SizedBox(height: 30,),
              Text("بِسْمِ اللهِ الرَّحْمٰنِ الرَّحِيمِ اَللّٰهُمَّ أَنْتَ السَّلَامُ، وَمِنْكَ السَّلَامُ، تَـبَارَكْتَ وَتَعَالَيْتَ يَا ذَا الْجَلَالِ وَالْإِكْرَامِ  سُبْحَانَ اللهِ وَالْحَمْدُ للهِ وَلَا إِلٰهَ إِلَّا اللهُ وَاللهُ أَكْبَرُ، وَلَا حَوْلَ وَلَا قُوَّةَ إِلَّا بِاللهِ الْعَلِيِّ الْعَظِيمِ",style:TextStyle(fontSize: 30)),


              SizedBox(height: 30,),
              Text("""Rahman ve Rahîm Allah’ın adıyla.

                Allahım! Selam Sensin, bütün kusurlardan sâlimsin ve herkes için selamet kaynağısın. Ey celâl ve ikram sahibi! Bereket Senin şiarın, ululuk da şanındır. Allah, bütün noksan sıfatlardan münezzehtir. Bütün hamd ü senalar O’nadır. O’ndan başka ilah yoktur. Gerçek güç ve kuvvet ululuk ve azamet tahtının yegâne sultanı Allah’ındır.""",style: TextStyle(fontSize: 30),),
          SizedBox(height: 30,),
              Text("اَللهُ لَۤا إِلٰهَ إِلَّا هُوَۚ اَلْحَيُّ الْقَيُّومُۚ لَا تَأْخُذُهُ سِنَةٌ وَلَا نَوْمٌۘ لَهُ مَا فِي السَّمٰوَاتِ وَمَا فِي الْأَرْضِۘ مَنْ ذَا الَّذِي يَشْفَعُ عِنْدَهُۤ إِلَّا بِإِذْنِهِۘ يَعْلَمُ مَا بَـيْنَ أَيْدِيهِمْ وَمَا خَلْفَهُمْۚ وَلَا يُحِيطُونَ بِشَيْءٍ مِنْ عِلْمِه۪ۤ إِلَّا بِمَا شَۤاءَۚ وَسِعَ كُرْسِيُّهُ السَّمٰوَاتِ وَالْأَرْضَۚ وَلَا يَؤُۧدُهُ حِفْظُهُمَاۚ وَهُوَ الْعَلِيُّ الْعَظِيمُ } [سُبْحَانَ اللهِ (٣٣)]، [اَلْحَمْدُ لِلهِ (٣٣)]، [اَللهُ أَكْـبَـرُ (٣٣)]  [لَا إِلٰهَ إِلَّا اللهُ (100)]",style: TextStyle(fontSize: 30),),

              SizedBox(height: 30,),
              Text("Allah o ilahtır ki, Kendisinden başka ilah yoktur. Hayy’dır, Kayyûm’dur. Kendisini ne bir uyuklama, ne de uyku tutar. Göklerde ve yerde ne varsa O’nundur. İzni olmadan huzurunda şefaat etmek kimin haddine? Yarattığı mahlûkların önünde, ardında ne var, hepsini bilir. Mahlûklar ise O’nun dilediğinden başka, ilminden hiçbir şey kavrayamazlar. O’nun kürsüsü gökleri ve yeri kaplamıştır. Gökleri ve yeri koruyup gözetmek O’na ağır gelmez; O öyle ulu, öyle büyüktür.",style: TextStyle(fontSize: 30),),
              SizedBox(height: 30,),
              Text("[Sübhanallah. (33 defa)] [Elhamdülillah. (33 defa)] [Allahüekber. (33 defa)] [Lâilaheillallah. (100 defa)]",style: TextStyle(fontSize: 30),),
              SizedBox(height: 30,),
              Text("أَعُوذُ بِاللهِ مِنَ الشَّيْطَانِ الرَّجِيمِ، بِسْمِ اللهِ الرَّحْمٰنِ الرَّحِيمِ، [اللّٰهُمَّ أَنْتَ رَبِّي، لَا إِلٰهَ إِلَّا أَنْتَ خَلَقْـتَـنِي، وَأَنَا عَبْدُكَ، وَأَنَا عَلَى عَهْدِكَ وَوَعْدِكَ مَا اسْتَطَعْتُ، أَعُوذُ بِكَ مِنْ شَرِّ مَا صَنَعْتُ، أَبُوءُ لَكَ بِنِعْمَتِكَ عَلَيَّ، وَأَبُوءُ لَكَ بِذَنْبِي، فَاغْفِرْ لِي، فَإِنَّهُ لَا يَغْفِرُ الذُّنُوبَ إِلَّا أَنْتَ (٣)] ",style: TextStyle(fontSize: 30),),
              SizedBox(height: 30,),
              Text("""Kovulmuş şeytanın şerrinden Allah’a sığınırım. Rahman ve Rahîm Allah’ın adıyla.

              [Allahım! Sen, benim Rabbimsin; Senden başka ilah yoktur. Beni Sen yarattın. Ben, Senin kulunum ve gücüm yettiğince Sana olan ahdime ve vaadime bağlıyım. İşlediklerimin şerrinden Sana sığınırım. Üzerimdeki nimetlerini itiraf, günahlarımı da ikrar ederim. Beni bağışla; zira günahları sadece Sen bağışlarsın. (3 defa)]""",style: TextStyle(fontSize: 30),),
              SizedBox(height: 30,),
              Text("[بِسْمِ اللهِ الَّذِي لَا يَضُرُّ مَعَ اسْمِه۪ شَيْءٌ فِي الْأَرْضِ وَلَا فِي السَّمَاءِ، وَهُوَ السَّمِيعُ الْعَلِيمُ (٣)]  أَعُوذُ بِكَلِمَاتِ اللهِ التَّامَّاتِ مِنْ شَرِّ مَا خَلَقَ وَذَرَأَ وَبَرَأَ  أَعُوذُ بِكَلِمَاتِ اللهِ التَّامَّةِ، مِنْ كُلِّ شَيْطَانٍ وَهَامَّةٍ، وَمِنْ كُلِّ عَيْنٍ لَامَّةٍ ",style: TextStyle(fontSize: 30),),
              SizedBox(height: 30,),
              Text("[Yüce ismi anılınca ne yerde ne de gökte hiçbir şeyin zarar veremeyeceği Allah’ın ismiyle ki, O Semî’ ve Alîm’dir. (3 defa)] Mahlûkâtının şerrinden Cenab-ı Allah’ın her türlü eksiklikten uzak, şifa ve deva vesilesi olan tastamam kelimelerine sığınırım. İnsî-cinnî bütün şeytanlardan, zarar verebilecek her canlıdan ve kem nazardan da Allah’ın tastamam kelimelerine sığınırım.",style: TextStyle(fontSize: 30),),
              SizedBox(height: 30,),
              Text("[أَعُوذُ بِاللهِ السَّمِيعِ الْعَلِيمِ مِنَ الشَّيْطَانِ الرَّجِيمِ (٣)] "

           "   بِسْمِ اللهِ الرَّحْمٰنِ الرَّحِيمِ {هُوَ اللهُ الَّذِي لَۤا إِلٰهَ إِلَّا هُوَۚ عَالِمُ الْغَيْبِ وَالشَّهَادَةِۚ هُوَ الرَّحْمٰنُ الرَّحِيمُ ۝ هُوَ اللهُ الَّذِي لَۤا إِلٰهَ إِلَّا هُوَۚ اَلْمَلِكُ الْقُدُّوسُ السَّلَامُ الْمُؤْمِنُ الْمُهَيْمِنُ الْعَزِيزُ الْجَبَّارُ الْمُتَـكَـبِّرُۘ سُبْحَانَ اللهِ عَمَّا يُشْرِكُونَ ۝ هُوَ اللهُ الْخَالِقُ الْبَارِئُ الْمُصَوِّرُ لَهُ الْأَسْمَۤاءُ الْحُسْنَىۘ يُسَبِّحُ لَهُ مَا فِي السَّمٰوَاتِ وَالْأَرْضِۚ وَهُوَ الْعَزِيزُ الْحَكِيمُ }",style: TextStyle(fontSize: 30),),
              SizedBox(height: 30,),
              Text("[Allah’ın rahmetinden kovulmuş şeytanın şerrinden, her şeyi işiten ve bilen Allah’a sığınıyorum. (3 defa)] Rahman ve Rahîm Allah’ın adıyla. [Allah’tır gerçek İlah! O’ndan başka yoktur ilah. Görünmeyen ve görünen her şeyi bilir. O Rahman’dır, Rahîm’dir. Allah’tır gerçek İlah! O’ndan başka yoktur ilah! O Melik’tir, Kuddûs’tür, Selâm’dır. Mü’min’dir, Müheymin’dir, Aziz’dir, Cebbar’dır, Mütekebbir’dir. Allah, müşriklerin iddialarından münezzeh ve yücedir. Allah o gerçek İlahtır ki Hâlık’tır, Bâri’dir, Musavvir’dir. Hâsılı, en güzel isimler ve vasıflar O’nundur. Göklerde ve yerde ne varsa hepsi O’nu tesbîh ve tenzîh eder. O, Azîz’dir, Hakîm’dir.]",style: TextStyle(fontSize: 30),),
              SizedBox(height: 30,),
              Text("اَلْحَمْدُ لِلهِ الَّذِي خَلَقَ النَّوْمَ وَالْيَـقَظَةَ، اَلْحَمْدُ لِلهِ الَّذِي بَـعَـثَـنِي سَالِمًا سَوِيًّا، أَشْهَدُ أَنَّ اللهَ يُحْيِي الْمَوْتَى، وَهُوَ عَلَى كُلِّ شَيْءٍ قَدِيرٌ ",style: TextStyle(fontSize: 30),),
              SizedBox(height: 30,),
              Text("Uykuyu ve uyanıklığı yaratan Cenab-ı Allah’a hamd olsun. Beni sağ-salim ve her uzvum yerli yerinde dirilten Allah’a hamd olsun. Şehadet ederim ki, Allah ölüleri de diriltir ve O, her şeye gücü yetendir.",style: TextStyle(fontSize: 30),),
              SizedBox(height: 30,),
              Text("أَصْبَحْنَا وَأَصْبَحَ الْمُلْكُ لِلهِ عَزَّ وَجَلَّ، وَالْحَمْدُ لِلهِ، وَالْكِبْرِيَاءُ وَالْعَظَمَةُ لِلهِ، وَالْخَلْقُ وَالْأَمْرُ وَاللَّيْلُ وَالنَّهَارُ وَمَا يَسْكُنُ فِيهِمَا لِلهِ وَحْدَهُ ",style: TextStyle(fontSize: 30),),
              Text("Biz de, bütün mülk de, Azîz ve Celîl olan Allah’a ait olarak sabahladık. Hamd Allah’a mahsustur; ululuk ve azamet yalnız Allah’ındır. Yaratma da, emir de, gece ve gündüz de, gece ile gündüzü mesken tutmuş her şey de yalnızca Allah’a aittir.",style: TextStyle(fontSize: 30),),
              SizedBox(height: 30,),
              Text("اَللّٰهُمَّ اجْعَلْ أَوَّلَ هٰذَا النَّهَارِ صَلَاحًا، وَأَوْسَطَهُ فَلَاحًا، وَأٰخِرَهُ نَجَاحًا، أَسْأَلُكَ خَيْرَ الدُّنْـيَا وَالْأٰخِرَةِ، يَا أَرْحَمَ الرَّاحِمِينَ ",style: TextStyle(fontSize: 30),),
              SizedBox(height: 30,),
              Text("Allahım! İçinde bulunduğumuz şu günün evvelini sulh ü salah, ortasını felah, sonunu da her bakımdan muvaffakiyetli kıl. Senden dünyanın da, ahiretin de hayrını diliyorum, ey Merhametliler Merhametlisi!",style: TextStyle(fontSize: 30),),
              SizedBox(height: 30,),

            ],
            padding: EdgeInsets.all(16.0),
          ),
        )
    );
  }
}