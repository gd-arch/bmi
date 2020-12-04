import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/reusable_Card.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
class ResultPage extends StatelessWidget {
  ResultPage({@required this.result,@required this.resultText,@required this.interpretation});
   String resultText="normal";
  final String result;
  final String interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CALCULATE"),


      ),body: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: Container(
            padding: EdgeInsets.all(15.0),
            alignment:Alignment.bottomLeft,
            child: Text(
              "Your Result",
              style: KTitleTextStyle,
            ),
          ),
        )
        ,Expanded(flex: 5,
          child: ReusableCard(colour: KactiveCardColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: <Widget>[
                Text(resultText.toUpperCase(),style:KresultTextStyle,),
                Text(result,style: KBMITextStyle,),
                Text(interpretation,textAlign: TextAlign.center,)




              ],

            ),
          ),
        ),
        ButtomButton(buttonName: 'Recalculate',onTap: (){Navigator.pop(context);},)
                //Routes are defined in main.dart




      ],
    )

    );
  }
}
