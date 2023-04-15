import 'package:flutter/material.dart';

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
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.male,
                            size: 80,
                          ),
                          SizedBox(height: 15,),
                          Text(
                            'Male',
                            style: TextStyle(
                                fontSize: 22, color: Color(0xFF8D8E98)),
                          )
                        ],
                      )),
                ),
                Expanded(
                  child: ResuableCard(colour: widgetColor),
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

      // or wrap a  widget in Theme widget and change the style
      // floatingActionButton: Theme(
      //   data: ThemeData(
      //       colorScheme:
      //           ColorScheme.fromSwatch().copyWith(secondary: Colors.pink)),
      //   child: FloatingActionButton(
      //     child: const Icon(Icons.add),
      //     onPressed: () {},
      //   ),
      // ),
    ));
  }
}

class ResuableCard extends StatelessWidget {
  final Color colour;
  // By making cardChild nullable with the ? symbol, the variable is not required
  // to have a value assigned to it. This makes it optional, allowing instances of
  // ReusableCard to be created without providing a value for cardChild.
  final Widget? cardChild;
  const ResuableCard({required this.colour, this.cardChild});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: colour,
      ),
    );
  }
}
