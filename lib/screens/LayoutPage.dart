import 'package:flutter/material.dart';
 
class LayoutPage extends StatefulWidget {
  @override
  _LayoutPageState createState() => _LayoutPageState();
}
 
class _LayoutPageState extends State<LayoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(title: Text('Layout Page')),
      body: 
        SafeArea(child: ListView(
          children: <Widget> [
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                Expanded(child: Container(height: 50, color: Colors.red,)),
                Expanded(child: Container(height: 50, color: Colors.green,)),                
                // Text('row 1'),
                // Text('row 2'),
                // Text('row 3'),                                
              ]
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                Expanded(child: Text('row# 1.23456789{Golf}',),),
                Expanded(child: Text('row# 2.3456789(golf)'),),  
                Expanded(child: Text('row# 3.456789<GolF>'),),                                                            
              ]
            ),   
 
        
                                   
            SizedBox(height: 20),            
            Column(
              //mainAxisAlignment: MainAxisAlignment.center,              
              children: <Widget>[
                Text('Column 1'),
                Text('Column 2'),
                Text('Column 3'),                
              ]
            ),

            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                Expanded(child: Container(height: 50, color: Colors.blue,)),
                Expanded(child: Container(height: 50, color: Colors.orange,)),  
                Expanded(child: Container(height: 50, color: Colors.pink,)),  
                Expanded(child: Container(height: 50, color: Colors.yellow,)), 
                Expanded(child: Container(height: 50, color: Colors.purple,)),           
                // Text('row 1'),
                // Text('row 2'),
                // Text('row 3'),                                
              ]
            ),

          ]
        ))
 
     
    );
  }
}