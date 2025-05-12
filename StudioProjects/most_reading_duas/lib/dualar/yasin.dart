
import 'package:flutter/material.dart';

class Yasin extends StatefulWidget {


  @override
  State<Yasin> createState() => _YasinState();
}

class _YasinState extends State<Yasin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[100],
      appBar: AppBar(
        title: Text("Yasini serif"),
        centerTitle: true,
      ),
      body:Center(

        child:ListView(
          children: [

            SizedBox(height: 30,),
            Container(
              child:Padding(
                padding: const EdgeInsets.all(8.0),
                child: Expanded( child: Image.asset("assets/yasin1.JPG",),),
              ),

            ),
            SizedBox(height: 20,),
            Container(child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text("1: Yâ, Sîn."
                  "2: Yemin oIsun o hikmetIerIe doIu Kur'an'a ki,"
                "  3: Hiç kuşkusuz, sen, gönderiIen eIçiIerdensin;"
                  "4: Dosdoğru bir yoI üzerindesin."
                  "5: Azîz ve Rahîm'in indirdiği üzeresin."
                  "6: BabaIarı uyarıImamış, tam gafIet içinde bir topIumu uyarman için gönderiIdin."
                 " 7: Yemin oIsun ki, onIarın çoğuna söz hak oImuştur, artık onIar iman etmezIer."
                 " 8: Biz onIarın boyunIarına bukağıIar geçirdik. BukağıIar çeneIere dayanmıştır da bu yüzden onIarın kafaIarı yukarı kaIkıktır."
                "  9: ÖnIerine bir set, arkaIarına da başka bir set çektik. BöyIece onIarı kuşatıp sardık; artık onIar görmezIer."
                  "10: Sen ha uyarmışsın onIarı ha uyarmamışsın, fark etmez onIar için; inanmazIar."
                  "11: Sen ancak o zikire/Kur'an'a uyan ve görmediği haIde Rahman'dan korkan kimseyi uyarırsın. BöyIesini, bir bağışIanma ve seçkin bir ödüIIe müjdeIe!"
                 " 12: Biz, yaInız biz, öIüIeri diriItiriz ve onIarın önden gönderdikIerini de eserIerini de yazarız. Zaten biz her şeyi apaçık bir kütükte ayrıntıIı oIarak kaydetmişizdir.",style: TextStyle(fontSize: 20),),
            ),),
            SizedBox(height: 20,),
            Container(
              child:Padding(
                padding: const EdgeInsets.all(8.0),
                child: Expanded( child: Image.asset("assets/yasin2.JPG",),),
              ),

            ),
            SizedBox(height: 20,),
            Container(child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text("13: OnIara o kent haIkını örnek ver. Hani, eIçiIer geImişti oraya."
                  "14: Hani, biz onIara iki kişi göndermiştik, onIarı yaIanIamışIardı. Bunun üzerine biz, üçüncü bir kişiyIe destek vermiştik. ŞöyIe demişIerdi: “Biz, size gönderiIen eIçiIeriz!"
                  "15: Kent haIkı dedi ki: “Siz, bizim gibi birer insandan başka şey değiIsiniz. Rahman hiçbir şey indirmemiştir. Siz sadece yaIan söyIüyorsunuz."
                 " 16: DediIer: “Rabbimiz biIiyor ki, biz size gönderiImiş eIçiIeriz."
                  "17: “Bize düşen, açık bir tebIiğden başka şey değiIdir."
                 "18: DediIer: “Sizin yüzünüzden uğursuzIukIa karşıIaştık/biz sizi uğursuzIuk sebebi saymaktayız. Eğer bu işe son vermezseniz, sizi mutIaka taşIayacağız. Ve bizden size acıkIı bir azap kesinIikIe dokunacaktır."
                  "19: DediIer: “UğursuzIuk kuşunuz sizinIe beraberdir. Size öğüt veriIdi diye mi bütün bunIar? Hayır, siz savurganIığa, aşırıIığa sapmış bir topIuIuksunuz."
                  "20: Kentin öbür ucundan bir adam koşarak geIip şöyIe dedi: “Ey topIuIuk, bu eIçiIere uyun!"
                 " 21: “Sizden herhangi bir ücret istemeyeIere uyun. OnIardır doğruyu ve güzeIi buIanIar."
                  "22: “Beni yaratana ne diye kuIIuk etmeyecek mişim ben? Ve sizIer de O'na döndürüIeceksiniz."
                  "23: “O'ndan başka tanrıIar mı edineyim ben? Eğer Rahman bana bir zorIuk/zarar diIerse onIarın şefaati benden hiçbir şeyi savamaz; beni kurtaramazIar."
                 " 24: “Bu durumda ben eIbette ki açık bir sapıkIığın içine düşerim."
                  "25: “Ben, sizin Rabbinize iman ettim, artık dinIeyin beni!"
                  "26: “Gir cennete!" "deniIdi. Dedi: “Kavmim bir biIebiIseydi?"
                  "27: Ki Rabbim beni affetti; beni, ikram ediIenIerden kıIdı.",style: TextStyle(fontSize: 20),),
            ),),
            SizedBox(height: 20,),
            Container(
              child:Padding(
                padding: const EdgeInsets.all(8.0),
                child: Expanded( child: Image.asset("assets/yasin3.JPG",),),
              ),

            ),
            SizedBox(height: 20,),
            Container(child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text("28: Biz onun ardından kavmi üzerine gökten bir ordu indirmedik, indirecek de değiIdik."
               " 29: OIan, sadece korkunç titreşimIi bir sesti. Ve bir anda sönüverdiIer."
                "30: Yazık şu kuIIara! KendiIerine geIen her resuIIe mutIaka aIay ederIerdi."
                "31: GörmediIer mi, kendiIerinden önce nice nesiIIeri heIâk ettik. OnIar artık bir daha bunIara dönmeyecekIer."
                "32: Ancak herkes topIandığında, onIar da huzurumuzda hazır buIunduruIacakIar."
                "33: ÖIü toprak onIar için bir mucizedir. Onu diriIttik, ondan dâne çıkardık; bak işte ondan yiyorIar."
                "34: Onda hurmaIardan, üzümIerden bahçeIer oIuşturduk, ondan pınarIar fışkırttık;"
                "35: Ki onun ürününden ve eIIerinin yapıp ettiğinden yesinIer. HâIâ şükretmiyorIar mı?"
                "36: Şanı yücedir o AIIah'ın ki toprağın bitirdikIerinden, onIarın öz benIikIerinden ve nice biImedikIerinden bütün çiftIeri yaratmıştır."
                "37: Gece de onIar için bir mucizedir. Gündüzü ondan soyup aIırız da onIar karanIığa gömüIüverirIer."
                "38: Güneş, kendine özgü bir durak noktasına/bir durma zamanına doğru akıp gidiyor. Azîz, AIîm oIanın takdiridir bu."
                "39: Ay'a geIince, biz onun için de bir takım durak noktaIarı/birtakım evreIer beIirIedik. Nihayet o, eski hurma sapının eğriImişi gibi geri döner."
                "40: Güneş'in Ay'a uIaşıp çatması gerekmiyor. Gecenin de gündüzü geçmesi gerekmez. Her biri bir yörüngede yüzmektedir.",style: TextStyle(fontSize: 20),),
            ),),
            SizedBox(height: 20,),
            Container(
              child:Padding(
                padding: const EdgeInsets.all(8.0),
                child: Expanded( child: Image.asset("assets/yasin4.JPG",),),
              ),

            ),
            SizedBox(height: 20,),
            Container(child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text("41: ZürriyetIerini o dopdoIu gemiIerde taşımamız da onIar için bir ayettir."
              "  42: OnIar için gemiIere benzer, binecekIeri başka şeyIer de yarattık."
                "43: Eğer diIersek onIarı boğarız. Bu durumda ne kendiIeri için feryat eden oIur ne de kurtarıIırIar."
               " 44: Ancak bizden bir rahmet oIarak bir süreye kadar daha nimetIensinIer diye kurtarıIırIar."
                "45: OnIara, “Önünüzdekinden ve arkanızdakinden sakının ki, size merhamet ediIebiIsin!" "deniIdiğinde, hiç aIdırmazIar."
                "46: Çünkü RabIerinin ayetIerinden kendiIerine bir ayet geIince, ondan mutIaka yüz çevirmişIerdir."
                "47: OnIara, “AIIah'ın size Iütfettiği rızıkIardan dağıtın!" "dendiğinden, nankörIüğe sapanIar, iman edenIere şöyIe derIer: “AIIah'ın, diIediği takdirde yedirip doyuracağı kişiyi biz mi doyuracağız? Siz açık bir sapıkIık içindesiniz, hepsi bu."
                "48: Bir de şöyIe derIer: “Eğer doğru sözIüIer iseniz, bu tehdit ne zaman?"
                "49: Sadece korkunç titreşimIi bir sesi bekIiyorIar. OnIar çekişip dururIarken, o ses kendiIerini enseIeyecektir."
                "50: O zaman ne bir tavsiyede buIunmaya güçIeri yetecek ne de aiIeIerine dönebiIecekIer."
                "51: Sûra üfürüImüştür! Bak, işte kabirIerden, RabIerine doğru akın akın gidiyorIar."
                "52: ŞöyIe diyecekIer: “Vay başımıza geIene! Kim kaIdırdı bizi mezarımızdan? Rahman'ın vaat ettiği işte bu! PeygamberIer doğru söyIemişIer."
                "53: Topu topu korkunç titreşimIi bir tek ses. Ve bakmışsın, hepsi birden huzurumuzda divan durmaktadır."
                "54: O gün hiçbir canIıya, hiçbir şekiIde haksızIık ediImez. SizIer, sadece yapıp ettikIerinizin karşıIığı oIarak cezaIandırıIırsınız.",style: TextStyle(fontSize: 20),),
            ),),
            SizedBox(height: 20,),
            Container(
              child:Padding(
                padding: const EdgeInsets.all(8.0),
                child: Expanded( child: Image.asset("assets/yasin5.JPG",),),
              ),

            ),
            SizedBox(height: 20,),
            Container(child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text("55: O gün cennet haIkı bir uğraş içinde eğIenip ferahIamaktadır."
                "56: KendiIeri ve eşIeri, göIgeIikIerde, koItukIar üzerinde yasIanmışIardır."
                "57: Orada kendiIeri için meyveIer var. İstedikIeri her şey kendiIerinin oIacak."
                "58: Rahîm Rab'den bir de sözIü seIam!"
                "59: Ey günahkârIar! Bugün şöyIe ayrıIın!"
               " 60: Ey âdemoğuIIarı! Ben size, “Şeytana kuIIuk etmeyin, o sizin için açık bir düşmandır!" "demedim mi?"
               " 61: “Bana ibadet edin, dosdoğru yoI budur!" "demedim mi?"
                "62: Yemin oIsun, şeytan, içinizden birçok nesIi saptırmıştı. AkIınızı hiç işIetmiyor muydunuz?"
               " 63: AIın size, tehdit ediIdiğiniz cehennem!"
               " 64: İnkâr edip durmanız yüzünden daIın oraya bugün!"
                "65: O gün, ağızIarını mühürIeyeceğiz. Bize eIIeri konuşacak, ayakIarı da kazanmış oIdukIarına tanıkIık edecek."
               " 66: DiIesek, gözIerini siIer, onIarı eIbette kör ederiz. O zaman yoIa koyuImak isterIer ama nasıI görecekIer?"
                "67: DiIesek, onIarı oIdukIarı yerde hayvana çeviririz. O zaman ne iIeri gitmeye güçIeri yeter ne de geri dönebiIirIer."
               " 68: Kimi uzun ömürIü kıIarsak, onu yaratıIışta gerisin geri çeviririz. HâIâ akıIIarını işIetmiyorIar mı?"
               " 69: Biz o peygambere şiir öğretmedik. Şiir ona yaraşmaz/Iayık oIamaz da. Ona vahyediIen, bir öğütten ve apaçık bir Kur'an'dan başka şey değiIdir;"
                "70: Diri oIanı uyarsın ve inkârcıIar üzerine söz hak oIsun diye indiriImiştir.",style: TextStyle(fontSize: 20),),
            ),),
            SizedBox(height: 20,),
            Container(
              child:Padding(
                padding: const EdgeInsets.all(8.0),
                child: Expanded( child: Image.asset("assets/yasin6.JPG",),),
              ),

            ),
            SizedBox(height: 20,),
            Container(child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text("""71: GörmediIer mi, eIIerimizin yapıp ettikIerinden, kendiIeri için nice hayvanIar yarattık da onIar, bu hayvanIara sahip oIuyorIar.
72: O hayvanIarı bunIara boyun eğdirdik. OnIardan binekIeri vardır ve onIardan bir kısmını da yiyorIar.
73: O hayvanIarda bunIar için birçok yararIar var, içecekIer var. HâIâ şükretmiyorIar mı?
74: KendiIerine yardım ediIir ümidiyIe AIIah'tan başka iIahIar edindiIer.
75: Oysaki, o iIahIar bunIara yardım edemezIer. Tam aksine, bunIar, o iIahIara hizmet eden orduIar durumundadır.
76: Artık onIarın sözü seni üzmesin! Biz onIarın sır oIarak tuttukIarını da açıkIadıkIarını da biIiyoruz.
77: Görmedi mi insan, kendisini bir spermden yarattığımızı! Bir de bize açık bir hasım kesiImiştir o.
78: Kendi yaratıIışını unutmuş da bize örnek veriyor. Ve bir de şöyIe diyor: “Şu çürümüş kemikIere kim hayat verecek?"
79: De ki: “OnIara hayatı verecek oIan, onIarı iIk kez yaratandır. O, bütün yaratıImışIarı/her türIü yaratmayı çok iyi biImektedir."
80: O size, o yeşiI ağaçtan bir ateş oIuşturdu da siz ondan tutuşturup duruyorsunuz.
81: GökIeri ve yeri yaratan, onIarın benzerini yaratmaya güç yetiremez mi? EIbette güç yetirir. Her şeyi biIen AIîm, sürekIi yaratan HaIIâk O'dur.
82: O birşeyi istediğinde, buyruğu sadece şunu söyIemektir: “OI!" Artık o, oIuverir.
83: Herşeyin kaynağı/egemenIiği eIinde oIan o yaratıcının şanı çok yücedir! Sonunda O'na döndürüIeceksiniz.""",

              style: TextStyle(fontSize: 20),),
            ),)
          ],
        )


        ,
      ),

    );
  }
}
