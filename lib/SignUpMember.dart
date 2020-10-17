import 'package:flutter/material.dart';
import 'package:we_care/LoginPage.dart';
import 'package:we_care/SplashScreen.dart';
// import 'signup_volunteer2.dart';
import 'package:firebase_auth/firebase_auth.dart';

// void main() {
//   runApp(signup_volunteer());
// }

class SignUpMember extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(

            //backgroundColor: Colors.teal[100],
            appBar: AppBar(
              backgroundColor: Colors.teal,
              title: Text('WeCare'),
              centerTitle: true,
            ),
            body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/bg1.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  //Container(
                  //decoration: BoxDecoration(
                  // image: DecorationImage(image: AssetImage('images/WeCare.png'),
                  //),
                  //),
                  //),

                  signupM(),
                ],
              ),
            )));
  }
}

class signupM extends StatefulWidget {
  @override
  _signup_MState createState() => _signup_MState();
}

class _signup_MState extends State<signupM> {
  final _auth = FirebaseAuth.instance;

  String gender = 'Male';
  String name;
  String phone_number;
  String password;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(),
      SizedBox(height: 30),
      Center(
        child: Text(
          'HELLO!',
          style: TextStyle(
            fontFamily: 'Ubuntu',
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      SizedBox(height: 20),
      CircleAvatar(
        radius: 50.0,
        backgroundImage: AssetImage('images/volunteer1.jpg'),
      ),
      SizedBox(height: 20),
      Text(
        'Lets sign you up',
        style: TextStyle(
          fontFamily: 'Ubuntu',
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      SizedBox(height: 20),
      Padding(
        padding:
            const EdgeInsets.only(left: 15, top: 0.0, right: 15.0, bottom: 0.0),
        child: TextField(
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.teal),
              borderRadius: new BorderRadius.circular(10.0),
            ),
            prefixIcon: Icon(Icons.perm_identity),
            labelText: 'Enter name',
            fillColor: Colors.teal[200],
          ),
          onChanged: (value) {
            name = value;
          },
        ),
      ),
      SizedBox(height: 10),
      Padding(
        padding:
            const EdgeInsets.only(left: 15, top: 0.0, right: 15.0, bottom: 0.0),
        child: TextField(
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: new BorderRadius.circular(10.0),
            ),
            prefixIcon: Icon(Icons.mail_outline),
            labelText: 'Enter phone number ',
            fillColor: Colors.teal[100],
          ),
          onChanged: (value) {
            phone_number = value;
          },
        ),
      ),
      SizedBox(height: 10),
      Padding(
        padding:
            const EdgeInsets.only(left: 15, top: 0.0, right: 15.0, bottom: 0.0),
        child: TextField(
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: new BorderRadius.circular(10.0),
            ),
            prefixIcon: Icon(Icons.home),
            labelText: 'Enter password',
            fillColor: Colors.teal[100],
          ),
          onChanged: (value) {
            password = value;
          },
        ),
      ),
      SizedBox(height: 30),
      RaisedButton(
        onPressed: () async {
          // Navigator.push(context, MaterialPageRoute(builder: (context) {
          //   return LoginPage();
          // }));
          try {
            final newUser = await _auth.createUserWithEmailAndPassword(
                email: name, password: password);

            if (newUser != null) {
              Navigator.pushNamed(context, LoginPage.id);
            }
          } catch (e) {
            print(e);
          }
          // color: Colors.teal,
          // textColor: Colors.white,
          // child: Text('Next'),
        },
      )
    ]);
  }
}
