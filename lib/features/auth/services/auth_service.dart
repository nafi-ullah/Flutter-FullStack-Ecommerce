import 'package:flutter/material.dart';
import 'package:amazon_clone_app/models/user.dart';
import 'package:amazon_clone_app/constants/global_variable.dart';
import 'package:http/http.dart' as http;

class AuthService{
//sign up user
void signUpUser({
    required String email,
    required String password,
    required String name
}) async {
  try{
      User user = User(
        id: '',
        name: '',
        email: '',
        password: '',
        address: '',
        type: '',
        token: ''
      );
      http.Response res=  await http.post(Uri.parse('$uri/api/signup'),
      body: user.toJson(),
      headers: <String, String>{
        'Content-Type' : 'application/json; charset=UTF-8'
      }
      
      );
      print(res.body);

  }catch(e){

  }
}


}