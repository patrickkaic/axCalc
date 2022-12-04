import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  imcCalc() => valueWeight / valueHeight * valueHeight;

  static const valueBaseWeight = 0.0;

  static const valueBaseHeight = 0;

  final controllerWeight =
      TextEditingController(text: valueBaseWeight.toString());

  final controllerHeight =
      TextEditingController(text: valueBaseHeight.toString());

  double valueWeight = valueBaseWeight;

  int valueHeight = valueBaseHeight;

  @override
  void initState() {
    super.initState();
    controllerWeight.addListener(_onBillAmountChanged);
    controllerHeight.addListener(_onTipAmountChanged);
  }

  _onBillAmountChanged() {
    setState(() {
      valueWeight = double.tryParse(controllerWeight.text) ?? 0.0;
    });
  }

  _onTipAmountChanged() {
    setState(() {
      valueHeight = int.tryParse(controllerHeight.text) ?? 0;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AxCalc', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white70,
      ),
      body: Container(
        color: Colors.white70,
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  key: Key('billAmount'),
                  controller: controllerWeight,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                    hintText: "Digite o valor",
                    labelText: "Altura (m)",
                    labelStyle: TextStyle(
                      fontSize: 25,
                      letterSpacing: 3,
                      fontWeight: FontWeight.bold,
                    ),
                    fillColor: Colors.white,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(20.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                TextFormField(
                  key: Key("tipPercentage"),
                  controller: controllerHeight,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Digite o valor",
                    labelText: "Peso (kg)",
                    labelStyle: TextStyle(
                      fontSize: 25,
                      letterSpacing: 3,
                      fontWeight: FontWeight.bold,
                    ),
                    fillColor: Colors.white,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(20.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.all(15),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                    border: Border.all(color: Colors.white),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(2, 2),
                        spreadRadius: 2,
                        blurRadius: 1,
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      AmountText(
                        'Seu IMC é: ${imcCalc()}',
                        key: Key('totalAmount'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AmountText extends StatelessWidget {
  final String text;

  const AmountText(
    this.text, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Text(
        text.toUpperCase(),
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.blueAccent,
          fontSize: 20,
        ),
      ),
    );
  }
}
