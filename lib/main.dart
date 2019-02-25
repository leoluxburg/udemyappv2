import 'package:flutter/material.dart';
import './pages/auth.dart';
import './pages/picture_index.dart';
import './pages/profile.dart';
import './pages/picture.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}
  
class _MyAppState extends State<MyApp>{

  List<Map<String,dynamic>> _pictures = [];

  void _addPicture(Map<String, dynamic> picture) {
    setState(() {
      _pictures.add(picture);
    });
  }

  void _deletePicture(int index){
    setState(() {
      _pictures.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.dark, primarySwatch: Colors.grey),
      //home: AuthPage(),
      routes: {
        '/': (BuildContext context) => AuthPage(),
        '/admin': (BuildContext context) => PictureIndex( _addPicture, _deletePicture),
        '/pictures': (BuildContext context) => ProfilePage(_pictures),

      },
      onGenerateRoute: (RouteSettings settings){
        final List<String> pathData = settings.name.split('/');
        if (pathData[0] != ''){
          return null;
        }
        if (pathData[1] == 'pictures'){
          final int index = int.parse(pathData[2]);
        return  MaterialPageRoute<bool> (
                        builder: (BuildContext context) => PicturePage(
                            _pictures[index]['title'], _pictures[index]['image']),
                      );
        }
        return null;
      },
      onUnknownRoute:(RouteSettings settings) {
        return MaterialPageRoute(
          builder: (BuildContext context) =>
          ProfilePage(_pictures),
        );
        },
    );
  }
}
