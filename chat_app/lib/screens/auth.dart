import 'package:chat_app/screens/chat.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

final firebase = FirebaseAuth.instance;

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final form = GlobalKey<FormState>();
  String emailId = '';
  String password = '';

  void _saveCredentials() async {
    bool isValid = form.currentState!.validate();
    if (!isValid) {
      return;
    }
    if (isValid) {
      form.currentState!.save();

      try {
        final credential = await firebase.createUserWithEmailAndPassword(
          email: emailId,
          password: password,
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          print(
              '**********************The account already exists for that email.**************');
        }
      } catch (e) {
        print(e);
      }
      Navigator.push(
          context, MaterialPageRoute(builder: (ctx) => ChatScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    // final form = GlobalKey<FormState>();

    // void _saveCredentials() {
    //   //
    //   bool isValid = form.currentState!.validate();
    //   if (isValid) {
    //     form.currentState!.save();
    //   }
    // }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Chat App",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
                child: Image.asset(
              'lib/assets/images/chat.jpg',
            )),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(255, 195, 224, 196),
                    shape: BoxShape.rectangle),
                child: Form(
                    key: form,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: const InputDecoration(
                              label: Text("Enter Email"),
                            ),
                            autocorrect: false,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Invalid Input. Enter some value';
                              }
                              if (!value.contains('@')) {
                                return 'Email id should include @';
                              }
                              return null;
                            },
                            onSaved: (newValue) {
                              emailId = newValue!;
                            },
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              label: Text("Password"),
                            ),
                            obscureText: true,
                            validator: (value) {
                              if (value == null ||
                                  value.isEmpty ||
                                  value.trim().isEmpty) {
                                return 'Enter a value';
                              }
                              if (value.length < 6) {
                                return 'Password should be 6 character long';
                              }
                              return null;
                            },
                            onSaved: (newValue) {
                              password = newValue!;
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          ElevatedButton(
                            onPressed: _saveCredentials,
                            child: Text("Login"),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextButton(
                              onPressed: () {},
                              child: Text("Create an account"))
                        ],
                      ),
                    )),
              ),
            )
          ],
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.onSecondaryContainer,
    );
  }
}
