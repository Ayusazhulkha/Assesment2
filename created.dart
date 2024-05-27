import 'package:flutter/material.dart';
import 'package:living_in_h2f/login.dart';

class CreatedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // Logo
              Image.asset(
                'assets/assets-2.png', // Path to your logo file
                height: 150,
              ),
              const SizedBox(height: 10),
              // Congratulations Text
              const Text(
                'Congratulations!',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF27374E), // Text color
                ),
              ),
              const SizedBox(height: 5),
              // Verification Email Text
              const Text(
                'We’ve sent you a verification email, please check your inbox and follow instructions to verify your account.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey, // Text color
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 30),
              // Sign In Here Text Button
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                child: const Text(
                  'Sign In Here',
                  style: TextStyle(
                    color: Color(0xFF27374E), // Text color
                    fontSize: 14,
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