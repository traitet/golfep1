import 'package:flutter/material.dart';
 
class StackPage extends StatefulWidget {
  @override
  _StackPageState createState() => _StackPageState();
}
 
class _StackPageState extends State<StackPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Stack Page - Image / Text'),),
      body:SafeArea(
        //============================================================================
        // STACK ( OR COLUMN, ROW)
        //============================================================================        
        child: Stack(
          children: <Widget>[
        //============================================================================
        // CONTAINER (1) SHOW IMAGE IN CONTAINER (FULL SCREEN)
        //============================================================================              
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    'https://cdn.mos.cms.futurecdn.net/3tcJXLkZ8Sk9cPpLquFTWV.jpg' 
                    // 'https://th.wiktionary.org/wiki/cat#/media/%E0%B9%84%E0%B8%9F%E0%B8%A5%E0%B9%8C:Gatto_europeo4.jpg'                   
                  ),
                  fit: BoxFit.cover,
                )
              ),
              child: null),
        //============================================================================
        // CENTER (2) SHOW TEXT (BUTTOM OM PAGE)
        //============================================================================           
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Text('FINAL FANTASY VII: Add Network Picture By Golf',
                      style: TextStyle(
                        color: Colors.blue,
                        backgroundColor: Colors.white,
                        fontSize: 15,
                      ),
                    )
                  )
                ],
              ),
            )
            //)
          ],
        ),
      )
    );
  }
}