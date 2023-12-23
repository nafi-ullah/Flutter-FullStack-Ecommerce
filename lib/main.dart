import 'package:amazon_clone_app/common/widgets/bottom_bar.dart';
import 'package:amazon_clone_app/constants/global_variable.dart';
import 'package:amazon_clone_app/features/auth/screens/auth_screen.dart';
import 'package:amazon_clone_app/features/auth/services/auth_service.dart';
import 'package:amazon_clone_app/features/home/screens/home_screen.dart';
import 'package:amazon_clone_app/provicder/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:amazon_clone_app/router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
      ChangeNotifierProvider(create: (context)=> UserProvider())
  ],
  child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authService.getUserData(context: context);
  }
  

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
      home: Provider.of<UserProvider>(context).user.token.isNotEmpty 
      ? const BottomBar() : 
      const AuthScreen()
    );
  }
}


