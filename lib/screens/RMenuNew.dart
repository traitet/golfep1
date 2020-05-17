  //========================================================
  // IMPORT
  //========================================================  
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:golfep1/models/RMenuModel.dart';
import 'package:golfep1/services/LoggerService.dart';
import 'package:golfep1/services/ShowNotification.dart';


  //========================================================
  // MAIN CLASS
  //========================================================  
class RMenuNew extends StatefulWidget {
  @override
  _RMenuNewState createState() => _RMenuNewState();
}

  //========================================================
  // STATE CLASS
  //========================================================  
class _RMenuNewState extends State<RMenuNew> {
  //========================================================
  // DECALRE VARIABLE
  //========================================================  
  final _idController = TextEditingController()..text = 'M0001';
  final _nameController = TextEditingController()..text = 'Fried rice';
  final _descriptionController = TextEditingController()..text = 'ข้าวผัด';
  final _imageUrlController = TextEditingController()..text = 'www.imagefoodmenu.com';    
  final _priceController = TextEditingController()..text = '100';
  final _spicyController = TextEditingController()..text = '2';  
  final _ratingController = TextEditingController()..text = '4';    

  //========================================================
  // OVERRIDE (IMPLEMENT UI)
  //========================================================  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register New Menu'),),
      body: ListView(
        children: <Widget>[
          //================================================
          // UI: TEXT
          //================================================  
          TextFormField(decoration: InputDecoration(labelText: 'Menu ID', prefixIcon: Icon(Icons.insert_chart)),controller: _idController,),
          TextFormField(decoration: InputDecoration(labelText: 'Menu Name', prefixIcon: Icon(Icons.insert_chart)),controller: _nameController,),
          TextFormField(decoration: InputDecoration(labelText: 'Menu Description', prefixIcon: Icon(Icons.insert_chart)),controller: _descriptionController,),
          TextFormField(decoration: InputDecoration(labelText: 'Menu Image URL', prefixIcon: Icon(Icons.insert_chart)),controller:_imageUrlController,), 
          TextFormField(decoration: InputDecoration(labelText: 'Price', prefixIcon: Icon(Icons.insert_chart)),controller:_priceController,), 
          TextFormField(decoration: InputDecoration(labelText: 'Spicy', prefixIcon: Icon(Icons.insert_chart)),controller:_spicyController,), 
          TextFormField(decoration: InputDecoration(labelText: 'Rating', prefixIcon: Icon(Icons.insert_chart)),controller:_ratingController,),                               
          //================================================
          // UI: SAVE BUTTON
          //================================================                      
          RaisedButton(onPressed: (){fnSave();}, child: Text('SAVE'),),               
        ],
      ),
    );
  }

  //========================================================
  // SAVE (COLLECTION=TABLE, DOCUMENT=PK)
  //========================================================   
  fnSave() {
  //========================================================
  // PREPARE DATA
  //========================================================       
    RMenuModel myModel = RMenuModel(
      id: _idController.text,
      name: _nameController.text, 
      description: _descriptionController.text, 
      imageUrl: _imageUrlController.text,
      // price: double.parse(_priceController.text),
      // spicy: int.parse(_spicyController.text),
      // rating: int.parse(_ratingController.text)
    );
  //========================================================
  // SHOW LOG
  //========================================================   
    logger.i(myModel.toFileStone());
   //=======================================================
  // SAVE DB TO FIRESTORE
  //========================================================     
    Firestore.instance.collection("TM_REST_MENU").document(_idController.text).setData(myModel.toFileStone())        // SAVE DB
    .then((returnDocuments){        // IF COMPLETE
      logger.i('Insert Complete');  // PRINT LOG
      showMessageBox(context, "Success", _idController.text + " saved completely", actions: [dismissButton(context)]);   //POP UP COMPLETE
    }
    ).catchError((e){               // IF ERROR
        logger.e("Insert Error");   // PRINT LOG
    });
    
  }





}