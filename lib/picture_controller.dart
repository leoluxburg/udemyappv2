import 'package:flutter/material.dart';

import './pictures.dart';

class PictureController extends StatelessWidget {

 final List<Map<String,dynamic>> pictures;
 

 PictureController(this.pictures);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      Expanded( child: Pictures(pictures)) 
      ],
    );
  }
}
