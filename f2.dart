import 'package:flutter/material.dart';
void main() {
runApp(MaterialApp(
debugShowCheckedModeBanner: false,
home: CalculatorApp(),
));
}
class CalculatorApp extends StatefulWidget {
@override
_CalculatorAppState createState() => _CalculatorAppState();
}
class _CalculatorAppState extends State<CalculatorApp> {
final TextEditingController num1Controller = TextEditingController();
final TextEditingController num2Controller = TextEditingController();
double result = 0;
void calculate(String operation) {
double num1 = double.tryParse(num1Controller.text) ?? 0;
double num2 = double.tryParse(num2Controller.text) ?? 0;
setState(() {
if (operation == "+") result = num1 + num2;
if (operation == "-") result = num1 - num2;
if (operation == "×") result = num1 * num2;
if (operation == "÷") result = num2 != 0 ? num1 / num2 : 0;
});
}@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(title: Text("Simple Calculator")),
body: Padding(
padding: EdgeInsets.all(20),
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
TextField(
controller: num1Controller,
keyboardType: TextInputType.number,
decoration: InputDecoration(labelText: "Enter first number"),
),
SizedBox(height: 10),
TextField(
controller: num2Controller,
keyboardType: TextInputType.number,
decoration: InputDecoration(labelText: "Enter second number"),
),
SizedBox(height: 20),
Row(
mainAxisAlignment: MainAxisAlignment.spaceEvenly,
children: [
ElevatedButton(onPressed: () => calculate("+"), child: Text("+")),
ElevatedButton(onPressed: () => calculate("-"), child: Text("-")),
ElevatedButton(onPressed: () => calculate("×"), child: Text("×")),
ElevatedButton(onPressed: () => calculate("÷"), child: Text("÷")),
],
),
SizedBox(height: 20),Text(
"Result: $result",
style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
),
],
),
),
);
}
}