import 'package:flutter/material.dart';
import 'package:living_in_h2f/create_account.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(// AppBar color
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
                'assets/logo_living2hf.png', // Path to your logo file
                height: 150,
              ),
              // Login
              const SizedBox(height: 10),
              // Login Text
              const Text(
                'Log In',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF27374E), // Text color
                ),
              ),
              const SizedBox(height: 20),
              // Username Field
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Username',
                  labelStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF27374E),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
              ),
              const SizedBox(height: 20),
              // Password Field
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF27374E),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 30),
              // Login Button
              ElevatedButton(
                onPressed: () {
                  // Handle login logic here
                },
                child: Text('Login'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF27374E), // Button color
                  foregroundColor: Colors.white, // Text color
                  padding:
                      const EdgeInsets.symmetric(horizontal: 150, vertical: 15),
                  textStyle: const TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(height: 5),
              // Create Account Text Button
              TextButton(
                onPressed: () {
                  // Navigate to create account page
                },
                child: const Text(
                  'or continue with',
                  style: TextStyle(
                    color: Colors.grey, // Text color
                    fontSize: 15,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              // Login Button
              ElevatedButton(
                onPressed: () {
                  // Handle login logic here
                },
                child: Text('Google'),
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      const Color.fromARGB(255, 214, 213, 213), // Button color
                  foregroundColor:
                      const Color.fromARGB(255, 0, 0, 0), // Text color
                  padding:
                      const EdgeInsets.symmetric(horizontal: 150, vertical: 15),
                  textStyle: const TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(height: 10),
              // Create Account Text Button
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CreateAccountPage()),
                  );
                },
                child: const Text(
                  'Create Account',
                  style: TextStyle(
                    color: Color(0xFF27374E), // Text color
                    fontSize: 15,
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
