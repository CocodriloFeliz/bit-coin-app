import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:bit_app/coin.dart';
import 'dart:io' show Platform;
import 'package:http/http.dart' as http;

List<String> list = ['One', 'Two', 'Three'];

class PriceScreenState extends StatefulWidget {
  const PriceScreenState({super.key});

  @override
  State<PriceScreenState> createState() => _PriceScreenStateState();
}

class _PriceScreenStateState extends State<PriceScreenState> {
  String ddownValue = 'USD';
  

  DropdownButton androidList() {
    List<DropdownMenuItem<String>> coinList = [];
    for (String prop in currenciesList) {
      coinList.add(DropdownMenuItem(
        value: prop,
        child: Text(prop),
      ));
    }
    return DropdownButton(
      value: ddownValue,
      items: coinList,
      onChanged: (value) {
        setState(() {
          ddownValue = value!;
        });
      },
    );
  }

  CupertinoPicker iosList() {
    List<Text> coinList = [];
    for (String coin in currenciesList) {
      coinList.add(Text(coin));
    }
    return CupertinoPicker(
        itemExtent: 30.0,
        onSelectedItemChanged: (value) {
          print(value);
        },
        children: coinList);
  }

  @override
  void initState() {
    getChangeRate();
  }
double changeRate = 0;
  Future getChangeRate() async {
    http.Response response = await http.get(Uri.parse(
        'https://rest.coinapi.io/v1/exchangerate/BTC/USD?apikey=547BAC92-0AE2-4BA3-B0D6-5460445A9754&invert=true&output_format=json'));
    Map btcMap = jsonDecode(response.body);
    changeRate = btcMap['rate'];
    print(changeRate);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 USD = $changeRate BTC',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
              ),
            ),
          ),
          Container(
              height: 150.0,
              alignment: Alignment.center,
              padding: const EdgeInsets.only(bottom: 30.0),
              color: Colors.lightBlue,
              child: Platform.isIOS ? iosList() : androidList())
        ],
      ),
    );
  }
}
