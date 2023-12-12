

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'chat.dart';
import 'constants.dart';
import 'home_screen.dart';

class Login extends StatefulWidget {
  static String id = 'login';
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var userEmail;
  var userPassword;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register Screen"),
      ),
      body: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.flash_on , size: 100.0 , color: Colors.red,),
              SizedBox(height: 15.0,),
              TextField(
                decoration: kInputTextDecorationStyle.copyWith(
                    hintText: 'Enter your email address',
                    prefixIcon: Icon(Icons.email),
                    suffixText: '@com'
                ),
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value){
                   userEmail = value;
                   print(userEmail);

                },

                // inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
              SizedBox(height: 15.0,),
              TextField(
                textAlign: TextAlign.center,
                obscureText: true,
                decoration: kInputTextDecorationStyle.copyWith(
                    hintText: 'Enter your password',
                    prefixIcon: Icon(Icons.key)
                ),
                keyboardType: TextInputType.number,
                onChanged: (value){
                  userPassword = value;
                  print(userPassword);

                },

                // inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
              SizedBox(height: 30.0,),


              RoundedButton(
                msg:"Login",
                color: Colors.blue,
                onPress: ()  async {

                  setState(() {
                    isLoading = true;
                  });

                  if(userEmail == null || userPassword == null){
                    print("Enter email id or password ");
                  }
                 else {
                    try {
                      final credential = await FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                          email: userEmail,
                          password: userPassword
                      );

                      if(credential != null) {


                        Navigator.pushNamed(context, Chat.id);
                        setState(() {
                          isLoading = false;
                        });
                      }
                    } on FirebaseAuthException catch (e) {
                      print("----*******************----------");
                      if (e.code == 'user-not-found') {
                        print('No user found for that email.');
                      } else if (e.code == 'wrong-password') {
                        print('Wrong password provided for that user.');
                      }
                    }
                  }
                  //
                  //
                  // Navigator.pushNamed(context, Chat.id);
                  // print(email);
                  // print(password);
                  // try {
                  //   final user = await auth.createUserWithEmailAndPassword(
                  //       email: email, password: password);
                  //   print("==========");
                  //   print(user);
                  //   Navigator.pushNamed(context, Chat.id);
                  //   print("==========");
                  //
                  // }
                  // catch(e){
                  //   print('---------');
                  //   print(e);
                  // }

                  // register user
                },

              )
            ],
          ),
        ),
      ),
    );
  }
}
