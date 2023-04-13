import 'package:flutter/material.dart';

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
                  child: ResuableCard(),
                ),
                Expanded(
                  child: ResuableCard(),
                ),
              ],
            ),
          ),
          Expanded(
            child: ResuableCard(),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ResuableCard(),
                ),
                Expanded(
                  child: ResuableCard(),
                ),
              ],
            ),
          ),
        ],
      ),

      // or wrap a  widget in Theme widget and change the style
      floatingActionButton: Theme(
        data: ThemeData(
            colorScheme:
                ColorScheme.fromSwatch().copyWith(secondary: Colors.pink)),
        child: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {},
        ),
      ),
    ));
  }
}

class ResuableCard extends StatelessWidget {
  const ResuableCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color(0xFF1D1E33),
      ),
    );
  }
}
