import 'package:amazon_clone_app/common/widgets/custom_button.dart';
import 'package:amazon_clone_app/common/widgets/custom_textfield.dart';
import 'package:amazon_clone_app/constants/global_variable.dart';
import 'package:amazon_clone_app/features/auth/services/auth_service.dart';
import 'package:flutter/material.dart';

enum Auth{
  signin,
  signup,
}

class AuthScreen extends StatefulWidget {
  
  static const String routeName = '/auth-screen';
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}
/*
Form thakbe ==> text controller and global key(need for form button).
# textcontroller gula dispose korte hoy

 */

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signup; // enum er maddhobe 0,1 type flag or string check lage na.
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final AuthService authService = AuthService();


    @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  void signUpUser(){
   
        authService.signUpUser(context: context, // stateful widget a thakay auto setar context dhore nise
      email: _emailController.text, 
      password: _passwordController.text,
       name: _nameController.text);
      
  }

  void signInUser(){
    
        authService.signInUser(context: context, 
      email: _emailController.text, 
      password: _passwordController.text,
      ); 
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: GlobalVariable.greyBackgroundCOlor,
        body:SafeArea(  // uporer charge , time percenage bartar nicher area te thakbe.
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
               const Text("Welcome",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500
                ),
                
                ),
                ListTile(
                  tileColor: _auth == Auth.signup ? GlobalVariable.backgroundColor : GlobalVariable.greyBackgroundCOlor,
                  title:  const Text("Create Account", 
                  style: TextStyle(
                    fontWeight: FontWeight.bold
                  )
                  ),
                leading: Radio(
                  activeColor: GlobalVariable.secondaryColor,
                  value: Auth.signup,
                 groupValue: _auth, 
                 onChanged: (Auth? val){
                      setState(() {
                        _auth = val! ;
                      });

                 }),

                ),
                if(_auth == Auth.signup)
                Container(
                  padding: const EdgeInsets.all(8.0),
                  color: GlobalVariable.backgroundColor,
                  child: Form(
                    key: _signUpFormKey,
                    child: Column(
                      children: [
                        CustomTextField(controller: _nameController,
                        hintText: "Name",
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        CustomTextField(controller: _emailController,
                        hintText: "Email",
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        CustomTextField(controller: _passwordController,
                        hintText: "Password",
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        CustomButton(text: "Sign Up", onTap: (){
                            if(_signUpFormKey.currentState!.validate()){ // mane uporer text field gula jodi valid hoy taile validate() function positive feedback dibe
                            signUpUser();
                            }                    
                        })
                      ],
                    ),
                
                    ),
                ),

                ListTile(
                   tileColor: _auth == Auth.signin ? GlobalVariable.backgroundColor : GlobalVariable.greyBackgroundCOlor,
                  title:  const Text("Sign in", 
                  style: TextStyle(
                    fontWeight: FontWeight.bold
                  )
                  ),
                leading: Radio(
                  activeColor: GlobalVariable.secondaryColor,
                  value: Auth.signin,
                 groupValue: _auth, 
                 onChanged: (Auth? val){
                      setState(() {
                        _auth = val! ;
                      });

                 }),

                ),

                if(_auth == Auth.signin)
                Container(
                  padding: const EdgeInsets.all(8.0),
                  color: GlobalVariable.backgroundColor,
                  child: Form(
                    key: _signInFormKey,
                    child: Column(
                      children: [
                        
                        CustomTextField(controller: _emailController,
                        hintText: "Email",
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        CustomTextField(controller: _passwordController,
                        hintText: "Password",
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        CustomButton(text: "Sign In", onTap: (){

                          if(_signInFormKey.currentState!.validate()){
                              
                            signInUser();
                            }
                        })
                      ],
                    ),
                
                    ),
                ),

              ]),
          ) ,
          )

    );
  }
}