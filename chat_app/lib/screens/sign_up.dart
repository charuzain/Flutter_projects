import 'package:chat_app/screens/chat.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final firebase = FirebaseAuth.instance;

class AuthScreen extends StatefulWidget {
  AuthScreen({super.key, required this.isUSerAlreadyRegistered});

  bool isUSerAlreadyRegistered;

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
        Navigator.push(
            context, MaterialPageRoute(builder: (ctx) => ChatScreen()));
      } on FirebaseAuthException catch (e) {
        late final errorMessage;
        if (e.code == 'weak-password') {
          errorMessage = 'The password provided is too weak.';
        } else if (e.code == 'email-already-in-use') {
          errorMessage = 'The account already exists for that email';
        }
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
          errorMessage,
          textAlign: TextAlign.center,
        )));
      } catch (e) {
        print(e);
      }
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
                            child: Text(widget.isUSerAlreadyRegistered
                                ? "Login"
                                : "Create Account"),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  widget.isUSerAlreadyRegistered =
                                      !widget.isUSerAlreadyRegistered;
                                });
                              },
                              child: Text(widget.isUSerAlreadyRegistered
                                  ? "Create an account"
                                  : "Already have account LOGIN instead"))
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
