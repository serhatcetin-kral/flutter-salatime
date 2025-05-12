import 'package:flutter/material.dart';

class AksamDualari extends StatefulWidget {
  const AksamDualari({Key? key}) : super(key: key);

  @override
  State<AksamDualari> createState() => _AksamDualariState();
}

class _AksamDualariState extends State<AksamDualari> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellow[100],
        appBar: AppBar(
          title: Text("Aksam Dualari"),
          centerTitle: true,
        ),

        body: Center(
          child: ListView(

            children:[
              SizedBox(height: 30,),
              Text("Aksam Dualari",style: TextStyle(fontSize: 50),),
              SizedBox(height: 30,),
              Text("اَللّٰهُمَّ إِنِّي أَسْأَلُكَ صِحَّةً فِي إِيمَانٍ، وَإِيمَانًا فِي حُسْنِ خُلُقٍ، وَنَجَاحًا يَـتْـبَعُهُ فَلَاحٌ، وَرَحْمَةً مِنْكَ وَعَافِـيَـةً، وَمَغْفِرَةً مِنْكَ وَرِضْوَانًا "

              ,style: TextStyle(fontSize: 30),),
              SizedBox(height: 30,),
              Text("Allahım! Senden imanda sıhhat, güzel ahlakla bezenmiş bir iman, peşinden felah gelecek bir muvaffakiyet, katından bir rahmet ve afiyet ve mağfiret ve rızanı diliyorum.",style: TextStyle(fontSize: 30),),
              SizedBox(height: 30,),
              Text("اَللّٰهُمَّ إِنِّي أَسْأَلُكَ الْعَفْوَ وَالْعَافِـيَـةَ فِي دِيـنِي وَدُنْـيَايَ وَأَهْلِي وَمَالِي ",style: TextStyle(fontSize: 30),),
              SizedBox(height: 30,),
              Text("Allahım, dinim, dünyam, ailem ve malımda Senden afv u afiyet diliyorum.",style: TextStyle(fontSize: 30),),
              SizedBox(height: 30,),
              Text("اَللّٰهُمَّ اسْتُرْ عَوْرَاتِي، وَأٰمِنْ رَوْعَاتِي ",style: TextStyle(fontSize: 30),),
              SizedBox(height: 30,),
              Text("Allahım, ayıplarımı ört ve beni korktuklarımdan emin eyle",style: TextStyle(fontSize: 30),),
              SizedBox(height: 30,),
              Text("اَللّٰهُمَّ احْفَظْنِي مِنْ بَـيْنِ يَدَيَّ، وَمِنْ خَلْفِي، وَعَنْ يَمِيـنِي، وَعَنْ شِمَالِي، وَمِنْ فَوْقِي، وَأَعُوذُ بِعَظَمَتِكَ أَنْ أُغْـتَالَ مِنْ تَحْتِي ",style: TextStyle(fontSize: 30),),
              SizedBox(height: 30,),
              Text("Allahım, önümden, arkamdan, sağımdan, solumdan ve üstümden gelebilecek tehlikelerden beni koru. Ayaklarımın altından derdest edilmekten de Senin azametine sığınırım.",style: TextStyle(fontSize: 30),),
              SizedBox(height: 30,),
              Text("[اَللّٰهُمَّ إِنِّي أَعُوذُ بِكَ مِنَ الْكُفْرِ وَالْفَقْرِ، اَللّٰهُمَّ إِنِّي أَعُوذُ بِكَ مِنْ عَذَابِ الْقَبْرِ، لَا إِلٰهَ إِلَّا أَنْتَ (٣)] ",style: TextStyle(fontSize: 30),),
              SizedBox(height: 30,),
              Text("[Allahım, Sana sığınırım küfürden ve fakirlikten. Allahım! Sana sığınırım kabir azabından. Senden başka ilah yoktur. (3 defa)]",style: TextStyle(fontSize: 30),),
              SizedBox(height: 30,),
              Text("[اَللّٰهُمَّ عَافِنِي فِي بَدَنِي، اَللّٰهُمَّ عَافِنِي فِي سَمْعِي، اَللّٰهُمَّ عَافِنِي فِي بَصَرِي، لَا إِلٰهَ إِلَّا أَنْتَ (٣)] ",style: TextStyle(fontSize: 30),),
              SizedBox(height: 30,),
              Text("[Allahım! Bedenime afiyet ver. Allahım! Kulağıma afiyet ver. Allahım! Gözüme afiyet ver. Senden başka ilah yoktur. (3 defa)]",style: TextStyle(fontSize: 30),),
              SizedBox(height: 30,),
              Text("يَا حَيُّ يَا قَـيُّومُ، بِرَحْمَتِكَ أَسْتَغِيثُ، أَصْلِحْ لِي شَأْنِي كُلَّهُ، وَلَا تَـكِلْنِي إِلَى نَفْسِي طَرْفَةَ عَيْنٍ ",style: TextStyle(fontSize: 30),),
              SizedBox(height: 30,),
              Text("Ya Hayy u ya Kayyûm! Rahmetin hakkı için Senden yardım dileniyorum; her halimi ıslah buyur ve göz açıp kapayıncaya kadar olsun beni nefsime terk etme.",style: TextStyle(fontSize: 30),),
              SizedBox(height: 30,),
              Text("اَللّٰهُمَّ أَنْتَ أَحَقُّ مَنْ ذُكِرَ، وَأَحَقُّ مَنْ عُبِدَ، وَأَنْصَرُ مَنِ ابْـتُـغِـيَ، وَأَرْأَفُ مَنْ مَلَكَ، وَأَجْوَدُ مَنْ سُئِلَ، وَأَوْسَعُ مَنْ أَعْطَى؛ أَنْتَ الْمَلِكُ لَا شَرِيكَ لَكَ، وَالْفَرْدُ لَا نِدَّ لَكَ، كُلُّ شَيْءٍ هَالِكٌ إِلَّا وَجْهَكَ، لَنْ تُطَاعَ إِلَّا بِإِذْنِكَ، وَلَنْ تُعْصَى إِلَّا بِعِلْمِكَ، تُطَاعُ فَـتَشْكُرُ، وَتُعْصَى فَـتَغْفِرُ، أَقْـرَبُ شَهِيدٍ، وَأَدْنَى حَفِيظٍ، حُلْتَ دُونَ النُّـفُوسِ، وَأَخَذْتَ بِالنَّوَاصِي، وَكَـتَـبْتَ الْأٰثَارَ، وَنَسَخْتَ الْأٰجَالَ؛ اَلْقُلُوبُ لَكَ مُفْضِيَةٌ، وَالسِّرُّ عِنْدَكَ عَلَانِـيَةٌ؛ اَلْحَلَالُ مَا أَحْلَلْتَ، وَالْحَرَامُ مَا حَرَّمْتَ، وَالدِّينُ مَا شَرَعْتَ، وَالْأَمْرُ مَا قَضَيْتَ؛ اَلْخَلْقُ خَلْقُكَ، وَالْعَبْدُ عَبْدُكَ، وَأَنْتَ اللهُ الرَّؤُوفُ الرَّحِيمُ؛ أَسْأَلُكَ بِنُورِ وَجْهِكَ الَّذِي أَشْرَقَتْ لَهُ السَّمَاوَاتُ وَالْأَرْضُ، وَبِكُلِّ حَقٍّ هُوَ لَكَ، وَبِحَقِّ السَّائِلِينَ عَلَيْكَ، أَنْ تُقِيلَنِي فِي هٰذِهِ الْغَدَاةِ وَفِي هٰذِهِ الْعَشِيَّةِ، وَأَنْ تُجِيرَنِي مِنَ النَّارِ بِقُدْرَتِكَ ",style: TextStyle(fontSize: 30),),
              SizedBox(height: 30,),
              Text("Allahım! Adı anılmaya en layık olan Sen, kullukta bulunulmaya en layık olan da yine Sensin. Sensin yardım istenilenlerin en çok yardım edeni, güç sahiplerinin en şefkatlisi, kapısında bir şeyler dilenilenlerin en cömerdi ve verenlerin eli en açık olanı. Sensin her şeyin, ortağı olmayan yegâne sahibi ve hâkimi. Sensin eşi ve benzeri olmayan biricik varlık. Senden başka ne varsa hepsi yok olmaya mahkûmdur. Sana, ancak Senin iznin ile itaat edilir ve Sen isyan edenleri mutlaka bilirsin. Sana itaat edilir, karşılığını verirsin. İsyan edilir, affedersin. Her şeye en yakın şahit Sen, en yakın koruyucu da yine Sensin. Nefislerin önüne geçer ve perçemlerden yakalarsın. İnsanların yaptıklarını yazar ve ecellerini takdir edersin. Kalbler sırlarını yalnız Sana açar, dolayısıyla her gizli Sana ayandır. Helal, Senin helal kıldığın, haram da Senin haram buyurduğundur. Din, Senin teşri kıldığın; emir de Senin hükmettiğindir. Mahlûkat, Senin varlığın; kul da Senin kulundur. Sen, Raûf ve Rahîm Allah’sın. Göklerin ve yerin kendisiyle parıldadığı yüzünün nuru hürmetine, Sana ait her bir hak hürmetine ve Sana el açıp dua eden kulların hürmetine beni şu günün sabahında ve akşamında affetmeni ve kudretinle Cehennem ateşinden korumanı diliyorum.",style: TextStyle(fontSize: 30),),
              SizedBox(height: 30,),
              Text("[أَعُوذُ بِكَلِمَاتِ اللهِ التَّامَّاتِ مِنْ شَرِّ مَا خَلَقَ (٣)] ",style: TextStyle(fontSize: 30),),
              SizedBox(height: 30,),
              Text("[Yarattıklarının şerrinden Allah’ın tastamam kelimelerine sığınıyorum. (3 defa)]",style: TextStyle(fontSize: 30),),
              SizedBox(height: 30,),
              Text("رَبِّ إِنِّي أَسْأَلُكَ خَيْرَ مَا فِي هٰذِهِ اللَّيْلَةِ وَخَيْرَ مَا بَعْدَهَا، وَأَعُوذُ بِكَ مِنْ شَرِّ مَا فِي هٰذِهِ اللَّيْلَةِ وَشَرِّ مَا بَعْدَهَا ",style: TextStyle(fontSize: 30),),
              SizedBox(height: 30,),
              Text("Rabbim! Bu ve bundan sonraki gecelerin hayrını Senden diler, bu gecenin ve daha sonraki gecelerin şerrinden de Sana sığınırım.",style: TextStyle(fontSize: 30),),
              SizedBox(height: 30,),
              Text("اَللّٰهُمَّ إِنِّي أَعُوذُ بِكَ مِنَ الْكَسَلِ وَالْهَرَمِ وَسُوءِ الْكِبَرِ وَفِـتْـنَـةِ الدُّنْـيَا وَعَذَابِ الْقَبْرِ  أَمْسَيْنَا وَأَمْسَى الْمُلْكُ لِلهِ رَبِّ الْعَالَمِينَ ",style: TextStyle(fontSize: 30),),
              SizedBox(height: 30,),
              Text("Allahım! Tembellikten, kocamaktan, ihtiyarlığın dertlerinden, dünyanın fitnesinden ve ahiret azabından Sana sığınıyorum. Biz de, bütün mülk de, Âlemlerin Rabbi Allah’a ait olarak akşamladık",style: TextStyle(fontSize: 30),),
              SizedBox(height: 30,),
              Text("اَللّٰهُمَّ إِنِّي أَسْأَلُكَ خَيْرَ هٰذِهِ اللَّيْلَةِ، وَفَتْحَهَا وَنَصْرَهَا وَنُورَهَا وَبَرَكَتَهَا وَهُدَاهَا، وَأَعُوذُ بِكَ مِنْ شَرِّ مَا فِيهَا وَشَرِّ مَا بَعْدَهَا ",style: TextStyle(fontSize: 30),),
              SizedBox(height: 30,),
              Text("Allahım! Senden bu gecenin hayrını, fethini, yardımını, nurunu, bereket ve hidayetini istiyor, bu ve bundan sonraki gecelerde olan ve olacakların şerrinden Sana sığınıyorum.",style: TextStyle(fontSize: 30),),
              SizedBox(height: 30,),


            ],
            padding: EdgeInsets.all(16.0),
          ),
        )
    );
  }
}