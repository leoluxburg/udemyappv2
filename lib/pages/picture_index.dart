import 'package:flutter/material.dart';
import './picture_create.dart';
import './picture_list.dart';
import './profile.dart';

class PictureIndex extends StatelessWidget {
  final Function addPicture;
  final Function deletePicture;

  PictureIndex(this.addPicture, this.deletePicture);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 2 , child: Scaffold(
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            AppBar(
              automaticallyImplyLeading: true, //que es esta vaina
              title: Text('Menu'),
            ),
            ListTile(
              title: Text('Pictures'),
              onTap: (){
            Navigator.pushReplacementNamed(context, '/pictures');
          }),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Mi Fara'),
        bottom: TabBar(tabs: <Widget>[
          Tab(
            icon: Icon(Icons.list),
            text: ('Index'),
            ),
          Tab(
            icon: Icon(Icons.create),
            text: ('Post'),
            )
        ],),
      ),
      body:  TabBarView(
        children: <Widget>[
          PictureListPage(),
          PictureCreatePage(addPicture)
        ],
      ),
    ),
    );
  }
}
