import 'package:flutter/material.dart';
import 'package:phone_authentication_flutter/components/round_button.dart';
import 'package:phone_authentication_flutter/components/title_text.dart';
import 'package:phone_authentication_flutter/screens/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LogoutPage extends StatefulWidget {
  static const String id = 'logout_page';
  @override
  _LogoutPageState createState() => _LogoutPageState();
}

class _LogoutPageState extends State<LogoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff121212),
      body: SafeArea(
        child: Center(
          child: Flexible(
            child: Column(
              children: <Widget>[
                Flexible(
                  child: Container(
                    margin: EdgeInsets.only(top: 120),
                    child: Image(
                      image: AssetImage('images/worker.png'),
                      height: 246.0,
                      width: 246.0,
                    ),
                  ),
                ),
                TitleText(
                  text: 'Welcome User',
                  color: Color(0xff4AA0F4),
                ),
                RoundButton(
                  text: 'Logout',
                  topMargin: 60,
                  rightMargin: 32,
                  leftMargin: 32,
                  onPressed: () {
                    FirebaseAuth.instance.signOut().then(
                          (value) => {
                            Navigator.pushReplacementNamed(
                              context,
                              HomePage.id,
                            ),
                          },
                        );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
