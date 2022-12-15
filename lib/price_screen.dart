import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:bit_app/coin.dart';
import 'dart:io' show Platform;

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
  CupertinoPicker iosList(){
    List<Text> coinList = [];
    for(String coin in currenciesList){
      coinList.add(Text(coin));
    }
    return CupertinoPicker(
                itemExtent: 30.0,
                onSelectedItemChanged: (value) {
                  print(value);
                },
                children: coinList
              );
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
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = ? USD',
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


