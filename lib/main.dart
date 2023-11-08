import 'package:amazon_clone_app/constants/global_variable.dart';
import 'package:amazon_clone_app/features/auth/screens/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:amazon_clone_app/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amazon Clone',
      theme: ThemeData(
        scaffoldBackgroundColor: GlobalVariable.backgroundColor,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black)
        ),
        colorScheme: const ColorScheme.light(
          primary: GlobalVariable.secondaryColor,

        ),
        useMaterial3: true,
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Amazon"),
          backgroundColor: Colors.lightBlue,
          ),
        body:  Center(
          child: Column(
            children: [
               const Text(
                'Flutter Demo Home Page'),
                Builder(
                  builder: (context) {
                    return ElevatedButton(onPressed: (){

                      Navigator.pushNamed(context, AuthScreen.routeName);
                    }, child: const Text("data"));
                  }
                ),
            ],
          ),
        )
          ),
    );
  }
}


