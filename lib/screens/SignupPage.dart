import 'package:flutter/material.dart';
import 'package:golfep1/services/LoggerService.dart';
import 'package:golfep1/services/ShowNotification.dart';
import 'package:golfep1/services/SingupUser.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

   //======================================================================
      // DECLARE TEXT EDIT CONTROLLER
      //====================================================================== 
      final _usernameController = TextEditingController();
      final _passwordController = TextEditingController();
      final _fullnameController = TextEditingController();  
      final _lineidController = TextEditingController();    
      final _mobilenoController = TextEditingController();  
      final _companyController = TextEditingController(); 


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Signup Page"),),

      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(height: 40.0,),  
            TextFormField(decoration: InputDecoration(labelText: '*E-mail', prefixIcon: Icon(Icons.email)),controller: _usernameController),
            TextFormField(decoration: InputDecoration(labelText: '*Full Name', prefixIcon: Icon(Icons.near_me)),controller: _fullnameController,),
            TextFormField(decoration: InputDecoration(labelText: '*Password', prefixIcon: Icon(Icons.vpn_key)),controller: _passwordController),                         
            TextFormField(decoration: InputDecoration(labelText: 'Line ID', prefixIcon: Icon(Icons.network_cell)),controller: _lineidController),
            TextFormField(decoration: InputDecoration(labelText: 'Mobile No', prefixIcon: Icon(Icons.phone)),controller: _mobilenoController,keyboardType: TextInputType.number,),                                    
            TextFormField(decoration: InputDecoration(labelText: 'Company', prefixIcon: Icon(Icons.home)),controller: _companyController,),  
            RaisedButton(onPressed: (){
              
              
              
            //========================================================================
            // 3) PRINT LOG
            //======================================================================== 
            logger.i("E-mail" + _usernameController.text);
            logger.i("password " + _passwordController.text);
            //========================================================================
            // 4) VALIDATE
            //========================================================================             
            if (_usernameController.text == "" || _passwordController.text ==""){
              showMessageBox(context, "Error", "Please enter username or password", actions: [dismissButton(context)]);
              logger.e("Username or password cannot be null");              
            } // IF
            //========================================================================
            // 5) SIGNUP USER
            //========================================================================             
            else {
              //signupUser(context, {"username": _usernameController.text,"password": _passwordController.text, "fullname":_fullnameController.text}, _usernameController.text);
              signupUser(context, {"username": _usernameController.text, "password": _passwordController.text,"fullname": _fullnameController.text,"lineid": _lineidController.text ,"mobileno": _mobilenoController.text ,"company": _companyController.text},_usernameController.text);              
            }  



            }, child: Text('SAVE'),),                               
          ],
        )
      ),

      
    );
  }
}