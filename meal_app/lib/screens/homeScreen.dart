import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:meal_app/screens/category.dart';
import 'package:meal_app/screens/meals.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedVal = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedVal == 0 ? "Category" : "Favorite"),
      ),
      body: DefaultTabController(
          length: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TabBar(
                  onTap: (value) => {
                        setState(
                          () {
                            selectedVal = value;
                          },
                        )
                      },
                  tabs: [
                    Tab(text: "Category"),
                    Tab(text: "Favorite"),
                  ]),
              Text(
                "Export",
                textAlign: TextAlign.start,
              ),
              Expanded(
                  child: TabBarView(
                      children: [CategoryScreen(), Text("No Favorite yet")]))
            ],
          )),
    );
  }
}
