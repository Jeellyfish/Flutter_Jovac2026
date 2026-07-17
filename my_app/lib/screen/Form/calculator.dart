// Simple Interest Calculator
import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  TextEditingController _principalController = TextEditingController();
  TextEditingController _rateController = TextEditingController();
  TextEditingController _timeController = TextEditingController();

  bool isChecked = false;
  String ? displayResult = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SI Calculator"),
        backgroundColor: Colors.deepOrange,
      ),
      body:SingleChildScrollView(child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Image(
              image: NetworkImage('https://pngimg.com/uploads/money/money_PNG3523.png'),
              width: 300,
              height: 300,
              ),
              SizedBox(height: 10,),
              TextField(
                controller: _principalController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Principal",
                  hintText: "Enter Pricipal Amount e.g. 12000",
                  fillColor: Colors.black12,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                  )
                ),
              ),
              SizedBox(height: 10,),
              TextField(
                controller: _rateController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Rate",
                  hintText: "Enter Rate of Interest",
                  fillColor: Colors.black12,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                  )
                ),
              ),
              SizedBox(height: 10,),
              TextField(
                controller: _timeController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Time",
                  hintText: "Enter Term",
                  fillColor: Colors.black12,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                  )
                ),
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Checkbox(value: isChecked, onChanged: (value){
                    setState(() {
                      isChecked = value!;
                    });
                  }), 
                  Flexible(child: Text("Are you Acceptions the Terms & Condition"))
                ],
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Expanded(child: ElevatedButton(onPressed: isChecked ?(){
                    setState(() {
                      displayResult = _calculateResult();
                    });
                  }:null , child: Text("Calculate"))),
                  SizedBox(width: 20,),
                  Expanded(child: ElevatedButton(onPressed: (){
                    setState(() {
                      _principalController.text = "";
                      _rateController.text = "";
                      _timeController.text = "";
                      isChecked = false;
                      displayResult = "";
                    });
                  }, child: Text("Reset"))),
                ],
              ),
              Text(displayResult!, style: TextStyle(fontWeight: FontWeight.bold),)

        ],
        ),
      ))
    );
  }
  
  String? _calculateResult() {
    double principal = double.parse(_principalController.text); 
    double rate = double.parse(_rateController.text); 
    double time = double.parse(_timeController.text); 
    double totalAmount = principal + (principal*rate*time)/100;
    String result =
        'After $time years, Your Investment will be worth $totalAmount Rupees';
    return result;
  }
}
