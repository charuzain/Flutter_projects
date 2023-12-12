import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat/login.dart';
import 'package:flutter_chat/registration.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class HomeScreen extends StatefulWidget {
  static String id = 'home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller =
        AnimationController(duration: Duration(seconds: 3), vsync: this);
    controller.forward();

    controller.addListener(() {
      print(controller.value);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home Screen"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Hero(
                    tag: "logo",
                    child: Icon(Icons.flash_on,
                        color: Colors.red, size: controller.value * 50),
                  ),
                  // Hero(
                  //     tag: 'logo',
                  //     child: Icon(Icons.flash_on,
                  //         color: Colors.red, size: controller.value)),
                  SizedBox(
                    width: 8,
                  ),
                  AnimatedTextKit(
                    animatedTexts: [TypewriterAnimatedText("Flash Chat",
                      textStyle: TextStyle(
                            fontSize: 42,
                            letterSpacing: 1,
                            fontWeight: FontWeight.bold,

                          //   color: CupertinoColors.black,
                      ),
                      textAlign: TextAlign.center,
                      speed: Duration(milliseconds: 200)



                    )],
                    // style: TextStyle(
                    //   fontSize: 42,
                    //   letterSpacing: 1,
                    //   fontWeight: FontWeight.bold,
                    //   color: CupertinoColors.black,
                    // ),
                    // textAlign: TextAlign.center,
                  ),
                ],
              ),
              SizedBox(
                height: 48,
              ),
              RoundedButton(color: Colors.purple, msg: "Login", onPress: () {
    Navigator.pushNamed(context, Login.id);}
    ),
              SizedBox(
                height: 25,
              ),

              RoundedButton(color: Colors.blue, msg: "Register!", onPress:() {
        Navigator.pushNamed(context, Registration.id);
      } ,)
              // ElevatedButton(
              //   style: ElevatedButton.styleFrom(
              //       elevation: 5.0,
              //       textStyle: TextStyle(fontSize: 20),
              //       shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(20))),
              //   onPressed: () {
              //     Navigator.pushNamed(context, Registration.id);
              //   },
              //   child: Padding(
              //     padding:
              //         const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
              //     child: Text(
              //       "Register",
              //       style: TextStyle(fontSize: 18),
              //     ),
              //   ),
              // )
            ],
          ),
        ));
  }
}

class RoundedButton extends StatelessWidget {

  Color color;
  String msg;
  VoidCallback onPress;

  RoundedButton({
    required this.color ,  required this.msg, required this.onPress
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: color,
          elevation: 5.0,
          textStyle: TextStyle(fontSize: 20),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20))),
      onPressed: onPress,

      child: Padding(
        padding:
            const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
        child: Text(
          msg,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
