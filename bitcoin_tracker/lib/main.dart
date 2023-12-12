import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'package:http/http.dart';
import 'dart:io' show Platform;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coin Tracker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String selectedValue = 'USD';
  var rate = '?';

  String getItem(int num) {
    String name = currenciesList[num];
    return name;
  }

  fetchExchangeRate() async {
    CoinData exRate = CoinData();
     var val = await exRate.fetchRate(selectedValue);
     print(val);

   setState(() {
    rate =  val.toStringAsFixed(0);
   });
  }






  DropdownButton displayDropDown(List<String> currencyList) {
    List<DropdownMenuItem<String>> dropDownCurrencyList = [];
    print(currencyList[0]);
    for (int i = 0; i < currencyList.length; i++) {
      DropdownMenuItem<String> val = DropdownMenuItem(
        value: currencyList[i],
        child: Text(currencyList[i]),
      );
      dropDownCurrencyList.add(val);
    }
    return
    DropdownButton<String>(
          iconSize: 40.0,
          iconEnabledColor: Colors.black,
          style: TextStyle(fontSize: 18, color: Colors.black54),
          dropdownColor: Colors.grey,
          value: selectedValue,
          items: dropDownCurrencyList,
          onChanged: (value) {
            setState(() {
              selectedValue = value!;
              fetchExchangeRate();
            });
          },
        );
  }


  CupertinoPicker getPickerList(List currencyList){
    List <Text> curList = [];
    String val;
    for(String currency in currencyList) {
      val = currency;
      curList.add(Text(val));
    }
    return CupertinoPicker(
      itemExtent: 40.0,
      onSelectedItemChanged: (value) {
        var itemName =  getItem(value);
          setState(() {
          selectedValue = itemName;
          fetchExchangeRate();
        });
      },

      children: curList,

    );
  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchExchangeRate();





  }
  @override
  Widget build(BuildContext context) {
    // getExchangeRate();

    return Scaffold(

      appBar: AppBar(
        title: Text("💰 Coin Tracker"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CrytoCard(rate: rate, selectedValue: selectedValue),
              CrytoCard(rate: rate, selectedValue: selectedValue),
              CrytoCard(rate: rate, selectedValue: selectedValue),
            ],
          ),
          Container(
            height: 150.0,
            color: Colors.blue,
            alignment: Alignment.center,


            child:Platform.isAndroid ? displayDropDown(currenciesList) :

            getPickerList(currenciesList)
            // child:
          ),
        ],
      ),
    );
  }



}

// List<Widget> cryptoCardList(){
//
//   List <CrytoCard>  cardList = [];
//   for(int i = 0 ; i <cryptoList.length;i++){
//
//   }
//
//   return cardList;
//
//
// }

class CrytoCard extends StatelessWidget {
  const CrytoCard({
    super.key,
    required this.rate,
    required this.selectedValue,
    // required this.selectedCurrency,
  });

  final String rate;
  final String selectedValue;
  // final String selectedCurrency;


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        color: Colors.blue,
        elevation: 5.0,
        shadowColor: Colors.blue,
        margin: EdgeInsets.all(16.0),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)),
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 38.0, vertical: 15.0),
          child: Text(
            '1 USD = $rate $selectedValue',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
