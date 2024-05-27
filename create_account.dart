import 'package:flutter/material.dart';
import 'package:living_in_h2f/created.dart';

class CreateAccountPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // Logo
                Image.asset(
                  'assets/logo_living2hf.png', // Path to your logo file
                  height: 150,
                ),
                const SizedBox(height: 10),
                // Login Text
                const Text(
                  'Create Account',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF27374E), // Text color
                  ),
                ),
                const SizedBox(height: 20),
                // Email Field
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email',
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
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                // Fullname Field
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Full Name',
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
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your full name';
                    }
                    return null;
                  },
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
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your username';
                    }
                    return null;
                  },
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
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                // Re-Password Field
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Re-Password',
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
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please re-enter your password';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30),
                // Create Account Button
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CreatedPage()),
                      );
                    }
                  },
                  child: const Text('Create Account'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF27374E), // Button color
                    foregroundColor: Colors.white, // Text color
                    padding: const EdgeInsets.symmetric(
                        horizontal: 120, vertical: 15),
                    textStyle: const TextStyle(fontSize: 15),
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
