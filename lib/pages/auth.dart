import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AuthPageState();
  }
}

class _AuthPageState extends State<AuthPage> {
  String _useremail;
   String _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mi Fara'),
      ),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: Column(children: <Widget>[
          TextField(
            decoration: InputDecoration(
              labelText: 'Email',
            ),
            onChanged: (String value){
              setState(() {
                _useremail = value;
              });
            },
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Password',
            ),
            obscureText: true,
            onChanged: (String value){
              setState(() {
                _password = value;
              });
            },
          ),
          RaisedButton(
            child: Text('Login'),
            onPressed: () {
              print(_useremail);
              print(_password);
              Navigator.pushReplacementNamed(context, '/pictures');
            },
          ),
        ]),
      ),
    );
  }
}
