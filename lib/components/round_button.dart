
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class RoundIconButton extends StatelessWidget {
  @override
  RoundIconButton({this.icon,@required this.onPress});
  final Function onPress;
  final IconData icon;
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 9.0,
      constraints: kSizeConstraints,
      child: Icon(
          icon
      )
      ,
      shape:CircleBorder(),
      fillColor:Color(0xFF4C4F5E),
      onPressed: onPress ,
    );
  }
}