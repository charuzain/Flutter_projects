import 'package:bmi_calculator/resuable_card.dart';
import 'package:flutter/material.dart';

import 'icon_content.dart';

const widgetColor = Color(0xFF1D1E33);
final bottomHeight = 70.9;
const activeColor = Color(0xFF6F6666);
const activeCardColor = Colors.purple;

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
  Color maleCardColor = widgetColor;
  Color femaleCardColor = widgetColor;
  GenderType? selected;
  int height = 120;

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
                            ? activeCardColor
                            : widgetColor,
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
                          ? activeCardColor
                          : widgetColor,
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
              colour: widgetColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Height"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toString(),
                          style: TextStyle(
                            fontSize: 50,
                          )),
                      Text("cm")
                    ],
                  ),
                  Slider(
                    value: 120.0,
                    min: 100.0,
                    max: 200.0,
                    secondaryTrackValue: 190.0,

                    onChanged: (double value) {
                      setState(() {
                        height = value.toInt();

                      });
                    },
                    activeColor: Colors.pink,
                    inactiveColor: Colors.blueGrey,



                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ResuableCard(colour: widgetColor),
                ),
                Expanded(
                  child: ResuableCard(colour: widgetColor),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.pink,
            height: bottomHeight,
          )
        ],
      ),
    ));
  }
}
