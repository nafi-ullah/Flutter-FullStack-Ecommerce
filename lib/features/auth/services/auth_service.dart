import 'dart:convert';

import 'package:amazon_clone_app/common/widgets/bottom_bar.dart';
import 'package:amazon_clone_app/constants/error_handling.dart';
import 'package:amazon_clone_app/constants/utils.dart';
import 'package:amazon_clone_app/features/home/screens/home_screen.dart';
import 'package:amazon_clone_app/provicder/user_provider.dart';
import 'package:amazon_clone_app/router.dart';
import 'package:flutter/material.dart';
import 'package:amazon_clone_app/models/user.dart';
import 'package:amazon_clone_app/constants/global_variable.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService{
//sign up user
void signUpUser({
    required BuildContext context,
    required String email,
    required String password,
    required String name
}) async {
  try{
      User user = User(
        id: '',
        name: name,
        email: email,
        password: password,
        address: '',
        type: '',
        token: ''
      );

      http.Response res=  await http.post(Uri.parse('$uri/api/signup'),
      body: user.toJson(),
      headers: <String, String>{
        'Content-Type' : 'application/json; charset=UTF-8',
         "Access-Control-Allow-Origin": "*", // Required for CORS support to work
  "Access-Control-Allow-Credentials": "true", // Required for cookies, authorization headers with HTTPS
  "Access-Control-Allow-Headers": "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
  "Access-Control-Allow-Methods": "POST, OPTIONS"
      }
      );
      print(res.body);
     
     

      httpErrorHandle(
        response: res, 
        context: context,
         onSuccess: (){
          showSnackBar(context, 'Account create! Log in with same email and password');
         }
         );
         
      
  }catch(e){
    print(e.toString());
        showSnackBar(context, e.toString());
  }
}
// sign in user
void signInUser({
    required BuildContext context,
    required String email,
    required String password,
}) async {
  try{
      
      http.Response res=  await http.post(Uri.parse('$uri/api/signin'),
      body: jsonEncode({
        'email': email,
        'password': password
      }),
      headers: <String, String>{
        "Access-Control-Allow-Origin": "*",
        'Content-Type' : 'application/json; charset=UTF-8',
        'Accept': '*/*'
      }
      );
     
     
//      print(res.body);
      httpErrorHandle(
        response: res, 
        context: context,
         onSuccess: () async {
          
            // log in er por token store kore rakhbo jeno barbar log in krte na hoy

          SharedPreferences prefs = await SharedPreferences.getInstance();
          
          Provider.of<UserProvider>(context, listen: false).setUser(res.body);
          await prefs.setString('x-auth-token', jsonDecode(res.body)['token']); //shared preference a jst token ta thakbe
          Navigator.pushAndRemoveUntil(
            context, 
            generateRoute(RouteSettings(name: BottomBar.routeName)),
            //MaterialPageRoute(builder: (context) => HomeScreen()), same as above
            (route) => false)
            ;
         }
         );   
  }catch(e){
    print(e.toString());
        showSnackBar(context, e.toString());
  }
}

// Get user data , the user data wont reveal untill token verification
void getUserData({
    required BuildContext context,
}) async {
  try{
      
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');

      if(token == null){
        prefs.setString( 'x-auth-token','');
      }
     // token jeta pabo seta valid ki na, ber korte hobe. 
     var tokenRes =  await http.post(
      Uri.parse('$uri/tokenIsValid'),
      headers: <String, String> {
        'Content-Type' : 'application/json; charset=UTF-8',
        'x-auth-token': token!
      }
     
     );

     var  response = jsonDecode(tokenRes.body);

     if(response == true){
        // get user data
        http.Response userRes = await http.get(
          Uri.parse('$uri/'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': token,
          }
        );
     

      var userProvider = Provider.of<UserProvider>(context, listen: false);
      userProvider.setUser(userRes.body);
      
     }
  }catch(e){
  
        showSnackBar(context, e.toString());
  }
}

}