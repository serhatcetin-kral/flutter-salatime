import 'package:flutter/material.dart';
import 'package:most_reading_duas/dualar/ayetelkursi.dart';
import 'package:most_reading_duas/dualar/home.dart';
import 'package:most_reading_duas/dualar/yasin.dart';
import 'package:most_reading_duas/dualar/fetih.dart';
import 'package:most_reading_duas/dualar/nazar.dart';
import 'package:most_reading_duas/dualar/tefriciye.dart';
import 'package:most_reading_duas/dualar/Amenerresulu.dart';
import 'package:most_reading_duas/dualar/HacetDuasi.dart';
import 'dualar/huvallahullezi.dart';
import 'package:most_reading_duas/dualar/SabahDualari.dart';
import 'package:most_reading_duas/dualar/AksamDualari.dart';
void main() {
  runApp(MaterialApp(

    debugShowCheckedModeBanner: false,

    initialRoute: "/home",
    routes: {

      "/home":(constext)=>Home(),
      "/ayetelkursi":(context)=>Ayetelkursi(),
      "/yasin":(context)=>Yasin(),
      "/fetih":(context)=>Fetih(),
      "/nazar":(context)=>Nazar(),
      "/tefriciye":(context)=>Tefriciye(),
      "/amenerresulu":(context)=>Amenerresulu(),
      "/huvallahullezi":(context)=>Huvallahullezi(),
      "/HacetDuasi":(context)=>HacetDuasi(),
      "/SabahAksamDualari":(context)=>SabahAksamDualari(),
      "/AksamDualari":(context)=>AksamDualari(),
    },

  ));
}