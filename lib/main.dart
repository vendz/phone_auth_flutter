import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:phone_authentication_flutter/screens/home_page.dart';
import 'package:phone_authentication_flutter/screens/otp_page.dart';
import 'package:phone_authentication_flutter/screens/logout_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FirebaseAuth.instance.authStateChanges().listen((User user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is currently signed in!');
      }
    });
    return MaterialApp(
      initialRoute: HomePage.id,
      routes: {
        HomePage.id: (context) => HomePage(),
        OtpPage.id: (context) => OtpPage(),
        LogoutPage.id: (context) => LogoutPage(),
      },
    );
  }
}
