import 'package:flutter/material.dart';

class SonucEkrani extends StatefulWidget {
  late int dogruSayisi;

  SonucEkrani({required this.dogruSayisi});

  @override
  State<SonucEkrani> createState() => _SonucEkraniState();
}

class _SonucEkraniState extends State<SonucEkrani> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sonuc Ekrani"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              children: [
                Text("Doğru : ${widget.dogruSayisi}",
                    style: TextStyle(fontSize: 30)),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text("Yanlış :  ${5 - widget.dogruSayisi}",
                      style: TextStyle(fontSize: 30)),
                ),
              ],
            ),
            Text("Başarı Oranı : ${widget.dogruSayisi * 100 ~/ 5}",
                style: TextStyle(fontSize: 30, color: Colors.pink)),
            SizedBox(
              width: 250,
              height: 50,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("TEKRAR DENE")),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
