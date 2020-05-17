
//=============================================================================================
// IMPORT 
//=============================================================================================  
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:golfep1/models/ROrderModel.dart';
import 'package:golfep1/services/LoggerService.dart';
import 'package:golfep1/widgets/BadgeIcon.dart';
import '../models/RMenuModel.dart';
import '../screens/ROrderPage.dart';

//=============================================================================================
// MAIN CLASS
//=============================================================================================  
class RMenuSearchPage extends StatefulWidget {
  @override
  _RMenuSearchPageState createState() => _RMenuSearchPageState();
}

//=============================================================================================
// STATE CLASS
//=============================================================================================  
class _RMenuSearchPageState extends State<RMenuSearchPage> {
//=============================================================================================
// DECLARE VARIABLE
//============================================================================================= 
  int index = 0;
  //int _orderItemCount = 0;  
//=============================================================================================
// BUILD WIDGET
//=============================================================================================   
  @override
  Widget build(BuildContext context) {
//=============================================================================================
// SCAFFOLD
//=============================================================================================     
    return Scaffold( appBar: AppBar(
      title: Text('Search Menu Page - Golf3'),
//=============================================================================================
// ACTION (BUTTON -> ORDER PAGE)
//=============================================================================================      
      actions: <Widget>[
//=============================================================================================
// SHOW ICON
//=============================================================================================         
        IconButton(icon: StreamBuilder(
          initialData: 0,
//=============================================================================================
// GET DATA FROM DB
//=============================================================================================           
          stream: Firestore.instance.collection('TT_ORDER').snapshots(),
          builder: (BuildContext context, AsyncSnapshot _snapshot) => BadgeIcon(icon: Icon(Icons.add_shopping_cart, size: 25,),
//=============================================================================================
// SHOW จำนวน Order Item จาก DB (TT_ORDER)
//=============================================================================================           
          badgeCount: _snapshot.data.documents.length,)
        )
//=============================================================================================
// กดปุ่มแล้วไป Order Page
//=============================================================================================         
        , onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => ROrderPage()),); })
      ],
    ),
//=============================================================================================
// BODY -> STEAMBUILDER
//=============================================================================================  
    body: StreamBuilder(
//=============================================================================================
// GET DATA FROM DB (FIREBASE ->SNAPSHOT(TABLE))
//=============================================================================================        
      stream: Firestore.instance.collection('TM_REST_MENU').snapshots(),
//=============================================================================================
// BUILDER
//=============================================================================================        
        builder: (context, snapshot){
          if(!snapshot.hasData){
              return Center(child: CircularProgressIndicator());
          } //IF
          else{
//=============================================================================================
// ITEM BUILDER / LISTVIEW
//=============================================================================================          
          return ListView.builder(
            itemCount: snapshot.data.documents.length, //จำนวนที่แสดง            
            itemBuilder: (context, index){
//=============================================================================================
// SNAPSHOT (DB) -> MODEL (ข้อมูลเมนูอาหารที่ดึงมาจาก DB)
//============================================================================================= 
              var _model = RMenuModel.fromFilestore(snapshot.data.documents[index]);
              String _docId = snapshot.data.documents[index].documentID;
              String _name = _model.name;
              String _description = _model.description;
              String _imageUrl = _model.imageUrl;
//=============================================================================================
// CREATE CARD 
//=============================================================================================           
              return Card(
                child: Container(child: InkWell(
                  onTap: (){
                  },
                  child: Row(children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      height: 150, width: 120,
                      child: Image.network(_imageUrl)),                       
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(_docId),
                            Text(_name),     
                            Text(_description),                          
                          ],
                        ),
                      ),
                    ),
  
        
//=============================================================================================
// BUTTON FOR SAVE ORDER 
//=============================================================================================                      
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(onPressed: (){
//=============================================================================================
//  PREPARE MODEL (ORDER): เตรียมข้อมูล order
//=============================================================================================                         
                       ROrderModel myModel = ROrderModel(id: 'ORD001',name: _name,description: _description, customer: 'ABC', qty: 1,table: 'T0001', menuId: _docId, imageUrl: _imageUrl);
//=============================================================================================
//  PRINT LOG
//=============================================================================================                        
                       logger.i(myModel.toFileStone());
//=============================================================================================
//  TIME STAMP
//=============================================================================================                       
                       String _timestampstr = DateTime.now().millisecondsSinceEpoch.toString();  
//=============================================================================================
//  SAVE TO DB
//=============================================================================================                       
                       Firestore.instance.collection('TT_ORDER').document(_timestampstr).setData(myModel.toFileStone());
//=============================================================================================
//  *** จะทำตรงนี้เมื่อ save ข้อมูลลง DB เรียบร้อยแล้ว (Asyn) *** และจะ Reload หน้า UI ใหม่ ***
//=============================================================================================                       
                       setState(() {
                         logger.i('Insert Order Completed');
                       });
                      }, child: Text('Order'),),
                    ),                                                                            
                  ],),
                )),
              );
            },//ITEM BUILDER
          );
        } //ELSE
      }, // BUILDER
    ),    
  );
  } //WIDGET
} //CLASS



