//========================================================
// IMPORT
// REF: NAV BAR: https://www.androidthai.in.th/android-flutter/389-bottom-navigation-bar-on-flutter.html
//========================================================  
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:golfep1/screens/RMenuView.dart';

//========================================================
// MAIN CLASS
//========================================================  
class RMenuSearch extends StatefulWidget {
  @override
  _RMenuSearchState createState() => _RMenuSearchState();
}

//========================================================
// STATE CLASS
//========================================================  
class _RMenuSearchState extends State<RMenuSearch> {
  int index = 0;
  
  @override
  void initState() {
    super.initState();
  }

  //========================================================
  // BUILD UI
  //======================================================== 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu Search'),
        actions: <Widget>[IconButton(icon: Icon(Icons.shopping_basket), onPressed: null),],
      ),
      bottomNavigationBar: myBottomNavBar(),
      body: StreamBuilder(
         stream: Firestore.instance.collection("TM_REST_MENU").snapshots(),
         builder:(context, snapshot) {
           if (!snapshot.hasData){return Center(child: Column(children: <Widget>[CircularProgressIndicator(),Text('Loading...') ],),);}
           else
           {
                return ListView.builder(
                //============================================================================
                // 1) DECLARE VARIABLE
                //============================================================================                 
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index)
                 {
                    //========================================================================
                    // GET DATA FROM DB
                    //========================================================================      
                    String _docId = snapshot.data.documents[index].documentID; 
                    // String _id =  snapshot.data.documents[index].data["id"];
                    String _name =  snapshot.data.documents[index].data["name"];  
                    String _description =  snapshot.data.documents[index].data["description"];  
                    double _price =  snapshot.data.documents[index].data["price"]??100;     
                    String _imageUrl =  snapshot.data.documents[index].data["imageUrl"]??'';                                                                                 
                return Padding(padding: const EdgeInsets.all(8.0),
                  child: Card(  
                    child: Container(                   
                      child: InkWell(
                        onTap: () {Navigator.push(context,MaterialPageRoute(builder: (context) => RMenuViewPage(menuId: snapshot.data.documents[index].documentID,)));},                   
                        child: Column(
                          children: <Widget>[  
                            
                            widgetBodyText(_docId,_name,_description,_price,_imageUrl),        
                                      
                          ],
                        ),
                      ),
                    ),
                  ));
                }, //return#1
              );
           }
         }
      )
    );
  }



  //======================================================
  // WIDGET: BODY TEXT
  //======================================================
  Widget widgetBodyText(String myMenuId,String myName, String myDescription, double myPrice, String imageUrl)  { 
  return 
    Container(
      child: Padding(padding: const EdgeInsets.all(8),
        child: Row(children: [

                imageUrl == '' ? Container(width: 100, decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(imageUrl),fit: BoxFit.cover,)),child: null)
                : Padding(padding: const EdgeInsets.all(8.0),child: Container(width: 100,child: Image.asset('assets/images/bg01.jpg'),),
                ),
                Expanded(child: 
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(padding: const EdgeInsets.only(bottom: 2), child: Container(child: Text(myMenuId,style: TextStyle(fontWeight: FontWeight.bold,),),),),                      
                      Padding(padding: const EdgeInsets.only(bottom: 2), child: Container(child: Text(myName,style: TextStyle(fontWeight: FontWeight.bold,),),),),
                      //Text(myName,style: TextStyle(color: Colors.grey[500],),),
                      Padding(padding: const EdgeInsets.only(bottom: 2), child: Container(child: Text(myDescription,style: TextStyle(fontWeight: FontWeight.normal,),),),),                      
                      Padding(padding: const EdgeInsets.only(bottom: 2), child: Container(child: Text('Price ' + myPrice.toString()+' BHT',style: TextStyle(fontWeight: FontWeight.normal,),),),),     
                      //Icon(Icons.star,color: Colors.red[500],),
                    ],
                  ), 
                ),
                Column(children: <Widget>[
                  //Icon(Icons.star,color: Colors.red[500],),
                  RaisedButton(onPressed: (){},child: Text('Order Now'),color: Colors.orange,),
                ],)

          ],
        ),
      ),
    );
  } //widget

  //======================================================
  // BOTTOM NAV BAR
  //======================================================
  Widget myBottomNavBar(){
    return BottomNavigationBar(
         backgroundColor: Colors.black,
          selectedItemColor: Colors.orange,
          unselectedItemColor: Colors.grey,
          onTap:(int i){
          setState((){
            index=i;
          });}, currentIndex: index,
          items: <BottomNavigationBarItem> [homeNav(),menuNav(),orderNav(),moreNav()],
    );
  }

  //======================================================
  // BOTTOM NAV BAR (ITEM)
  //======================================================
  BottomNavigationBarItem homeNav() => BottomNavigationBarItem(icon: Icon(Icons.home), title:  Text('Home'), );
  BottomNavigationBarItem menuNav() => BottomNavigationBarItem(icon: Icon(Icons.add_shopping_cart), title:  Text('Menu'), );  
  BottomNavigationBarItem orderNav() => BottomNavigationBarItem(icon: Icon(Icons.shopping_basket), title:  Text('Order'));
  BottomNavigationBarItem moreNav() => BottomNavigationBarItem(icon: Icon(Icons.menu), title:  Text('More'));


}// CLASS





