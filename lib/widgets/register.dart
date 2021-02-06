import 'package:flutter/material.dart';
import 'package:signin_UI/widgets/data.dart';

class Register extends StatefulWidget {
  final Function reg;
  Register({this.reg});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String username = '';
  String password = '';
  void submit(String username, String password) {
    data[username] = password;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
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
                  return "please enter your new username";
                }
                if (value.length > 20) {
                  return "Max number of letters are 20";
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: "enter new username",
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
                  return "please enter your new password";
                }
                if (value.length > 20) {
                  return "Max number of letters are 20";
                }

                return null;
              },
              decoration: InputDecoration(
                hintText: "enter the new password",
                hintStyle: TextStyle(color: Colors.grey[300], fontSize: 15.0),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.indigo, width: 5.0),
                    borderRadius: BorderRadius.circular(10.0)),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                submit(username, password);
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
            Navigator.pushReplacementNamed(context, '/');
          },
          child: Text('sign in'),
        )
      ]),
    );
  }
}
