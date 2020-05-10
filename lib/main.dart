import 'package:flutter/material.dart';
import 'package:golfep1/screens/Ep2Page.dart';
import 'package:golfep1/screens/RMenuCatNew.dart';
import 'package:golfep1/screens/RMenuNew.dart';
import 'package:golfep1/screens/SignupPage.dart';
import 'package:golfep1/screens/FlutterLayoutPage.dart';
import 'package:golfep1/screens/DCreateDocPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page By VS Code'),
    );
  }
}
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  void _incrementCounter() {
    setState(() {
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // RaisedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => MenuPage()),);}, child: Text('Menu Page'),color: Colors.purple,),  
            // RaisedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => LayoutPage()),);}, child: Text('Layout Page'),color: Colors.red,),  
            // RaisedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => StackPage()),);}, child: Text('Stack Page'),color: Colors.yellow,),  
            // RaisedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPage()),);}, child: Text('Search Page'),color: Colors.green,),  
            RaisedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => SignupPage()),);}, child: Text('Signup Page'),color: Colors.blue[50],),  
            RaisedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => Ep2Page()),);}, child: Text('EP2 Page'),color: Colors.blue[50],),  
            RaisedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => FlutterLayoutPage()),);}, child: Text('Flutter Layout Tutorial Page'),color: Colors.blue[50],),  
            RaisedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => DCreateDocPage()),);}, child: Text('D Create Doc Page'),), 
            RaisedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => RMenuCatNew()),);}, child: Text('Rest: Create Food Menu Category'),),      
            RaisedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => RMenuNew()),);}, child: Text('Rest: Create Food Menu'),),                      
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), 
    );
  }
}
