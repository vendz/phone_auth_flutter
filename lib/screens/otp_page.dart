import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:phone_authentication_flutter/components/title_text.dart';
import 'package:phone_authentication_flutter/components/number_input_field.dart';
import 'package:phone_authentication_flutter/components/round_button.dart';
import 'package:phone_authentication_flutter/screens/home_page.dart';
import 'package:phone_authentication_flutter/screens/logout_page.dart';

class OtpPage extends StatefulWidget {
  static const String id = 'otp_page';

  final String number, verId;
  OtpPage({this.number, this.verId});

  @override
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  String _otp;
  TextEditingController optController = TextEditingController();

  Future<void> phoneCredential(BuildContext context, String otp) async {
    FirebaseAuth _auth = FirebaseAuth.instance;

    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: widget.verId, smsCode: otp);
      final User user = (await _auth.signInWithCredential(credential)).user;

      if (user != null) {
        Navigator.pushReplacementNamed(context, LogoutPage.id);
      } else {
        print('login failed');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff121212),
      body: SafeArea(
        child: WillPopScope(
          onWillPop: () async => false,
          child: Center(
            child: Column(
              children: <Widget>[
                Flexible(
                  child: Container(
                    margin: EdgeInsets.only(top: 60),
                    child: Image(
                      image: AssetImage('images/otp_screen_image.png'),
                      height: 200.0,
                      width: 300.0,
                    ),
                  ),
                ),
                TitleText(
                  text: 'Enter OTP',
                ),
                Container(
                  margin: EdgeInsets.only(top: 32, right: 32, left: 32),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: 'We have sent a 6-digit code to',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontFamily: 'Open Sans SemiBold',
                            color: Color(0xffb2b2b2),
                          ),
                          children: [
                            TextSpan(
                              text: '\n ${widget.number}',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontFamily: 'Open Sans Bold',
                                color: Color(0xffb2b2b2),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      IconButton(
                        icon: Icon(Icons.edit, color: Colors.white),
                        onPressed: () {
                          Navigator.pushNamed(context, HomePage.id);
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 32, right: 32, left: 32),
                  child: NumberInput(
                    controller: optController,
                    hintText: 'Enter OTP',
                    onChanged: (value) {
                      _otp = value;
                      print(_otp);
                    },
                  ),
                ),
                Flexible(
                  child: RoundButton(
                    text: 'verify OTP',
                    leftMargin: 32.0,
                    rightMargin: 32.0,
                    topMargin: 32.0,
                    onPressed: () {
                      phoneCredential(context, _otp);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
