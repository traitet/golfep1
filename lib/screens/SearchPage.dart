import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Search Page"),),
      body:SafeArea(
        // child: ListView(
        //============================================================================
        // STACK ( OR COLUMN, ROW)
        //============================================================================
        child: Stack(
          children: <Widget> [
        //============================================================================
        // CONTAINER (1) SHOW IMAGE IN CONTAINER (FULL SCREEN)
        //============================================================================              
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    //'https://cdn.mos.cms.futurecdn.net/3tcJXLkZ8Sk9cPpLquFTWV.jpg' 
                    //'https://th.wiktionary.org/wiki/cat#/media/%E0%B9%84%E0%B8%9F%E0%B8%A5%E0%B9%8C:Gatto_europeo4.jpg'
                    'https://www.dimaak.com/blog/wp-content/uploads/2019/06/temples-to-visit-in-Bangkok.jpg'            
                  ),
                  fit: BoxFit.cover,
                )
              ),
              child: null),

            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget> [
                Expanded(child: Container(height: 50, color: Colors.red,)),
                Expanded(child: Container(height: 50, color: Colors.yellow,)), 
                Expanded(child: Container(height: 50, color: Colors.pink,)),
                Expanded(child: Container(height: 50, color: Colors.green,)),
                Expanded(child: Container(height: 50, color: Colors.orange,)),
                Expanded(child: Container(height: 50, color: Colors.blue,)),
                Expanded(child: Container(height: 50, color: Colors.purple,)),
                Expanded(child: Container(height: 50, color: Colors.black,)),
                Expanded(child: Container(height: 50, color: Colors.white,)),
                Expanded(child: Container(height: 50, color: Colors.brown,)),                
                // Text('row 1'),
                // Text('row 2'),
                // Text('row 3'),
              ]
            ),
          
            ],
        ),)
    );
  }
}
