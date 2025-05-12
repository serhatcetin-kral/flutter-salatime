
import 'dart:io';

import 'package:flutter/material.dart';

class Fetih extends StatefulWidget {


  @override
  State<Fetih> createState() => _FetihState();
}

class _FetihState extends State<Fetih> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[100],
      appBar: AppBar(
        title: Text("Fetih suresi"),
        centerTitle: true,
      ),
      body:Center(

        child:Expanded(
          child: ListView(
            children: [
              SizedBox(height: 30,),
              Container(child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text("اِنَّا فَتَحْنَا لَكَ فَتْحًا مُب۪ينًاۙ (1)لِيَغْفِرَ لَكَ اللّٰهُ مَا تَقَدَّمَ مِنْ ذَنْبِكَ وَمَا تَاَخَّرَ وَيُتِمَّ نِعْمَتَهُ عَلَيْكَ وَيَهْدِيَكَ صِرَاطًا مُسْتَق۪يمًاۙ (2)وَيَنْصُرَكَ اللّٰهُ نَصْرًا عَز۪يزًا (3)"
                    "هُوَ الَّذ۪ٓي اَنْزَلَ السَّك۪ينَةَ ف۪ي قُلُوبِ الْمُؤْمِن۪ينَ لِيَزْدَادُٓوا ا۪يمَانًا مَعَ ا۪يمَانِهِمْۜ وَلِلّٰهِ جُنُودُ السَّمٰوَاتوَالْاَرْضِۜ وَكَانَ اللّٰهُ عَل۪يمًا حَك۪يمًاۙ (4)لِيُدْخِلَ الْمُؤْمِن۪ينَ وَالْمُؤْمِنَاتِ جَنَّاتٍ تَجْر۪ي مِنْ تَحْتِهَا الْاَنْهَارُ خَالِد۪ينَ ف۪يهَا وَيُكَفِّرَ عَنْهُمْ سَيِّـَٔاتِهِمْۜوَكَانَ ذٰلِكَ عِنْدَ اللّٰهِ فَوْزًا عَظ۪يمًاۙ (5)وَيُعَذِّبَ الْمُنَافِق۪ينَ وَالْمُنَافِقَاتِ وَالْمُشْرِك۪ينَ وَالْمُشْرِكَاتِ الظَّٓانّ۪ينَ بِاللّٰهِ ظَنَّ السَّوْءِۜ عَلَيْهِمْ دَٓائِرَةُالسَّوْءِۚ وَغَضِبَ اللّٰهُ عَلَيْهِمْ وَلَعَنَهُمْ وَاَعَدَّ لَهُمْ جَهَنَّمَۜ وَسَٓاءَتْ مَص۪يرًا (6)وَلِلّٰهِ جُنُودُ السَّمٰوَاتِ وَالْاَرْضِۜ وَكَانَ اللّٰهُ عَز۪يزًا حَك۪يمًا (7)اِنَّٓا اَرْسَلْنَاكَ شَاهِدًا وَمُبَشِّرًا وَنَذ۪يرًاۙ (8)لِتُؤْمِنُوا بِاللّٰهِ وَرَسُولِه۪ وَتُعَزِّرُوهُ وَتُوَقِّرُوهُۜ وَتُسَبِّحُوهُ بُكْرَةً وَاَص۪يلًا (9)",style: TextStyle(fontSize: 30),),
              ),),
SizedBox(height: 30,),
              Container(child: Padding(padding: const EdgeInsets.all(6.0),
                child: Text("1. Doğrusu biz sana apaçık bir fetih ihsân ettik."

    "2. Böylece Allah senin geçmiş ve gelecek günahını bağışlar. Sana olan nimetini tamamlar ve seni doğru yola iletir."
                    "3. Ve sana Allah, şanlı bir zaferle yardım eder."

    "4. İmanlarına iman katsınlar diye müminlerin kalplerine güven indiren O’dur. Göklerin ve yerin orduları Allah’ındır. Allah bilendir, herşeyi hikmetle yapandır."

    "5. Mümin erkeklerle mümin kadınları, içinde ebedi kalacakları, altlarından ırmaklar akan cennetlere koyması, onların günahlarını örtmesi içindir. İşte bu, Allah katında büyük bir kurtuluştur."

    "6. Ve o Allah hakkında kötü zanda bulunan münâfık erkeklere ve münâfık kadınlara, Allah’a ortak koşan erkeklere ve ortak koşan kadınlara azap etmesi içindir. Kötülük onların başlarına gelmiştir. Allah onlara gazap etmiş, lânetlemiş ve cehennemi kendilerine hazırlamıştır. Orası ne kötü bir yerdir!"

    "7. Göklerin ve yerin orduları Allah’ındır. Allah çok güçlüdür, hüküm ve hikmet sahibidir."

   " 8. Şüphesiz biz seni, şâhit, müjdeleyici ve uyarıcı olarak gönderdik."

    "9. Ki, Allah’a ve Resulüne iman edesiniz ve bunu takviye edip, O’na saygı gösteresiniz ve sabah akşam O’nu tesbih edesiniz.",style: TextStyle(fontSize: 30),),),),

          SizedBox(height: 30,),
              Container(child: Padding(
                padding: const EdgeInsets.all(6.0),child: Text("اِنَّ الَّذ۪ينَ يُبَايِعُونَكَ اِنَّمَا يُبَايِعُونَ اللّٰهَۜ يَدُ اللّٰهِ فَوْقَ اَيْد۪يهِمْۚ فَمَنْ نَكَثَ فَاِنَّمَا يَنْكُثُ عَلٰى نَفْسِه۪ۚ وَمَنِْاَوْفٰى بِمَا عَاهَدَ عَلَيْهُ اللّٰهَ فَسَيُؤْت۪يهِ اَجْرًا عَظ۪يمًا۟ (10)سَيَقُولُ لَكَ الْمُخَلَّفُونَ مِنَ الْاَعْرَابِ شَغَلَتْنَٓا اَمْوَالُنَا وَاَهْلُونَا فَاسْتَغْفِرْ لَنَاۚ يَقُولُونَ بِاَلْسِنَتِهِمْ مَا لَيْسَ ف۪ي قُلُوبِهِمْۜ قُلْ فَمَنْ يَمْلِكُ لَكُمْ مِنَ اللّٰهِ شَيْـًٔا اِنْ اَرَادَ بِكُمْ ضَرًّا اَوْ اَرَادَ بِكُمْ نَفْعًاۜ بَلْ كَانَ اللّٰهُ بِمَا تَعْمَلُونَ خَب۪يرًا (11)بَلْ ظَنَنْتُمْ اَنْ لَنْ يَنْقَلِبَ الرَّسُولُ وَالْمُؤْمِنُونَ اِلٰٓى اَهْل۪يهِمْ اَبَدًا وَزُيِّنَ ذٰلِكَ ف۪ي قُلُوبِكُمْ وَظَنَنْتُمْ ظَنَّالسَّوْءِۚ وَكُنْتُمْ قَوْمًا بُورًا (12)وَمَنْ لَمْ يُؤْمِنْ بِاللّٰهِ وَرَسُولِه۪ فَاِنَّٓا اَعْتَدْنَا لِلْكَافِر۪ينَ سَع۪يرًا (13)وَلِلّٰهِ مُلْكُ السَّمٰوَاتِ وَالْاَرْضِۜ يَغْفِرُ لِمَنْ يَشَٓاءُ وَيُعَذِّبُ مَنْ يَشَٓاءُۜ وَكَانَ اللّٰهُ غَفُورًا رَح۪يمًا (14)سَيَقُولُ الْمُخَلَّفُونَ اِذَا انْطَلَقْتُمْ اِلٰى مَغَانِمَ لِتَأْخُذُوهَا ذَرُونَا نَتَّبِعْكُمْۚ يُر۪يدُونَ اَنْ يُبَدِّلُوا كَلَامَ اللّٰهِۜ قُلْ لَنْ تَتَّبِعُونَا كَذٰلِكُمْ قَالَ اللّٰهُ مِنْ قَبْلُۚ فَسَيَقُولُونَ بَلْ تَحْسُدُونَنَاۜ بَلْ كَانُوا لَا يَفْقَهُونَ اِلَّا قَل۪يلًا (15)",style: TextStyle(fontSize: 30),)),),
              SizedBox(height: 30,),Container(child: Padding(padding: const EdgeInsets.all(6.0),child: Text("10. Herhalde sana bey’at edenler ancak Allah’a bey’at etmektedirler. Allah’ın eli onların ellerinin üzerindedir. Kim ahdi bozarsa ancak kendi aleyhine bozmuş olur. Kim de Allah’a verdiği ahde vefa gösterirse Allah ona büyük bir mükâfat verecektir."

                  "11. yakında a’râbilerden geri kalmış olanlar sana diyecekler ki, «Mallarımız ve ailelerimiz bizi alıkoydu. Allah’tan bizim bağışlanmamızı dile.» Onlar kalplerinde olmayanı dilleriyle söylerler. De ki: Allah size bir zarar gelmesini dilerse veya bir fayda elde etmenizi isterse O’na karşı kimin bir şeye gücü yetebilir? Hayır! Allah yaptıklarınızdan haberdardır."

                  " 12. Aslında siz Peygamber ve müminlerin, ailelerine geri dönmeyeceklerini sanmıştınız. Bu sizin gönüllerinize güzel göründü de kötü zanda bulundunuz ve helâki hak etmiş bir topluluk oldunuz."

                  "13. Kim Allah’a ve Rasulüne iman etmezse şüphesiz biz, kâfirler için çılgın bir ateş hazırlamışızdır."

                  "14. Göklerin ve yerin mülkü Allah’ındır. O, dilediğini bağışlar dilediğini azaplandırır. Allah çok bağışlayan çok merhamet edendir."

                  " 15. Siz ganimetleri almak için gittiğinizde geri kalanlar: «Bırakın biz de arkanıza düşelim.» diyeceklerdir. Onlar, Allah’ın sözünü değiştirmek isterler. De ki: Siz bizimle gelemeyeceksiniz. Allah daha önce böyle buyurmuştur. Onlar size: «Bizi kıskanıyorsunuz.» diyeceklerdir. Bilakis onlar, pek az anlayan kimselerdir.",style: TextStyle(fontSize: 30),),),),

              SizedBox(height: 30,),
              Container(child: Padding(
                  padding: const EdgeInsets.all(6.0),child: Text("قُلْ لِلْمُخَلَّف۪ينَ مِنَ الْاَعْرَابِ سَتُدْعَوْنَ اِلٰى قَوْمٍ اُو۬ل۪ي بَأْسٍ شَد۪يدٍ تُقَاتِلُونَهُمْ اَوْ يُسْلِمُونَۚ فَاِنْ تُط۪يعُوايُؤْتِكُمُ اللّٰهُ اَجْرًا حَسَنًاۚ وَاِنْ تَتَوَلَّوْا كَمَا تَوَلَّيْتُمْ مِنْ قَبْلُ يُعَذِّبْكُمْ عَذَابًا اَل۪يمًا ((16)لَيْسَ عَلَى الْاَعْمٰى حَرَجٌ وَلَا عَلَى الْاَعْرَجِ حَرَجٌ وَلَا عَلَى الْمَر۪يضِ حَرَجٌۜ وَمَنْ يُطِعِ اللّٰهَ وَرَسُولَهُيُدْخِلْهُ جَنَّاتٍ تَجْر۪ي مِنْ تَحْتِهَا الْاَنْهَارُۚ وَمَنْ يَتَوَلَّ يُعَذِّبْهُ عَذَابًا اَل۪يمًا۟ (17)لَقَدْ رَضِيَ اللّٰهُ عَنِ الْمُؤْمِن۪ينَ اِذْ يُبَايِعُونَكَ تَحْتَ الشَّجَرَةِ فَعَلِمَ مَا ف۪ي قُلُوبِهِمْ فَاَنْزَلَ السَّك۪ينَةَ عَلَيْهِمْ وَاَثَابَهُمْ فَتْحًا قَر۪يبًاۙ (18)وَمَغَانِمَ كَث۪يرَةً يَأْخُذُونَهَاۜ وَكَانَ اللّٰهُ عَز۪يزًا حَك۪يمًا (19)وَعَدَكُمُ اللّٰهُ مَغَانِمَ كَث۪يرَةً تَأْخُذُونَهَا فَعَجَّلَ لَكُمْ هٰذِه۪ وَكَفَّ اَيْدِيَ النَّاسِ عَنْكُمْۚ وَلِتَكُونَ اٰيَةً لِلْمُؤْمِن۪ينَ وَيَهْدِيَكُمْ صِرَاطًا مُسْتَق۪يمًاۙ (20)وَاُخْرٰى لَمْ تَقْدِرُوا عَلَيْهَا قَدْ اَحَاطَ اللّٰهُ بِهَاۜ وَكَانَ اللّٰهُ عَلٰى كُلِّ شَيْءٍ قَد۪يرًا (21)وَلَوْ قَاتَلَكُمُ الَّذ۪ينَ كَفَرُوا لَوَلَّوُا الْاَدْبَارَ ثُمَّ لَا يَجِدُونَ وَلِيًّا وَلَا نَص۪يرًا (22)سُنَّةَ اللّٰهِ الَّت۪ي قَدْ خَلَتْ مِنْ قَبْلُۚ وَلَنْ تَجِدَ لِسُنَّةِ اللّٰهِ تَبْد۪يلًا (23)"
    ,style: TextStyle(fontSize: 30),)),),
              SizedBox(height: 30,),Container(child: Padding(padding: const EdgeInsets.all(6.0),child: Text("16. A’rabilerin geri bırakılmış olanlarına de ki: Siz yakında çok kuvvetli bir kavme karşı savaşmaya çağırılacaksınız. Onlarla savaşırsınız veya müslüman olurlar. Eğer itaat ederseniz, Allah size güzel bir mükâfat verir. Ama önceden döndüğünüz gibi yine dönecek olursanız sizi acıklı bir azaba uğratır."

           " 17. Köre vebal yoktur, topala da vebal yoktur, hastaya da vebal yoktur. Bununla beraber kim Allah’a ve peygamberine itâat ederse, Allah onu, altından ırmaklar akan cennetlere sokar. Kim de geri kalırsa, onu acı bir azaba uğratır."

          "  18. Andolsun o ağacın altında (Hudeybiye’de) sana bey’at ederlerken Allah, müminlerden razı olmuştur. Kalplerinde olanı bilmiş onlara güven indirmiş ve onları pek yakın bir fetih ile mükâfatlandırmıştır."

          "19. Allah onları elde edecekleri birçok ganimetlerle de mükâfatlandırdı. Allah çok güçlüdür, hüküm ve hikmet sahibidir."

         " 20. Allah size, elde edeceğiniz birçok ganimetler vaad etmiştir. Bunu size hemen vermiş ve insanların ellerini sizden çekmiştir ki bu, müminlere bir işaret olsun ve Allah sizi doğru yola iletsin."

         " 21. Bundan başka sizin güç yetiremediğiniz, ama Allah’ın sizin için kuşattığı ganimetler de vardır. Allah herşeye kâdirdir."

          "22. Eğer kâfirler sizinle savaşsalardı arkalarına dönüp kaçarlardı. Sonra bir dost ve yardımcı da bulamazlardı."

         " 23. Allah’ın öteden beri gelen kanunu budur. Allah’ın kanununda asla bir değişiklik bulamazsın.",style: TextStyle(fontSize: 30),),),),
SizedBox(height: 30,),
              Container(child: Padding(
                padding: const EdgeInsets.all(6.0),child: Text("وَهُوَ الَّذ۪ي كَفَّ اَيْدِيَهُمْ عَنْكُمْ وَاَيْدِيَكُمْ عَنْهُمْ بِبَطْنِ مَكَّةَ مِنْ بَعْدِ اَنْ اَظْفَرَكُمْ عَلَيْهِمْۜ وَكَانَ اللّٰهُ بِمَا تَعْمَلُونَ بَص۪يرًا (24)هُمُ الَّذ۪ينَ كَفَرُوا وَصَدُّوكُمْ عَنِ الْمَسْجِدِ الْحَرَامِ وَالْهَدْيَ مَعْكُوفًا اَنْ يَبْلُغَ مَحِلَّهُۜ وَلَوْلَا رِجَالٌ مُؤْمِنُونَ وَنِسَٓاءٌ مُؤْمِنَاتٌ لَمْ تَعْلَمُوهُمْ اَنْ تَطَؤُ۫هُمْ فَتُص۪يبَكُمْ مِنْهُمْ مَعَرَّةٌ بِغَيْرِ عِلْمٍۚ لِيُدْخِلَ اللّٰهُ ف۪ي رَحْمَتِه۪ مَنْ يَشَٓاءُۚ لَوْ تَزَيَّلُوا لَعَذَّبْنَا الَّذ۪ينَ كَفَرُوا مِنْهُمْ عَذَابًا اَل۪يمًا (25)اِذْ جَعَلَ الَّذ۪ينَ كَفَرُوا ف۪ي قُلُوبِهِمُ الْحَمِيَّةَ حَمِيَّةَ الْجَاهِلِيَّةِ فَاَنْزَلَ اللّٰهُ سَك۪ينَتَهُ عَلٰى رَسُولِه۪ وَعَلَى الْمُؤْمِن۪ينَ وَاَلْزَمَهُمْ كَلِمَةَ التَّقْوٰى وَكَانُٓوا اَحَقَّ بِهَا وَاَهْلَهَاۜ وَكَانَ اللّٰهُ بِكُلِّ شَيْءٍ عَل۪يمًا۟  (26)لَقَدْ صَدَقَ اللّٰهُ رَسُولَهُ الرُّءْيَا بِالْحَقِّۚ لَتَدْخُلُنَّ الْمَسْجِدَ الْحَرَامَ اِنْ شَٓاءَ اللّٰهُ اٰمِن۪ينَۙ مُحَلِّق۪ينَ رُؤُ۫سَكُمْ وَمُقَصِّر۪ينَۙ لَا تَخَافُونَۜ فَعَلِمَ مَا لَمْ تَعْلَمُوا فَجَعَلَ مِنْ دُونِ ذٰلِكَ فَتْحًا قَر۪يبًا (27)هُوَ الَّذ۪ٓي اَرْسَلَ رَسُولَهُ بِالْهُدٰى وَد۪ينِ الْحَقِّ لِيُظْهِرَهُ عَلَى الدّ۪ينِ كُلِّه۪ۜ وَكَفٰى بِاللّٰهِ شَه۪يدًاۜ (28)",style: TextStyle(fontSize: 30),),
              ),),
              SizedBox(height: 30,),Container(child: Padding(padding: const EdgeInsets.all(6.0),child: Text("24. O sizi onlara karşı muzaffer kıldıktan sonra Mekke’nin göbeğinde onların ellerini sizden, sizin ellerinizi de onlardan çekendir. Allah, yaptıklarınızı görendir."

   " 25. Onlar inkâr eden ve sizin Mescid-i Haram’ı ziyaretinizi ve bekletilen kurbanların yerlerine ulaşmasını men edenlerdir. Eğer kendilerini henüz tanımadığınız mümin erkeklerle, mümin kadınları bilmeyerek ezmek suretiyle bir vebalin altında kalmanız ihtimali olmasaydı, Allah savaşı önlemezdi. Dilediklerine rahmet etmek için Allah böyle yapmıştır. Eğer onlar birbirinden ayrılmış olsalardı elbette onlardan inkâr edenleri elemli bir azaba çarptırırdık."

    "26. O zaman inkâr edenler, kalplerine taassubu, câhiliyet taassubunu yerleştirmişlerdi. Allah da elçisine ve müminlere sükûnet ve güvenini indirdi. Onları takva sözü üzerinde durdurdu. Zaten onlar buna pek layık ve ehil kimselerdi. Allah herşeyi bilendir."

    "27. Andolsun ki Allah, elçisinin rüyasını doğru çıkardı. Allah dilerse siz güven içinde başlarınızı tıraş etmiş ve saçlarınızı kısaltmış olarak, korkmadan Mescid-i Haram’a gireceksiniz. Allah sizin bilmediğinzi bilir. İşte bundan önce size yakın bir fetih verdi."

   " 28. Bütün dinlerden üstün kılmak üzere, Peygamberini hidayet ve hak din ile gönderen O’dur. Şahit olarak Allah yeter.",style: TextStyle(fontSize: 30),),),),
SizedBox(height: 30,),
              Container(child: Padding(padding:const EdgeInsets.all(6.0),child: Text("مُحَمَّدٌ رَسُولُ اللّٰهِۜ وَالَّذ۪ينَ مَعَهُٓ اَشِدَّٓاءُ عَلَى الْكُفَّارِ رُحَمَٓاءُ بَيْنَهُمْ تَرٰيهُمْ رُكَّعًا سُجَّدًا يَبْتَغُونَ فَضْلًا مِنَ اللّٰهِ وَرِضْوَانًاۘ س۪يمَاهُمْ ف۪ي وُجُوهِهِمْ مِنْ اَثَرِ السُّجُودِۜ ذٰلِكَ مَثَلُهُمْ فِي التَّوْرٰيةِۚۛ وَمَثَلُهُمْ فِي الْاِنْج۪يلِ۠ۛ كَزَرْعٍ اَخْرَجَ شَطْـَٔهُ۫ فَاٰزَرَهُ فَاسْتَغْلَظَ فَاسْتَوٰى عَلٰى سُوقِه۪ يُعْجِبُ الزُّرَّاعَ لِيَغ۪يظَ بِهِمُ الْكُفَّارَۜ وَعَدَ اللّٰهُ الَّذ۪ينَ اٰمَنُوا وَعَمِلُوا الصَّالِحَاتِ مِنْهُمْ مَغْفِرَةً وَاَجْرًا عَظ۪يمًا (29)",style: TextStyle(fontSize: 30),),),),

              SizedBox(height: 30,),Container(child: Padding(padding: const EdgeInsets.all(6.0),child: Text("29. Muhammed Allah’ın elçisidir. Onun yanında bulunanlar da kâfirlere karşı çetin, kendi aralarında merhametlidirler. Onları rükûa varırken secde ederken görürsün. Allah’tan lütuf ve rıza isterler. Yüzlerinde secdelerin izinden nişanları vardır. Bu, onların Tevrat’taki vasıflarıdır. İncil’deki vasıfları da şöyledir: Onlar filizini yarıp çıkarmış, gittikçe onu kuvvetlendirerek kalınlaşmış, gövdesi üzerine dikilmiş bir ekine benzerler ki bu, ziraatçıların da hoşuna gider. Allah böylece onları çoğaltıp kuvvetlendirmekle kâfirleri öfkelendirir. Allah inanıp iyi işler yapanlara mağfiret ve büyük bir mükâfat vaad etmiştir.",style: TextStyle(fontSize: 30),),),),
            ],
          ),
        )


        ,
      ),

    );
  }
}
