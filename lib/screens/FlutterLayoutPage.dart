import 'package:flutter/material.dart';

class FlutterLayoutPage extends StatefulWidget {
  @override
  _FlutterLayoutPageState createState() => _FlutterLayoutPageState();
}

class _FlutterLayoutPageState extends State<FlutterLayoutPage> {
  @override
  Widget build(BuildContext context) {
    Color myColor = Theme.of(context).primaryColor;
    return MaterialApp(
        title: 'Flutter Lay Demo',
        home: Scaffold(
          appBar: AppBar(
            title: Text("Create Doc"),
          ),
          body: ListView(
            children: <Widget>[
              widgetBodyImage,
              widgetBody,
              widgetButtomBar(myColor),
              widgetBodyText,
            ],
          ),
        ));
  }
}

//======================================================
// WIDGET:IMAGE BODY WIDGET
//======================================================
Widget widgetBodyImage = Image.asset('assets/images/bg01.jpg',width: 300, height: 300, fit: BoxFit.cover);

//======================================================
// WIDGET: TITLE SECTION
//======================================================
Widget widgetBody = Container(
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
                    "Oeschinen Lake Camground test",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Text(
                "Kandersteg, Switzerland",
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

//======================================================
// WIDGET: BUILD BUTTOM BAR
//======================================================
Widget widgetButtomBar(Color myColor) {
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        columnButtomButton(Colors.black, Icons.call, 'CALL'),
        columnButtomButton(Colors.black, Icons.near_me, 'ROUTE'),
        columnButtomButton(Colors.black, Icons.share, 'SHARE'),
      ],
    ),
  );
}

//======================================================
// COLUMN: BUILD BUTTON + TEXT (COLUMN)
//======================================================
Column columnButtomButton(Color myColor, IconData myIconData, String myStr) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Icon(myIconData, color: myColor),
      Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            myStr,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: myColor,
            ),
          ))
    ],
  );
}

//======================================================
// WIDGET BODY TEXT
//======================================================

Widget widgetBodyText = Container(
  padding: const EdgeInsets.all(32),
  child: Text(
    'Oeschinen Lake is a lake in the Bernese Oberland, Switzerland, 4 kilometres east of '
    'Kandersteg in the Oeschinen valley. At an elevation of 1,578 metres, it has a surface area of 1.1147 '
    'square kilometres. Its maximum depth is 56 metres. The lake is fed through a series of mountain creeks '
    'and drains underground. Wikipedia ',
    softWrap: true,
  ),
);
