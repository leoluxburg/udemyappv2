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
  final Map<String, dynamic> _pictureValue = {
    'title': null,
    'description': null, 
    'severity': null,
    'image': 'assets/fara.png'
  };
  final GlobalKey<FormState> _picturekey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          margin: EdgeInsets.all(10.0),
          child: Form(
            key: _picturekey,
            child: ListView(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Title',
                  ),
                  validator: (String value) {
                    // if (value.trim().length <= 0)
                    if (value.isEmpty) return 'Title is requiered';
                  },
                  onSaved: (String value) {
                    setState(() {
                      _pictureValue['title'] = value;
                    });
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Description',
                  ),
                  maxLines: 10,
                  validator: (String value) {
                    // if (value.trim().length <= 0)
                    if (value.isEmpty) return 'Title is requiered';
                  },
                  onSaved: (String value) {
                    setState(() {
                      _pictureValue['description']= value;
                    });
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Priority',
                  ),
                  onSaved: (String value) {
                    setState(() {
                       _pictureValue['severity'] = value;
                    });
                  },
                ),
                SizedBox(
                  height: 10.0,
                ),
                RaisedButton(
                  child: Text('Save'),
                  onPressed: () {
                    if (!_picturekey.currentState.validate()) {
                      return;
                    }
                    _picturekey.currentState.save();
                    widget.addPicture(_pictureValue);
                    Navigator.pushReplacementNamed(context, '/pictures');
                  },
                )
              ],
            ),
          ),
        ));
  }
}
