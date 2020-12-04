import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class IconContent extends StatelessWidget {
  IconContent({this.icon,this.label});
  final IconData icon;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(

          icon: Icon(icon),
          iconSize: 80.0,

        ),SizedBox(
          height: 18.0,
        ),
        Text(
          label,
          style: KlabelTextStyle



        )



      ],


    );
  }
}