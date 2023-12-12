import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_chat/home_screen.dart';

import 'chat.dart';
import 'constants.dart';

class Registration extends StatefulWidget {
  static String id = 'register';
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  late String email;
  late String password;
  bool loading = false;

  var auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register Screen"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Stack(
            children: [Column(
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
                    email = value;
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
                   password = value;
                  },

                  // inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
                SizedBox(height: 30.0,),


                RoundedButton(
                  msg:"Register",
                  color: Colors.blue,
                  onPress: () async {
                    setState(() {
                      loading = true;
                    });

                    print(email);
                    print(password);
                    try {
                      final user = await auth.createUserWithEmailAndPassword(
                          email: email, password: password);
                      print("==========");
                      print(user);
                      setState(() {
                        loading = false;
                      });
                      Navigator.pushNamed(context, Chat.id);
                      print("==========");

                    }
                    catch(e){

                      print('---------');
                      print(e);
                    }

                    // register user
                  },

                )
              ],
            ),
              if(loading)
                Center(child: CircularProgressIndicator())


]
          ),
          ),
    );
  }
}
