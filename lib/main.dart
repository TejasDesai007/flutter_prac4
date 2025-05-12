import 'package:flutter/material.dart';
import 'welcome.dart';
import 'homeScreen.dart';
import 'registration_form.dart';
import 'company_details.dart';
import 'package:tpo_app/my_details.dart';
import 'user_details.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TPO App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => WelcomeScreen(),
        '/home': (context) => HomeScreen(),
        '/registration': (context) => RegistrationForm(),
        '/company_details': (context) => CompanyDetails(),
        '/my_details': (context) => MyDetails(
            userDetails:
                ModalRoute.of(context)!.settings.arguments as UserDetails),
      },
    );
  }
}
