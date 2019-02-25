import 'package:flutter/material.dart';

class PictureCreatePage extends StatefulWidget {
  final Function addPicture;

  PictureCreatePage(this.addPicture);

  @override
  State<StatefulWidget> createState() {
    return _PicturetCreatePageState();
  }
}

class _PicturetCreatePageState extends State<PictureCreatePage> {
  String titleValue;
  String description;
  String severity;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: ListView(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              labelText: 'Title',
            ),
            onChanged: (String value) {
              setState(() {
                titleValue = value;
              });
            },
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Description',
            ),
            maxLines: 6,
            onChanged: (String value) {
              setState(() {
                description = value;
              });
            },
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Priority',
            ),
            onChanged: (String value) {
              setState(() {
                severity = value;
              });
            },
          ),
          SizedBox(
            height: 10.0,
          ),
          RaisedButton(
            child: Text('Save'),
            onPressed: () {
              final Map<String, dynamic> picture = {
                'title': titleValue,
                'description': description,
                'severity': severity,
                'image':'assets/fara.png'
              };
              widget.addPicture(picture);
              Navigator.pushReplacementNamed(context, '/pictures');

            },
          )
        ],
      ),
    );
  }
}
