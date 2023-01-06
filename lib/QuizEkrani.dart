import 'dart:collection';

import 'package:bayrak_bilmece_app/Bayraklar.dart';
import 'package:bayrak_bilmece_app/Bayraklardao.dart';
import 'package:bayrak_bilmece_app/SonucEkrani.dart';
import 'package:flutter/material.dart';

class QuizEkrani extends StatefulWidget {
  const QuizEkrani({Key? key}) : super(key: key);

  @override
  State<QuizEkrani> createState() => _QuizEkraniState();
}

class _QuizEkraniState extends State<QuizEkrani> {
  var sorular = <Bayraklar>[];
  var yanlisSecenekler = <Bayraklar>[];
  late Bayraklar dogruSoru;
  var tumSecenekler = HashSet<Bayraklar>();

  int soruSayac = 0;
  int dogruSayac = 0;
  int yanlisSayac = 0;

  String bayrakResimAdi = "placeholder.png";
  String buttonAyazi = "";
  String buttonByazi = "";
  String buttonCyazi = "";
  String buttonDyazi = "";

  initState() {
    super.initState();
    sorulariAl();
  }

  Future<void> sorulariAl() async {
    sorular = await Bayraklardao().rastgeleBayraklariGetir();
    sorulariYukle();
  }

  Future<void> sorulariYukle() async {
    dogruSoru = sorular[soruSayac];
    bayrakResimAdi = dogruSoru.bayrak_resim;
    yanlisSecenekler =
        await Bayraklardao().rastgele3YanlisGetir(dogruSoru.bayrak_id);
    tumSecenekler.clear();
    tumSecenekler.add(dogruSoru);
    tumSecenekler.add(yanlisSecenekler[0]);
    tumSecenekler.add(yanlisSecenekler[1]);
    tumSecenekler.add(yanlisSecenekler[2]);
    buttonAyazi = tumSecenekler.elementAt(0).bayrak_ad;
    buttonByazi = tumSecenekler.elementAt(1).bayrak_ad;
    buttonCyazi = tumSecenekler.elementAt(2).bayrak_ad;
    buttonDyazi = tumSecenekler.elementAt(3).bayrak_ad;
    setState(() {});
  }

  void soruSayaciKontrol() {
    soruSayac++;
    if (soruSayac != 5) {
      sorulariYukle();
    } else {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => SonucEkrani(dogruSayisi: dogruSayac),
          ));
    }
  }

  void dogruKontrol(String buttonYazi) {
    if (dogruSoru.bayrak_ad == buttonYazi) {
      dogruSayac++;
    } else {
      yanlisSayac++;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz Ekranı"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Doğru : ${dogruSayac}", style: TextStyle(fontSize: 18)),
                Text("Yanlış : ${yanlisSayac}", style: TextStyle(fontSize: 18)),
              ],
            ),
            soruSayac != 5
                ? Text("Soru ${soruSayac + 1} ", style: TextStyle(fontSize: 30))
                : Text("Soru 5 ", style: TextStyle(fontSize: 30)),
            Image.asset("resimler/${bayrakResimAdi}"),
            SizedBox(
              width: 250,
              height: 50,
              child: ElevatedButton(
                  onPressed: () {
                    dogruKontrol(buttonAyazi);
                    soruSayaciKontrol();
                  },
                  child: Text(buttonAyazi)),
            ),
            SizedBox(
              width: 250,
              height: 50,
              child: ElevatedButton(
                  onPressed: () {
                    dogruKontrol(buttonByazi);
                    soruSayaciKontrol();
                  },
                  child: Text(buttonByazi)),
            ),
            SizedBox(
              width: 250,
              height: 50,
              child: ElevatedButton(
                  onPressed: () {
                    dogruKontrol(buttonCyazi);
                    soruSayaciKontrol();
                  },
                  child: Text(buttonCyazi)),
            ),
            SizedBox(
              width: 250,
              height: 50,
              child: ElevatedButton(
                  onPressed: () {
                    dogruKontrol(buttonDyazi);
                    soruSayaciKontrol();
                  },
                  child: Text(buttonDyazi)),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
