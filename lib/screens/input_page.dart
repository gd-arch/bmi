import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/reusable_Card.dart';
import 'package:bmi_calculator/components/round_button.dart';
import 'package:bmi_calculator/screens/result_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';
import '../components/icon_Content.dart';
import 'result_page.dart';

enum Gender{
  male,female
}
class InputPage extends StatefulWidget {

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int userheight=180;
  int userweight=60;
  int age=25;
//  Color maleCardColor=inacticeCardColor;
//  Color femaleCardColor=inacticeCardColor;

//  void updateButton(Gender SelectedGender){
//    if(SelectedGender==Gender.male) {
//      if (maleCardColor == inacticeCardColor) {
//        maleCardColor = activeCardColor;
//        femaleCardColor = inacticeCardColor;
//      }
//      else {
//        maleCardColor = inacticeCardColor;
//      }
//    }
//    else if(SelectedGender==Gender.female){
//      if (femaleCardColor == inacticeCardColor) {
//        femaleCardColor = activeCardColor;
//        maleCardColor = inacticeCardColor;
//      }
//      else {
//        femaleCardColor = inacticeCardColor;
//      }
//    }
//  }

Gender selectedGender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(children: <Widget>[
          Expanded(flex: 3,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: (){
                      setState(() {
                        selectedGender=Gender.male;
                      });
                    },
                      colour:selectedGender==Gender.male?KactiveCardColor:KinacticeCardColor,
                    cardChild:IconContent(icon:FontAwesomeIcons.mars ,label: "MALE")
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress:(){
                setState(() {
                selectedGender=Gender.female;
                });
                } ,
                    colour:selectedGender==Gender.female?KactiveCardColor:KinacticeCardColor
                  ,cardChild: IconContent(icon:FontAwesomeIcons.venus ,label: "FEMALE"),),
                )
              ],
            ),
          ),
          Expanded(flex: 3,
            child: ReusableCard(colour:KactiveCardColor
            ,cardChild:Column(
                mainAxisAlignment: MainAxisAlignment.center,


                children: <Widget>[
                  Center(child: Text("HEIGHT",style: KlabelTextStyle,)),
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        userheight.toString(),
                        style: KTextNumberStyle,
                      ),Text(
                        "cm",
                        style: KlabelTextStyle,

                      ),

                    ],
                  )
                  ,SliderTheme(
                    data: SliderTheme.of(context).copyWith(

                      thumbColor:Color(0xFFEB1555)
                        ,thumbShape:  RoundSliderThumbShape(enabledThumbRadius: 15),
                        overlayColor: Color(0x29EB1555),
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 30)
                    ),
                    child: Slider(
                      min: 140,
                      max: 220,
                      value: userheight.toDouble(),
                      activeColor: Color(0xFFEB1555),
                      inactiveColor: Color(0xFF8D8E98),
                      onChanged: (double newValue){
                        setState(() {
                          userheight=newValue.round();
                        });
                      },
                    ),
                  )

                ],

              ) ,
            ),

          ),
          Expanded(flex: 3,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(colour:KactiveCardColor
                  ,cardChild: Column(mainAxisAlignment: MainAxisAlignment.center,
                    children :<Widget>[
                      Text("WEIGHT",style: KlabelTextStyle,
                      ),
                      Text(userweight.toString(),style: KTextNumberStyle,)
                      ,Row(mainAxisAlignment: MainAxisAlignment.center,children:<Widget>[
                        RoundIconButton(icon:FontAwesomeIcons.minus,onPress: (){
                          setState(() {
                            userweight=userweight-1;
                          });
                        },)
                        ,SizedBox(width: 15,)
                        ,RoundIconButton(icon:FontAwesomeIcons.plus,
                            onPress:(){setState(() {
                              userweight=userweight+1;
                            });}
                        )

            ]
            ),


                    ]
                  ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(colour:KactiveCardColor,
                  cardChild: Column(mainAxisAlignment: MainAxisAlignment.center,
                    children:<Widget>[
                      Text("AGE",style: KlabelTextStyle,
                      ),
                      Text(age.toString(),style: KTextNumberStyle,)

                      ,Row(mainAxisAlignment: MainAxisAlignment.center,children:<Widget>[
                      RoundIconButton(icon:FontAwesomeIcons.minus,onPress: (){
                        setState(() {
                          age=age-1;
                        });
                      },)
                      ,SizedBox(width: 15,)
                      ,RoundIconButton(icon:FontAwesomeIcons.plus,
                          onPress:(){setState(() {
                            age=age+1;
                          });}
                      )

                    ]
                    ),]
                  ),),
                )

              ],
            ),
          ),
          ButtomButton(buttonName: 'Calculate',onTap:(){
            CalculatorBrain calc=CalculatorBrain(height: userheight,weight: userweight );
            Navigator.push(context,MaterialPageRoute(
              builder: (context)=>ResultPage(
                  result:calc.calculateBmi(),resultText:calc.getResult(),
                  interpretation:calc.getInterpretation()
              )


            ))
            ;},
          )


        ])
//      floatingActionButton: Theme(
//        data: ThemeData.light(),
//        child: FloatingActionButton(
//          child: Icon(Icons.add),
//        ),
//      ),
        );
  }
}







