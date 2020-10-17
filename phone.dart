import 'package:flutter/material.dart';
import 'otp.dart';

void main() {
  runApp(phone());
}

class phone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            //backgroundColor: Colors.teal[100],

            body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/bg2.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  phone_v(),
                ],
              ),
            ),
        ),
    );
  }
}

class phone_v extends StatefulWidget {
  @override
  _phone_vState createState() => _phone_vState();
}

class _phone_vState extends State<phone_v> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 130),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 0.0, right: 15.0, bottom: 0.0),
              child: Text(
                'Phone Number \nVerification',
                style: TextStyle(
                  fontFamily: 'Ubuntu',
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 100),
        Padding(
          padding:
          const EdgeInsets.only(left: 15, top: 0.0, right: 15.0, bottom: 0.0),
          child: TextField(

            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: new BorderRadius.circular(10.0),
              ),
              prefixIcon: Icon(Icons.phone),
              labelText: 'Enter Phone Number ',
              fillColor: Colors.teal[100],
            ),
          ),
        ),
        SizedBox(height: 80),
        RaisedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return otp();
            }));
          },
          color: Color(0xFFFEC0B2),
          textColor: Colors.black,
          child: Text('Next'),

        )


      ],
    );
  }
}

