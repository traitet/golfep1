
//=============================================================================================
// IMPORT 
//=============================================================================================  
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:golfep1/models/ROrderModel.dart';
// import 'package:golfep1/services/LoggerService.dart';

//=============================================================================================
// MAIN CLASS
//=============================================================================================  
class ROrderPage extends StatefulWidget {
  @override
  _ROrderPageState createState() => _ROrderPageState();
}

//=============================================================================================
// STATE CLASS
//=============================================================================================  
class _ROrderPageState extends State<ROrderPage> {
  @override
  Widget build(BuildContext context) {
//=============================================================================================
// SCAFFOLD
//=============================================================================================     
    return Scaffold( appBar: AppBar(
      title: Text('Order Page'),

    
    ),
//=============================================================================================
// BODY -> STEAMBUILDER
//=============================================================================================  
    body: StreamBuilder(
//=============================================================================================
// GET DATA FROM DB (FIREBASE ->SNAPSHOT(TABLE))
//=============================================================================================        
      stream: Firestore.instance.collection('TT_ORDER').snapshots(),
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
            itemBuilder: (context, _index){
//=============================================================================================
// SNAPSHOT (DB) -> MODEL (ข้อมูลเมนูอาหารที่ดึงมาจาก DB)
//============================================================================================= 
              var _model = ROrderModel.fromFilestore(snapshot.data.documents[_index]);
              String _docId = snapshot.data.documents[_index].documentID;
              String _name = _model.name;
              String _description = _model.description;
              String _imageUrl = _model.imageUrl;
              int _qty = _model.qty;
//=============================================================================================
// CREATE CARD 
//=============================================================================================           
              return Card(
                child: Container(child: InkWell(
                  onTap: (){
                  },
                  child: Row(children: <Widget>[
//=============================================================================================
// IMAGE
//=============================================================================================                      
                        Container(
                          padding: EdgeInsets.all(8.0),
                          width: 120,
                          child: Image.network(_imageUrl)),                        
                    Expanded(
                      child: Text((_index+1).toString() + '# ' + _qty.toString() + ' x ' + _name + ' (' + _description + ')')),                  
                    IconButton(icon: Icon(Icons.remove_circle), onPressed: (){Firestore.instance.collection('TT_ORDER').document(_docId).delete();}),
                
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



