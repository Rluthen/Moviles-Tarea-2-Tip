import 'dart:ffi';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

enum tipAmount { amazing, good, okay }

class _HomePageState extends State<HomePage> {
  _tipCalculation() {
    setState(() {
      if (_tip == tipAmount.amazing) {
        _totalAmount =
            num.parse(tipController.text) + num.parse(tipController.text) * .2;
      } else if (_tip == tipAmount.good) {
        _totalAmount =
            num.parse(tipController.text) + num.parse(tipController.text) * .18;
      } else {
        _totalAmount =
            num.parse(tipController.text) + num.parse(tipController.text) * .15;
      }
    });
  }

  bool switchEnabled = true;
  var tipController = TextEditingController();
  tipAmount _tip = tipAmount.amazing;
  num _totalAmount = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tip time'),
      ),
      body: ListView(
        children: [
          SizedBox(height: 14),
          ListTile(
            leading: Icon(Icons.room_service),
            title: Padding(
              padding: EdgeInsets.only(right: 24),
              child: TextField(
                controller: tipController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Ingresar propina",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.dinner_dining),
            title: Text("How was the service?"),
          ),
          ListTile(
            title: const Text('Amazing 20%'),
            leading: Radio<tipAmount>(
              value: tipAmount.amazing,
              groupValue: _tip,
              onChanged: (tipAmount value) {
                setState(() {
                  _tip = value;
                  _tipCalculation();
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Good 18%'),
            leading: Radio<tipAmount>(
              value: tipAmount.good,
              groupValue: _tip,
              onChanged: (tipAmount value) {
                setState(() {
                  _tip = value;
                  _tipCalculation();
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Okay 15%'),
            leading: Radio<tipAmount>(
              value: tipAmount.okay,
              groupValue: _tip,
              onChanged: (tipAmount value) {
                setState(() {
                  _tip = value;
                  _tipCalculation();
                });
              },
            ),
          ),
          ListTile(
            leading: Icon(Icons.credit_card),
            title: Text("Round up tip"),
            trailing: Switch(
              value: switchEnabled,
              onChanged: (switchstate) {
                switchEnabled = switchstate;
                setState(() {});
              },
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: MaterialButton(
                    child: Text(
                      "CALCULATE",
                      style: TextStyle(color: Colors.grey[200]),
                    ),
                    onPressed: () {
                      _tipCalculation();
                    },
                    color: Colors.green,
                  ),
                ),
              ),
            ],
          ),
          Text("Tip amount: \$${_totalAmount}"),
        ],
      ),
    );
  }
}
