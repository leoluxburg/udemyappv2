import 'package:flutter/material.dart';
import './picture_index.dart';
import '../picture_controller.dart';

class ProfilePage extends StatelessWidget{
  final List<Map<String, dynamic>> pictures;


  ProfilePage(this.pictures);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       drawer: Drawer(
        child: Column(
          children: <Widget>[
            AppBar(
              automaticallyImplyLeading: false,
              title: Text('Menu'),
            ),
            ListTile(
              title: Text('Dashboard'),
              onTap: (){
            Navigator.pushReplacementNamed(context, '/admin');
          }),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Mi Fara'),
      ),
      body: PictureController(pictures)
    );
  }
}