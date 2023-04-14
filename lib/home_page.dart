import 'package:flutter/material.dart';

class BMICalculator extends StatefulWidget {
  final String username;
  final String password;

  BMICalculator({required this.username, required this.password});

  @override
  _BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  double _bmiResult = 0.0;
  String _bmiCategory = '';

  void _calculateBMI() {
    double height = double.parse(_heightController.text) / 100;
    double weight = double.parse(_weightController.text);
    double bmi = weight / (height * height);
    setState(() {
      _bmiResult = bmi;
      if (_bmiResult < 18.5) {
        _bmiCategory = 'Kurus';
      } else if (_bmiResult >= 18.5 && _bmiResult < 25) {
        _bmiCategory = 'Normal';
      } else {
        _bmiCategory = 'Overweight';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI'),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('{ ${widget.username} }'),
              //Text(widget.password),
              SizedBox(height: 20),
              Text(
                'BMI: ${_bmiResult.toStringAsFixed(1)}',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextField(
                controller: _heightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Tinggi (cm)',
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _weightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Berat Bad an (kg)',
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _calculateBMI,
                child: Text('Hitung BMI'),
              ),
              SizedBox(height: 20),
              Text(
                'Category: $_bmiCategory',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
