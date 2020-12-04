


import 'package:flutter/cupertino.dart';

import '../constants.dart';

class ButtomButton extends StatelessWidget {
final Function onTap;
final String buttonName;
ButtomButton({@required this.buttonName,@required this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(child: Text(buttonName,style: KTextStyleBottomButtom,)),
        padding: EdgeInsets.only(bottom: 20),
        width: double.infinity,
        height: kBottomButtonHeight,
        margin: EdgeInsets.only(top:10.0),
        decoration: BoxDecoration(
            color: KbottomCardColor,
            borderRadius: BorderRadius.vertical(top: Radius.circular(10),bottom: Radius.circular(6)))
        ,
      ),
    );
  }
}