import 'dart:math';

import 'package:bmi_calculator/question_brain.dart';
import 'package:bmi_calculator/resuable_card.dart';
import 'package:bmi_calculator/screen_two.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'constants.dart';
import 'icon_content.dart';

// enums cant be created inside classes , so we create it here

enum GenderType {
  male,
  female,
}



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color maleCardColor = kWidgetColor;
  Color femaleCardColor = kWidgetColor;
  GenderType? selected;
  int height = 110;
  int weight = 50;
  int age = 20;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

//   void updateWidgetColor (GenderType gender){
//     // if male card is selected
//     if(gender == GenderType.male){
//       setState(() {
//       maleCardColor =  maleCardColor == activeCardColor ? widgetColor : activeCardColor;
//         // if(maleCardColor == activeCardColor){
//         //   maleCardColor = widgetColor;
//         // }else {
//         //   maleCardColor = activeCardColor;
//         // }
//         femaleCardColor = widgetColor;
//       });
//     }
//     // if female card is selected
// if(gender == GenderType.female) {
//       setState(() {
//         femaleCardColor = femaleCardColor == activeCardColor ? widgetColor :activeCardColor;
//         // if (femaleCardColor == activeCardColor) {
//         //   femaleCardColor = widgetColor;
//         // } else {
//         //   femaleCardColor = activeCardColor;
//         // }
//         maleCardColor = widgetColor;
//       });
//     }
//   }
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(title: Text("BMI Calcualtor")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    child: ResuableCard(
                        colour: selected == GenderType.male
                            ? kActiveCardColor
                            : kWidgetColor,
                        cardChild: CustomIconContent(
                          icon: Icons.male,
                          text: 'Male',
                        )),
                    onTap: () {
                      setState(() {
                        selected = selected == GenderType.male
                            ? null
                            : GenderType.male;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    child: ResuableCard(
                      colour: selected == GenderType.female
                          ? kActiveCardColor
                          : kWidgetColor,
                      cardChild: CustomIconContent(
                        icon: Icons.female,
                        text: 'Female',
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        selected = selected == GenderType.female
                            ? null
                            : GenderType.female;
                      });

                      // setState(() {
                      //   // if femalecard is alreaduy selected and user click on it again
                      //   // set its color to widget card color else set its color to selected widget color
                      //  if(femaleCardColor == activeCardColor){
                      //    femaleCardColor = widgetColor;
                      //  }
                      //  else{
                      //
                      //    femaleCardColor = activeCardColor;
                      //  }
                      //  maleCardColor = widgetColor;
                      //
                      // });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ResuableCard(
              colour: kWidgetColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Height",
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toString(), style: kNumberTextStyle),
                      Text("cm")
                    ],
                  ),
                  SliderTheme(
                    // copywith : add changes, only thing we want to change
                    data: SliderTheme.of(context).copyWith(
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 25),
                      thumbColor: Colors.pink,
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Colors.grey,
                      overlayColor: Color(0x40EB1555),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 100.0,
                      max: 220.0,
                      onChanged: (double value) {
                        setState(() {
                          print(value);
                          height = value.toInt();
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ResuableCard(
                      colour: kWidgetColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Weight",
                            style: kLabelTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                onPress: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                icon: CupertinoIcons.plus,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              RoundIconButton(
                                onPress: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                                icon: CupertinoIcons.minus,
                              )
                            ],
                          )
                        ],
                      )),
                ),
                Expanded(
                  child: ResuableCard(
                    colour: kWidgetColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Age",
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: Icons.add,
                              onPress: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            RoundIconButton(
                              icon: Icons.mode_comment,
                              onPress: () {
                                if (age > 0) {
                                  setState(() {
                                    age--;
                                  });
                                }
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);
              // print(height);
              // print(weight);
              // print(calc.bmi());
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ResultPage(
                    bmi:calc.bmi() , bmiResult : calc.bmiResult() , resultText: calc.message()

                  )));
            },
            child: Container(
              child: Center(
                child: Text(
                  "calculate".toUpperCase(),
                  style: TextStyle(fontSize: 28),


                ),
              ),
              color: Colors.pink,
              height: kBottomHeight,
            ),
          )
        ],
      ),
    ));
  }
}

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({super.key, this.icon, required this.onPress});
  final IconData? icon;
  // VoidCallback is just shorthand for void Function() so you could also define it as
  // final void Function() onPressed;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPress,
      fillColor: Colors.pink,
      shape: CircleBorder(),
      constraints: const BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
    );
  }
}

// Container: If they have no children they will size themselve as large as parent allow
// one it have child they resize itself to fit the size of child.
