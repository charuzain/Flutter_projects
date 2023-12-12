import 'dart:convert';
import 'dart:math';

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
  bool isLoading = true;
  String? errorMsg;

  void loadData() async {
    try {
      final url =
          Uri.https('flutter-1d4a5-default-rtdb.firebaseio.com', 'list.json');
      final response = await http.get(url);

      if (response.body == 'null') {
        setState(() {
          isLoading = false;
        });
        return;
      }
      if (response.statusCode >= 400) {
        setState(() {
          errorMsg = "OOPS !!! There was some issue in fetching data";
          isLoading = false;
        });
      }
      final data = jsonDecode(response.body);
      // print(data);
      List<GroceryItem> loadedList = [];

      for (final item in data.entries) {
        // print(item.value['category']);
        final category = GroceryCategory.values.firstWhere((element) =>
            element.toString().split('.').last.toLowerCase() ==
            item.value['category']);

        loadedList.add(GroceryItem(
            item.key, item.value['title'], item.value['quantity'], category));
      }

      // print(loadedList);

      setState(() {
        groceryList = loadedList;
        print("++++++++++++++++");
        isLoading = false;
      });
    } catch (error) {
      setState(() {
        errorMsg = error
            .toString()
            .split(":")
            .first; // or simple error like soemthing went wrong
        isLoading = false;
      });
    }
    // final url =
    //     Uri.https('flutter-1d4a5-default-rtdb.firebaseio.com', 'list.json');
    // final response = await http.get(url);

    // if (response.body == 'null') {
    //   setState(() {
    //     isLoading = false;
    //   });
    //   return;
    // }
    // if (response.statusCode >= 400) {
    //   setState(() {
    //     errorMsg = "OOPS !!! There was some issue in fetching data";
    //     isLoading = false;
    //   });
    // } else {
    //   final data = jsonDecode(response.body);
    //   // print(data);
    //   List<GroceryItem> loadedList = [];

    //   for (final item in data.entries) {
    //     // print(item.value['category']);
    //     final category = GroceryCategory.values.firstWhere((element) =>
    //         element.toString().split('.').last.toLowerCase() ==
    //         item.value['category']);

    //     loadedList.add(GroceryItem(
    //         item.key, item.value['title'], item.value['quantity'], category));
    //   }

    //   // print(loadedList);

    //   setState(() {
    //     groceryList = loadedList;
    //     print("++++++++++++++++");
    //     isLoading = false;
    //   });
    // }
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(child: CircularProgressIndicator())
        : Scaffold(
            appBar: AppBar(
              title: const Text("Grocery List"),
              actions: [
                IconButton(
                    onPressed: () async {
                      final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (ctx) => NewGroceryItem()));
                      // print(result);

                      // Instead of loading thw whole data again and again making the get request we can just add the newly added item to list
                      if (result != null) {
                        setState(() {
                          groceryList.add(GroceryItem(
                              result['id'],
                              result['title'],
                              result['quantity'],
                              result['category']));
                        });
                      }

                      // when we come back to this screen after adding an item we want to make a get request again

                      // loadData();
                    },
                    icon: Icon(Icons.add))
              ],
            ),
            body: groceryList.isEmpty
                ? Container(
                    color: Colors.orangeAccent,
                    padding: EdgeInsets.all(20),
                    child: errorMsg != null
                        ? Center(
                            child: Text(
                            errorMsg!,
                            style: const TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ))
                        : const Center(
                            child: Text(
                              "No Grocery Item !! To Add Item in List click on plus icon at the top",
                              softWrap: true,
                              style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                          ),
                  )
                : ListView.builder(
                    itemCount: groceryList.length,
                    itemBuilder: (context, index) => Dismissible(
                      key: Key(groceryList[index].id),
                      onDismissed: (direction) async {
                        // remove the item from UI
                        final itemToRemove = groceryList[index];
                        final iDOfItem = groceryList[index].id;
                        setState(() {
                          groceryList.remove(groceryList[index]);
                        });

                        // remove the item from database

                        final url = Uri.https(
                            'flutter-1d4a5-default-rtdb.firebaseio.com',
                            'list/${iDOfItem}.json');
                        final response = await http.delete(url);

                        print("===================================");
                        print("jo");
                        print(response);
                        print("===================================");

                        // if there was an error and the item is not removed from backend , add it back to UI
                        if (response.statusCode >= 400) {
                          ScaffoldMessenger.of(context).clearSnackBars();
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                  "There was an error deleting the item")));
                          setState(() {
                            groceryList.insert(index, itemToRemove);
                          });
                        }
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
                                  decoration: BoxDecoration(
                                      color: groceryList[index].color),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
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
