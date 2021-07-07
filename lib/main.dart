import 'sidebar.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unit',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Unit Cals.'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  get node => FocusScope.of(context);

  final kg = TextEditingController();
  final unit = TextEditingController();
  final kg_ = TextEditingController();
  final kg_unit = TextEditingController();
  final unit_ = TextEditingController();
  final unit_kg = TextEditingController();
  var _kg;
  var _unit;
  var res_unit_kg;
  var res_kg_unit;

  var focusNode = FocusNode();

  void _calUnit() {
    _kg = kg.text != '' ? double.parse(kg.text) : 0;
    _unit = unit.text != '' ? double.parse(unit.text) : 0;

    // kg_unit
    res_kg_unit = _unit / _kg;
    kg_.text = "1";
    kg_unit.text = res_kg_unit.toStringAsFixed(2);

    // unit_kg
    res_unit_kg = _kg / _unit;
    unit_.text = "1";
    unit_kg.text = res_unit_kg.toStringAsFixed(2);
  }

  // ignore: non_constant_identifier_names
  void _new_calUnit() {
    var _kg_ = kg_.text != '' ? double.parse(kg_.text) : 0;
    var _unit_ = unit_.text != '' ? double.parse(unit_.text) : 0;

    kg_unit.text = (_kg_ * res_kg_unit).toStringAsFixed(2);
    unit_kg.text = (_unit_ * res_unit_kg).toStringAsFixed(2);

    if (kg_unit.text == "0.00" || kg_unit.text == '') {
      kg_unit.text = res_kg_unit.toStringAsFixed(2);
    }
    if (unit_kg.text == "0.00" || unit_kg.text == '') {
      unit_kg.text = res_unit_kg.toStringAsFixed(2);
    }
  }

  void _clear() {
    kg.text = "";
    unit.text = "";
    kg_.text = "";
    unit_.text = "";
    kg_unit.text = "";
    unit_kg.text = "";
    FocusScope.of(context).unfocus();
    // focusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text("Start",
                    style: TextStyle(
                      fontSize: 40,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 1.5
                        ..color = Colors.green[700]!,
                    )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                    child: TextField(
                      focusNode: focusNode,
                      decoration: InputDecoration(
                          hintText: "Ex : KG", labelText: 'Ex : KG'),
                      keyboardType: TextInputType.number,
                      controller: kg,
                      onChanged: (text) {
                        _calUnit();
                      },
                      textInputAction: TextInputAction.next,
                      onEditingComplete: () => node.nextFocus(),
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Flexible(
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Ex : Unit", labelText: 'Ex : Unit'),
                      keyboardType: TextInputType.number,
                      controller: unit,
                      onChanged: (text) {
                        _calUnit();
                      },
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Text("Result",
                      style: TextStyle(
                        fontSize: 40,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 1.5
                          ..color = Colors.green[700]!,
                      )),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                    child: Focus(
                      onFocusChange: (focus) => {if (focus) kg_.text = ""},
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: "New Ex : KG", labelText: 'New Ex : KG'),
                        keyboardType: TextInputType.number,
                        controller: kg_,
                        onChanged: (text) {
                          _new_calUnit();
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Flexible(
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "KG to Unit", labelText: 'KG to Unit'),
                      keyboardType: TextInputType.number,
                      controller: kg_unit,
                      readOnly: true,
                      enableInteractiveSelection: false,
                      focusNode: FocusNode(),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                    child: Focus(
                      onFocusChange: (focus) => {
                        if (focus)
                          unit_.text = ""
                        else if (unit_.text == '')
                          unit_.text = "1"
                      },
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: "New Ex : Unit",
                            labelText: 'New Ex : Unit'),
                        keyboardType: TextInputType.number,
                        controller: unit_,
                        onChanged: (text) {
                          _new_calUnit();
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Flexible(
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Unit to KG", labelText: 'Unit to KG'),
                      keyboardType: TextInputType.number,
                      controller: unit_kg,
                      readOnly: true,
                      enableInteractiveSelection: false,
                      focusNode: FocusNode(),
                    ),
                  ),
                ],
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
              )
            ],
          ),
        ),
      ),
      drawer: Sidebar(),
    );
  }
}
