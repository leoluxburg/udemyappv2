import 'package:flutter/material.dart';
import './pages/picture.dart';

class Pictures extends StatelessWidget {
  final List<Map<String, dynamic>> pictures;

  Pictures(this.pictures) {
    print('Widget Constructor');
  }

  Widget _buildPicture(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(pictures[index]['image']),
          Text(pictures[index]['title']),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Text('Description'),
                onPressed: () => Navigator
                .pushNamed<bool>(
                  context, '/pictures/' + index.toString())
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print('Widget Build');
    Widget polaroid = Center(
      child: Text('Trust me ... She is gorgeous!'),
    );
    if (pictures.length > 0) {
      polaroid = ListView.builder(
        itemBuilder: _buildPicture,
        itemCount: pictures.length,
      );
    }
    return polaroid;
  }
}
