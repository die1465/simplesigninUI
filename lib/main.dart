import 'package:flutter/material.dart';
import 'package:signin_UI/widgets/register.dart';
import 'package:signin_UI/widgets/signin.dart';

void main() {
  runApp(MaterialApp(
    routes: {
      '/': (context) => Signin(),
      '/register': (context) => Register(),
      '/signedin': (context) => Signedin()
    },
  ));
}

class Homescreen extends StatefulWidget {
  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  bool showregister = false;
  void register() {
    setState(() {
      showregister = !showregister;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showregister) {
      return Register();
    } else {
      return Signin();
    }
  }
}
