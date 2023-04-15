import 'package:bmi_calculator/resuable_card.dart';
import 'package:flutter/material.dart';

import 'icon_content.dart';

const widgetColor = Color(0xFF1D1E33);
final bottomHeight = 70.9;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(title: Text("BMI Calcualtor")),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ResuableCard(
                      colour: widgetColor,
                      cardChild: CustomIconContent(
                        icon: Icons.male,
                        text: 'Male',
                      )),
                ),
                Expanded(
                  child: ResuableCard(
                    colour: widgetColor,
                    cardChild: CustomIconContent(
                      icon: Icons.female,
                      text: 'Female',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ResuableCard(colour: widgetColor),
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
