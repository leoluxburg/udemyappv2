import 'package:flutter/material.dart';
import './picture_index.dart';

class PictureListPage extends StatelessWidget {
  final List<Map<String, dynamic>> pictures;
  PictureListPage(this.pictures);
  @override
  Widget build(BuildContext context) {
    return  
    ListView.builder(
      padding: EdgeInsets.all(10.0),
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          leading: Container(
            child: Image.asset(pictures[index]['image']),
            width: 50.0,
            height: 50.0,
          ),
          title: Text(pictures[index]['title']),
          trailing: IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {},
          ),
        );
      },
      itemCount: pictures.length,
    );
  }
}
