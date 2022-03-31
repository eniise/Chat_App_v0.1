import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Chat App Interface",
      home: Iskele(),
    );
  }
}

class Iskele extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat App Interface"),
      ),
      body: AnaEkran(),
    );
  }
}

//AnaEkran widget’ını stateful olarak oluşturuyoruz.
class AnaEkran extends StatefulWidget {
  @override
  _AnaEkranState createState() => _AnaEkranState();
}

class _AnaEkranState extends State<AnaEkran> {
  TextEditingController t1 = TextEditingController();
  List<MesajBalonu> mesajListesi = [];

  listeyeEkle(String gonderilenMesaj) {
    setState(() {
      MesajBalonu mesajlar = MesajBalonu(mesaj: gonderilenMesaj);
      mesajListesi.insert(0, mesajlar);
      t1.clear();
    });
  }

  Widget metinGirisAlani() {
    return Container(
      margin: EdgeInsets.all(10),
      child: Row(
        children: <Widget>[
          Flexible(
            child: TextField(
              controller: t1,
            ),
          ),
          IconButton(
              icon: Icon(Icons.send), onPressed: () => listeyeEkle(t1.text)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              reverse: true,
              itemCount: mesajListesi.length,
              itemBuilder: (_, int indeksNumarasi) =>
              mesajListesi[indeksNumarasi],
            ),
          ),
          metinGirisAlani(),
        ],
      ),
    );
  }
}

String isim = "Kullanıcı1";

class MesajBalonu extends StatelessWidget {
  String mesaj;
  MesajBalonu({required this.mesaj});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            child: Text(isim[0]),
          ),
          Column(
            children: <Widget>[
              Text(isim),
              Container(
                child: Text(mesaj),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
