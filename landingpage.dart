import 'package:flutter/material.dart';
import 'package:living_in_h2f/create_account.dart';
import 'package:living_in_h2f/login.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // Logo
              Image.asset(
                'assets/logo_living2hf.png', // Path to your logo file
                height: 250,
              ),
              const SizedBox(height: 20),
              // Welcome Text
              const Text(
                'Welcome to LivingInH2F',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF27374E), // Text color
                ),
              ),
              const SizedBox(height: 10),
              // Description
              const Text(
                'This is the LivingInH2F app where you can manage your home efficiently and stay connected with your community.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey, // Text color
                ),
              ),
              const SizedBox(height: 30),
              // Login Button
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                child: Text('Login'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF27374E), // Button color
                  foregroundColor: Colors.white, // Text color
                  padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 15),
                  textStyle: const TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(height: 10),
              // Create Account Text Button
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CreateAccountPage()),
                  );
                },
                child: const Text( 
                  'Create Account',
                  style: TextStyle(
                    color: Color(0xFF27374E), // Text color
                    fontSize: 16,
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