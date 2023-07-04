import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:grocery/data/geocerylist_data.dart';
import 'package:grocery/screens/new_item.dart';

import '../model/grocery_item.dart';
import 'package:http/http.dart' as http;

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  List<GroceryItem> groceryList = [];

  void loadData() async {
    final url =
        Uri.https('flutter-1d4a5-default-rtdb.firebaseio.com', 'list.json');
    final response = await http.get(url);
    // print(response);
    // print(response.body);

    final data = jsonDecode(response.body);
    List<GroceryItem> loadedList = [];

    for (final item in data.entries) {
      final category = GroceryCategory.values.firstWhere((element) =>
          element.toString().split('.').last.toLowerCase() ==
          item.value['category']);

      loadedList.add(GroceryItem(
          item.key, item.value['title'], item.value['quantity'], category));
    }

    // print(loadedList);

    setState(() {
      groceryList = loadedList;
    });
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Grocery List"),
        actions: [
          IconButton(
              onPressed: () async {
                await Navigator.push(context,
                    MaterialPageRoute(builder: (ctx) => NewGroceryItem()));
                // when we come back to this screen after adding an item we want to make a get request again

                loadData();
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: groceryList.isEmpty
          ? Container(
              color: Colors.orangeAccent,
              padding: EdgeInsets.all(20),
              child: const Center(
                child: Text(
                  "No Grocery Item !! To Add Item in List click on plus icon at the top",
                  softWrap: true,
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
                ),
              ),
            )
          : ListView.builder(
              itemCount: groceryList.length,
              itemBuilder: (context, index) => Dismissible(
                key: Key(groceryList[index].id),
                onDismissed: (direction) {
                  setState(() {
                    groceryList.remove(groceryList[index]);
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 20,
                            width: 20,
                            decoration:
                                BoxDecoration(color: groceryList[index].color),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
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
            ),
    );
  }
}
