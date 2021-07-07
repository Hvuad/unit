import 'package:flutter/material.dart';

class Coupon extends StatefulWidget {
  @override
  _CouponState createState() => _CouponState();
}

class _CouponState extends State<Coupon> {
  final percent = TextEditingController();
  final max = TextEditingController();
  String txt = '';

  void couponCals() {
    var _percent = double.parse(percent.text);
    var _max = double.parse(max.text);
    var _res = _max / (_percent / 100);
    setState(() {
      txt =
          "Discount $_percent% \nMax Receive $_max \nYou must spend $_res baht.";
    });
  }

  void _clear() {
    percent.text = '';
    max.text = '';
    setState(() {
      txt = '';
    });
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Coupon Cals."),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Disocunt %", labelText: 'Disocunt %'),
                      keyboardType: TextInputType.number,
                      controller: percent,
                      onChanged: (text) {
                        couponCals();
                      },
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Flexible(
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Max receive", labelText: 'Max receive'),
                      keyboardType: TextInputType.number,
                      controller: max,
                      onChanged: (text) {
                        couponCals();
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  txt,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Center(
                  child: RaisedButton(
                    color: Colors.red, // background
                    textColor: Colors.white, // foreground
                    onPressed: () {
                      _clear();
                    },
                    child: Text('Clear'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
