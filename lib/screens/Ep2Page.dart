import 'package:flutter/material.dart';

class Ep2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "TEST",
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("EP2"),
      ),
      body: ListView(
        children: <Widget>[
          MyWidget("Star World", "Hello world",
              "https://www.starwards.org.uk/wp-content/uploads/2017/05/starwards_logo_print.jpg"),
          MyWidget("Titanic", "Mark ZK",
              "https://thewdwplanner.com/wp-content/uploads/2017/01/Starwards-Day-At-Sea.png"),
          MyWidget("Stepup", "Steve Jobs",
              "https://m.media-amazon.com/images/I/61cwJtk2bIL._SS500_.jpg"),
        ],
      ),
    );
  }
}

// Shift + Alt + f
class MyWidget extends StatelessWidget {
  final String _text1;
  final String _text2;
  final String _imageUrl;
  const MyWidget(
    this._text1,
    this._text2,
    this._imageUrl, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  image: DecorationImage(image: NetworkImage(_imageUrl))),
            ),
          ),
          Text(
            _text1,
            style: TextStyle(fontSize: 20, fontStyle: FontStyle.normal),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment(1, 0),
              child: Text(
                _text2,
                style: TextStyle(fontSize: 15, fontStyle: FontStyle.italic),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
