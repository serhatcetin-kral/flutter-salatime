import 'package:flutter/material.dart';


class Amenerresulu extends StatefulWidget {


  @override
  State<Amenerresulu> createState() => _AmenerresuluState();
}

class _AmenerresuluState extends State<Amenerresulu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[100],
      appBar: AppBar(
        title: Text("Amenerresulu"),
        centerTitle: true,
      ),
      body: Center(
        child: ListView(

          children: [SizedBox(height: 25),

            Container(
              height: 500,

              child: Expanded(

                child: Image.asset(
                  'assets/a.jpg',
                  width: 600.0,
                  height: 240.0,
                   fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 40,),
            Container(
              child: Text(
" Peygamber, Rabb’inden ne indirildi ise ona îman getirdi, mü'minler de, her biri Allah’a ve melâikesine ve kitaplarına ve peygamberlerine: peygamberlerinden hiç birinin arasını ayırmayız diye iman getirdiler ve şöyle dediler: semi'na ve eta'na, gufranını dileriz ya Rabbena! sanadır gidiş. "
    "Allah kimseye vüs'unden öte teklif yapmaz, herkesin kazandığı lehine yüklendiği aleyhinedir, ya Rabbena! eğer unuttuk veya kasdımız bize bizden evvelkilere yüklediğin gibi ağır yük yükleme, ya Rabbena! hem de bize takatımız olmayanı yükletme, ve bizden günahlarımız afiv buyur ve bizlere mağfiretini reva, rahmetini atâ kıl, sensin mevlâmız, bizi mansur buyur artık seni tanımayanlara karşı, kahrolsun kâfirler."
    "",style: TextStyle(fontSize: 20),),
            ),


          ],

        ),
      ),

    );
  }
}