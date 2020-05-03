import 'package:flutter/material.dart';
 
class CardMenu extends StatefulWidget {
  @override
  _CardMenuState createState() => _CardMenuState();
}
 
class _CardMenuState extends State<CardMenu> {
  @override


 
    Widget build(BuildContext context) {
    return Container(
     padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 2.0),
        child: GridView.count(
          crossAxisCount: 2,
          padding: EdgeInsets.all(3.0),
          children: <Widget>[
            makeDashboardItem("Check-in Attendant", Icons.alarm),      
            makeDashboardItem("Enter WFH Task", Icons.calendar_today),
            makeDashboardItem("Reports", Icons.report),
            makeDashboardItem("Setup Manager", Icons.supervised_user_circle),
            makeDashboardItem("Setup Profile", Icons.person),
            makeDashboardItem("Register Form", Icons.bookmark),
            makeDashboardItem("Register Company", Icons.home),              
          ],
        ), 
    );
  }
}
 
//===========================================================
// 5) FUNCTION TO MAKE DASHBOARD
//===========================================================
  Card makeDashboardItem(String title, IconData icon) {
    //=======================================================
    // 1) RETURN CARD
    //=======================================================    
    return Card(
        elevation: 1.0,
        margin: new EdgeInsets.all(8.0),
        //===================================================
        // 2) CHILD: CONTAINER
        //===================================================
        child: Container(
        //=======================================================
        // 3) SIZE
        //=======================================================             
          decoration: BoxDecoration(color: Color.fromRGBO(220, 220, 220, 1.0)),
          child: new InkWell(
            onTap: () {},
            child: Column(
            //=======================================================
            //4) MENU (ICON AND TEXT)
            //=======================================================                 
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              verticalDirection: VerticalDirection.down,
              children: <Widget>[
                SizedBox(height: 50.0),
                //=======================================================
                // 5) ICON
                //=======================================================                 
                Center(
                    child: Icon(
                  icon,
                  size: 40.0,
                  color: Colors.black,
                )),
                SizedBox(height: 20.0),
                //=======================================================
                // 5) TEXT
                //=======================================================                   
                new Center(
                  child: new Text(title,
                      style:
                          new TextStyle(fontSize: 18.0, color: Colors.black)),
                )
              ],
            ),
          ),
        ));
  }