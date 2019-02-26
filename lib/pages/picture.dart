import 'package:flutter/material.dart';
import 'dart:async';

class PicturePage extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String description;
  PicturePage(this.title, this.imageUrl,this.description);

/*  _alert(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Are you sure?'),
            content: Text('The item would be destroyed'),
            actions: <Widget>[
              FlatButton(
                child: Text('Discard'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              FlatButton(
                child: Text('Destroy'),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context, true);
                },
              )
            ],
          );
        });
  }
*/
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          Navigator.pop(context, false);
          print('back');
          return Future.value(false);
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(title) 
            ,
          ),
          body: Center(
            child: ListView(
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(imageUrl),
                Container(
                  margin: EdgeInsets.all(10.0),
                  padding: EdgeInsets.all(10.0),
                  alignment: Alignment.center,
                  child: Text(title, style: TextStyle(fontSize: 20.0)),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.0),
                  padding: EdgeInsets.all(10.0),
                  alignment: Alignment.center,
                  child: Text(description, textAlign: TextAlign.justify,),
                ),
                /*RaisedButton(
                  color: Theme.of(context).splashColor,
                  child: Text('Delete'),
                  onPressed: () => _alert(context),
                ),*/
              ],
            ),
          ),
        ));
  }
}
