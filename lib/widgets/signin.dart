import 'package:flutter/material.dart';
import 'package:signin_UI/widgets/data.dart';

class Signin extends StatefulWidget {
  final Function reg;
  Signin({this.reg});
  @override
  _SigninState createState() => _SigninState();
}

String username = '';
String password = '';
bool signedin = false;

class _SigninState extends State<Signin> {
  void signin() {
    if (data.keys.contains(username)) {
      if (data[username] != null && data[username] == password) {
        setState(() {
          signedin = true;
          Navigator.pushReplacementNamed(context, '/signedin');
        });
      } else {
        setState(() {
          signedin = false;
        });
      }
    } else {
      setState(() {
        signedin = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[300],
      appBar: AppBar(
        title: Text('Sign in'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey[900],
      ),
      body: Column(children: [
        Form(
            child: Column(
          children: [
            TextFormField(
              onSaved: (String value) {
                username = value;
              },
              validator: (String value) {
                if (value.isEmpty) {
                  return "please enter your username";
                }
                if (value.length > 20) {
                  return "Max number of letters are 20";
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: "username",
                focusColor: Colors.white,
                hintStyle: TextStyle(color: Colors.grey[300], fontSize: 15.0),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.indigo, width: 5.0),
                    borderRadius: BorderRadius.circular(10.0)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              onSaved: (String value) {
                password = value;
              },
              validator: (String value) {
                if (value.isEmpty) {
                  return "please enter your password";
                }
                if (value.length > 20) {
                  return "Max number of letters are 20";
                }

                return null;
              },
              decoration: InputDecoration(
                hintText: "password",
                focusColor: Colors.white,
                hintStyle: TextStyle(color: Colors.grey[300], fontSize: 15.0),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.indigo, width: 5.0),
                    borderRadius: BorderRadius.circular(10.0)),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                signin();
              },
              child: Text('Submit'),
            )
          ],
        )),
        SizedBox(
          height: 20,
        ),
        RaisedButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/register');
          },
          child: Text('Register'),
        )
      ]),
    );
  }
}

class Signedin extends StatefulWidget {
  @override
  _SignedinState createState() => _SignedinState();
}

class _SignedinState extends State<Signedin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Signed in'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey[900],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("welcome back $username"),
        ],
      ),
    );
  }
}
