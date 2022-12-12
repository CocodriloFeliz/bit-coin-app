import 'package:flutter/material.dart';
import 'package:bit_app/coin.dart';
  List<String> list = ['One','Two','Three'];  

class PriceScreenState extends StatefulWidget {
  const PriceScreenState({super.key});

  @override
  State<PriceScreenState> createState() => _PriceScreenStateState();
}

class _PriceScreenStateState extends State<PriceScreenState> {
  String ddownValue = 'USD';
  List<DropdownMenuItem> a= [];
  List<DropdownMenuItem> ddownList(List<String> list){
    for(String prop in list){
      a.add(DropdownMenuItem(value: prop,child: Text(prop),));
    }
    return a;
  }
  @override
  void initState() {
    super.initState();
    
    ddownList(currenciesList);
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
            child: DropdownButton(
              value: ddownValue,
              items: a,
              onChanged: (value) {
                setState(() {
                  ddownValue = value!;
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
