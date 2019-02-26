import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AuthPageState();
  }
}

class _AuthPageState extends State<AuthPage> {

  final Map<String, dynamic> _userData = {
   'email': null, 
   'password': null,
   'terms': false
  };
  

  final GlobalKey<FormState> _userkey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mi Fara'),
      ),
      body: Container(
          margin: EdgeInsets.all(10.0),
          child:  Form( 
            key: _userkey,
            child: Column(children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Email',
              ),
              validator: (String value) {
                if (value.isEmpty || !RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?").hasMatch(value)) return 'Valid Email is requiered';
              },
              onSaved: (String value) {
                setState(() {
                 _userData['email']= value;
                });
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
              validator: (String value) {
                if (value.isEmpty || value.length < 6) return 'Password is requiered';
              },
              onSaved: (String value) {
                setState(() {
                  _userData['password']= value;
                });
              },
            ),
            SwitchListTile(
              title: Text('Accept terms'),
              value: _userData['terms'],
              onChanged: (bool value) {
                if (value == true) {
                setState(() {
                  _userData['terms'] = value;
                });
                }
                else {
                  return 'You need to accept terms and';
                }
              },
            ),
            SizedBox(
              height: 10.0,
            ),
            RaisedButton(
              child: Text('Login'),
              onPressed: () {
                if (!_userkey.currentState.validate()) {
                      return;
                    }
                _userkey.currentState.save();
                print(_userData);
                Navigator.pushReplacementNamed(context, '/pictures');
              },
            ),
          ]),
        ),
      ),
    );
  }
}
