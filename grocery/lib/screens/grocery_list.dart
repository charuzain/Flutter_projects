import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:grocery/data/geocerylist_data.dart';
import 'package:grocery/screens/new_item.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Grocery List"),
        actions: [
          IconButton(
              onPressed: () async {
                final val = await Navigator.push(context,
                    MaterialPageRoute(builder: (ctx) => NewGroceryItem()));
                setState(() {
                  groceryList.add(val);
                });
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: ListView.builder(
        itemCount: groceryList.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(color: groceryList[index].color),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(groceryList[index].title,
                        style: const TextStyle(
                          fontSize: 18,
                        )),
                  ),
                ],
              ),
              Text(groceryList[index].quantity.toString())
            ],
          ),
        ),
      ),
    );
  }
}
