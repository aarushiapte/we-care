import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:we_care/AuthService.dart';

void main() {
  runApp(phone_verif());
}

class phone_verif extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            //backgroundColor: Colors.teal[100],
            appBar: AppBar(
              backgroundColor: Color(0xFFffc0b4),
              title: Text('WeCare'),
              centerTitle: true,
            ),
            body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/PeachBg.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  phone_v(),
                ],
              ),
            )));
  }
}

class phone_v extends StatefulWidget {
  @override
  _phone_vState createState() => _phone_vState();
}

class _phone_vState extends State<phone_v> {
  String phoneNo, verificationId, smsCode;
  bool codeSent = false;

  Future<void> verifyPhone(phoneNo) async {
    final PhoneCodeAutoRetrievalTimeout autoTimeout = (String verId) {
      this.verificationId = verId;
    }; //for automatic retrieval timeout

    final PhoneVerificationCompleted verified = (AuthCredential authResult) {
      AuthService().signIn(authResult);
    };

    final PhoneVerificationFailed verificationFailed =
        (FirebaseAuthException authException) {
      print('${authException.message}');
    };

    final PhoneCodeSent smsSent = (String verId, [int forceResend]) {
      this.verificationId = verId;
      setState(() {
        this.codeSent = true;
      });
    };

    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: this.phoneNo,
        verificationCompleted: verified,
        verificationFailed: verificationFailed,
        codeSent: smsSent,
        timeout: const Duration(seconds: 5),
        codeAutoRetrievalTimeout: autoTimeout);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 100),
        Center(
          child: Text(
            'Phone Number Verification',
            style: TextStyle(
              fontFamily: 'Ubuntu',
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        SizedBox(height: 100),
        Padding(
          padding: const EdgeInsets.only(
              left: 15, top: 0.0, right: 15.0, bottom: 0.0),
          child: TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: new BorderRadius.circular(10.0),
              ),
              prefixIcon: Icon(Icons.mail_outline),
              labelText: 'Enter Phone Number ',
              fillColor: Colors.teal[100],
            ),
            keyboardType: TextInputType.phone,
            onChanged: (val) {
              setState(() {
                this.phoneNo = val;
              });
            },
          ), //phoneNumber
        ),
        SizedBox(height: 100),
        codeSent
            ? Padding(
                padding: const EdgeInsets.only(
                    left: 15, top: 0.0, right: 15.0, bottom: 0.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                    prefixIcon: Icon(Icons.mail_outline),
                    labelText: 'Enter OTP ',
                    fillColor: Colors.teal[100],
                  ),
                  keyboardType: TextInputType.phone,
                  onChanged: (val) {
                    setState(() {
                      this.smsCode = val;
                    });
                  },
                ), //phoneNumber
              )
            : Container(),
        SizedBox(height: 80),
        RaisedButton(
            color: Colors.teal,
            textColor: Colors.white,
            child: codeSent ? Text('Login') : Text('Verify'),
            onPressed: () {
              codeSent
                  ? AuthService().signInWithOTP(smsCode, verificationId)
                  : verifyPhone(phoneNo);
            } //used incase otp has to be entered manually
            )
      ],
    );
  }
}
