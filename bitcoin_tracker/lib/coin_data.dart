import 'dart:convert';

import 'package:http/http.dart';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {

  dynamic fetchRate(String name) async {
    Response response = await get(Uri.parse('https://rest.coinapi.io/v1/exchangerate/BTC/$name?apikey=A4BEBEAE-5EE7-4619-BDBB-905F64A7479F'));
    if(response.statusCode == 200){
      var data = jsonDecode(response.body);
      return data['rate'];
    }
  }

}