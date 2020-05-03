import 'package:flutter/material.dart';

class DCreateDocPage extends StatefulWidget {
  DCreateDocPage({Key key}) : super(key: key);

  @override
  _DCreateDocPageState createState() => _DCreateDocPageState();
}

class _DCreateDocPageState extends State<DCreateDocPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Doc"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.camera_alt), onPressed: fnScan)
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 75,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              buildBottomButtonColumn(Icons.home, "Config"),
              buildBottomButtonColumn(Icons.search, "Recall"),
              buildBottomButtonColumn(Icons.send, "Submit"),
            ],
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          BuildDocImage(),
          buildBodyTextDetail,
        ],
      ),
    );
  }
}

void fnScan() {}

Column buildBottomButtonColumn(IconData myIconData, String myLabel) {
  return Column(
    children: <Widget>[
      IconButton(
        iconSize: 30.0,
        //padding: EdgeInsets.only(left: 28.0),
        icon: Icon(myIconData),
        onPressed: () {},
      ),
      Text(
        myLabel,
      )
    ],
  );
}

class BuildDocImage extends StatelessWidget {
  const BuildDocImage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Image.asset('assets/images/bg01.jpg',
          width: 600, height: 400, fit: BoxFit.cover),
    );
  }
}

Widget buildBodyTextDetail = Container(
  child: Padding(
    padding: const EdgeInsets.all(32),
    child: Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Container(
                  child: Text(
                    "E-Document: 5 Mar 2020, 13:30",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Text(
                "Mr. Kandersteg Switzerland",
                style: TextStyle(
                  color: Colors.grey[500],
                ),
              )
            ],
          ),
        ),
        Icon(
          Icons.star,
          color: Colors.red[500],
        ),
        Text("41"),
      ],
    ),
  ),
);
