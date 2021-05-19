import 'package:flutter/material.dart';
import 'package:phone_authentication_flutter/auth.dart';
import 'package:phone_authentication_flutter/components/number_input_field.dart';
import 'package:phone_authentication_flutter/components/round_button.dart';
import 'package:phone_authentication_flutter/components/title_text.dart';
import 'package:phone_authentication_flutter/components/description_text.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class HomePage extends StatefulWidget {
  static const String id = 'home_page';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PhoneAuthService _service = PhoneAuthService();

  String countryCode;
  String phoneNumber;
  bool _showProgress = false;
  final phoneController = TextEditingController();
  final codeController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    setState(() {
      _showProgress = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff121212),
      body: SafeArea(
        child: ModalProgressHUD(
          inAsyncCall: _showProgress,
          child: Center(
            child: Column(
              children: <Widget>[
                Flexible(
                  child: Container(
                    margin: EdgeInsets.only(top: 60),
                    child: Image(
                      image: AssetImage('images/login_screen_image.png'),
                      height: 200.0,
                      width: 300.0,
                    ),
                  ),
                ),
                TitleText(
                  text: 'Verify Your Number',
                ),
                DescriptionText(
                  text:
                      'Please enter your Country Code and \n Phone Number for verification',
                ),
                Flexible(
                  child: Container(
                    margin: EdgeInsets.only(top: 32, right: 32, left: 32),
                    child: Row(
                      children: <Widget>[
                        NumberInput(
                          flex: 1,
                          hintText: '+91',
                          controller: codeController,
                          onChanged: (value) {
                            countryCode = value;
                          },
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        NumberInput(
                          flex: 4,
                          hintText: 'Your Phone Number',
                          controller: phoneController,
                          onChanged: (value) {
                            phoneNumber = value;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  child: RoundButton(
                    leftMargin: 32,
                    rightMargin: 32,
                    topMargin: 32,
                    text: 'Generate OTP',
                    onPressed: () async {
                      if (countryCode != null && phoneNumber != null) {
                        String number =
                            '+${codeController.text}${phoneController.text}';
                        setState(() {
                          _showProgress = true;
                        });
                        _service.verifyPhoneNumber(context, number);
                      }
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
