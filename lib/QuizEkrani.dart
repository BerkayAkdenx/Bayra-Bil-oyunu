import 'package:bayrak_bilmece_app/SonucEkrani.dart';
import 'package:flutter/material.dart';

class QuizEkrani extends StatefulWidget {
  const QuizEkrani({Key? key}) : super(key: key);

  @override
  State<QuizEkrani> createState() => _QuizEkraniState();
}

class _QuizEkraniState extends State<QuizEkrani> {
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
              children: const [
                Text("Doğru : 1", style: TextStyle(fontSize: 18)),
                Text("Yanlış : 1", style: TextStyle(fontSize: 18)),
              ],
            ),
            Text("Soru 1 ", style: TextStyle(fontSize: 30)),
            Image.asset("resimler/turkiye.png"),
            SizedBox(
              width: 250,
              height: 50,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SonucEkrani(dogruSayisi: 3),
                        ));
                  },
                  child: Text("Button A")),
            ),
            SizedBox(
              width: 250,
              height: 50,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SonucEkrani(dogruSayisi: 3),
                        ));
                  },
                  child: Text("Button B")),
            ),
            SizedBox(
              width: 250,
              height: 50,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SonucEkrani(dogruSayisi: 4),
                        ));
                  },
                  child: Text("Button C")),
            ),
            SizedBox(
              width: 250,
              height: 50,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SonucEkrani(dogruSayisi: 3),
                        ));
                  },
                  child: Text("Button D")),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
