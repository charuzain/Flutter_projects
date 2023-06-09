import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Opacity( NOT RECOMMENDED
          //   opacity: 0.5,
          //   child: Image.asset(
          //     'assets/quiz-logo.png',
          //     width: 300,
          //   ),
          // ),
          Image.asset(
            'assets/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(150, 255, 255, 255),
          ),
          const SizedBox(
            height: 80,
          ),
          const Text("Learn flutter the fun way!",
              style: TextStyle(color: Colors.white, fontSize: 24)),
          const SizedBox(
            height: 30,
          ),
          OutlinedButton.icon(
              icon: const Icon(Icons.login, size: 28, color: Colors.white),
              style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
              onPressed: () {
              // Navigator.push(context, Questions())
              },
              label: const Text(
                "Start Quiz",
              ))
        ],
      ),
    );
  }
}

// we can add an icon in the outlineButton we have to use OutlineButton.icon , if we use this then we no longer have child property we have to use label . 

// To make an image transparent we have two option we can either wrap the 
// image widget with Opacity widget which is not recommended
// Another way is to use color like const Color.fromARGB(150, 255, 255, 255)

