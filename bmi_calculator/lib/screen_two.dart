import 'package:bmi_calculator/homePage.dart';
import 'package:bmi_calculator/location.dart';
import 'package:bmi_calculator/resuable_card.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
late double bmi;
final String bmiResult;
late String resultText;



ResultPage({Key? key ,required this.bmi , required this.bmiResult , required this.resultText }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator Result"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.all(15.0),

              child: Text(

                "Your Result",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),


              ),
            ),

          ),
          Expanded(
            flex: 5,
            child: ResuableCard(
              colour: Colors.black54,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    bmiResult,
                    style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold,fontSize: 22),
                  ),
                 Text(bmi.toStringAsFixed(1), style: TextStyle(fontSize: 100, fontWeight: FontWeight.bold),),
                  Text(resultText , style: TextStyle(
                    fontSize: 22,
                  ),
                  textAlign: TextAlign.center,),
            // GestureDetector(
            //   onTap: () {
            //     // Handle link tap here
            //     print("clikc");
            //   },
            //   child: Container(
            //     decoration: BoxDecoration(
            //       color: Colors.blue,
            //       borderRadius: BorderRadius.circular(10),
            //     ),
            //     padding: EdgeInsets.symmetric(horizontal: 22, vertical: 18),
            //     child: Row(
            //       mainAxisSize: MainAxisSize.min,
            //       children: [
            //         Icon(
            //           Icons.chat,
            //           color: Colors.white,
            //         ),
            //         SizedBox(width: 8),
            //         Text(
            //           'Live Chat',
            //           style: TextStyle(
            //             color: Colors.white,
            //             fontSize: 28,
            //
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // )

            ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                  },
                  child: Container(color: Colors.pink,
                  child: Center(child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text("re-calculate".toUpperCase(),style: TextStyle(
                      fontSize: 28 , fontWeight: FontWeight.bold
                    ),),
                  )),),
                ),

                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Location()));
                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                  },
                  child: Container(color: Colors.pink,
                    child: Center(child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text("location".toUpperCase(),style: TextStyle(
                          fontSize: 28 , fontWeight: FontWeight.bold
                      ),),
                    )),),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

//
// class LiveChatWidget extends StatelessWidget {
//   final String chatUrl = "https://my.lauft.work/chat-support";
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//
//       onTap: () => {},
//       child: Row(
//         // mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(Icons.chat_bubble, color: Colors.blue),
//           SizedBox(width: 8.0),
//           Text(
//             "Live Chat",
//             style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
//           ),
//         ],
//       ),
//     );
//   }
// }
