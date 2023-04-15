import 'package:flutter/material.dart';

class BMICalculator extends StatefulWidget {
  final String username;
  final String password;

  BMICalculator({required this.username, required this.password});

  @override
  _BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  final Color primaryColor = Color(0xff18203d);
  final Color secondaryColor = Color(0xff232c51);

  final Color logoGreen = Color(0xff25bcbb);
  /////////////////////////////////////
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
        _bmiCategory = 'KURUS';
      } else if (_bmiResult >= 18.5 && _bmiResult < 25) {
        _bmiCategory = 'NORMAL';
      } else {
        _bmiCategory = 'OVERWEIGHT';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI'),
        backgroundColor: secondaryColor,
        elevation: 0,
      ),
      backgroundColor: primaryColor,
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '{ ${widget.username} }',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
              SizedBox(height: 20),
              Text(
                'BMI: ${_bmiResult.toStringAsFixed(1)}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              TextField(
                style: TextStyle(color: Colors.white),
                controller: _heightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: 'Tinggi (cm)',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: logoGreen,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: logoGreen)),
                    labelStyle: new TextStyle(color: logoGreen)),
              ),
              SizedBox(height: 20),
              TextField(
                style: TextStyle(color: Colors.white),
                controller: _weightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: 'Berat Badan (kg)',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: logoGreen,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: logoGreen)),
                    labelStyle: new TextStyle(color: logoGreen)),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _calculateBMI,
                child:
                    Text('HITUNG BMI', style: TextStyle(color: Colors.white)),
              ),
              SizedBox(height: 20),
              Text(
                'CATEGORY : $_bmiCategory',
                style: TextStyle(
                  color: Colors.white,
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
