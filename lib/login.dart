import 'package:flutter/material.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  ////////////////////////////////////////
  final String username;
  final String password;
  /////////////////////////////////////////
  LoginPage({required this.username, required this.password});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final Color primaryColor = Color(0xff18203d);
  final Color secondaryColor = Color(0xff232c51);

  final Color logoGreen = Color(0xff25bcbb);
  /////////////////////////////////////////////
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _usernameController.text = widget.username;
    _passwordController.text = widget.password;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: secondaryColor,
        elevation: 0,
      ),
      backgroundColor: primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Aplikasi BMI',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.normal,
                  color: Colors.white),
            ),
            Text(
              'Login untuk menggunakan BMI',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  color: Colors.white),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 10),
              child: Container(
                height: 250,
                child: Image.asset('assets/images/login.png'),
              ),
            ),
            TextField(
              style: TextStyle(color: Colors.white),
              controller: _usernameController,
              decoration: InputDecoration(
                  labelText: 'Email',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: logoGreen,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: logoGreen)),
                  labelStyle: new TextStyle(color: logoGreen)),
            ),
            SizedBox(height: 16.0),
            TextField(
              style: TextStyle(color: Colors.white),
              controller: _passwordController,
              decoration: InputDecoration(
                  labelText: 'Password',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: logoGreen,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: logoGreen)),
                  labelStyle: new TextStyle(color: logoGreen)),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                if (_usernameController.text == widget.username &&
                    _passwordController.text == widget.password) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BMICalculator(
                              username: _usernameController.text,
                              password: _passwordController.text,
                            )),
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Error'),
                      content: Text('Pasword dan email salah'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text('OK'),
                        ),
                      ],
                    ),
                  );
                }
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
