import 'package:flutter/material.dart';
import 'package:golfep1/widgets/CardMenu.dart';
import 'package:golfep1/widgets/NavDrawer.dart';
 
class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}
 
class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //===========================================================
      // 1) ADD DRAWER
      //===========================================================      
      drawer: NavDrawer(),     
      //===========================================================
      // 2) APP BAR
      //===========================================================        
      appBar: AppBar(title: Text('MAIN MENU'),),
      //===========================================================
      // 3) BODY
      //===========================================================           
      body: CardMenu()
 
    );
  }
}