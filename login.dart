import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:living_in_h2f/homepage.dart';
import 'package:living_in_h2f/kelola_user.dart';
import 'dart:convert';
import 'kelola_kost.dart';
import 'create_account.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _login(BuildContext context) async {
    final username = _usernameController.text;
    final password = _passwordController.text;

    // Ganti URL berikut dengan URL endpoint API Anda
    final url = Uri.parse('http://192.168.1.8/api/read_user.php');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: {
        'username': username,
        'password': password,
      },
      encoding: Encoding.getByName('utf-8'),
    );

    // Log respons dari server
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    // Periksa apakah respons berhasil diterima
    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body);

      // Pastikan respons adalah array
      if (responseData is List) {
        bool loginSuccess = false;
        String role = '';

        for (var user in responseData) {
          if (user['username'] == username && user['password'] == password) {
            loginSuccess = true;
            role = user['role'];
            break;
          }
        }

        if (loginSuccess) {
          if (role == 'user') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => KelolaKostPage()),
            );
          } else if (role == 'admin') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => KelolaKostPage()),
            );
          }
        } else {
          // Show error message
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Login Failed'),
                content: const Text('Invalid username or password.'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('OK'),
                  ),
                ],
              );
            },
          );
        }
      } else {
        // Handle invalid response structure
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Login Failed'),
              content: const Text('Invalid response from server.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      }
    } else {
      // Handle HTTP error
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Login Failed'),
            content: const Text('Server error. Please try again later.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Remove the back button
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
                controller: _usernameController,
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
                controller: _passwordController,
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
                onPressed: () => _login(context), // Panggil fungsi login
                child: const Text('Login'),
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
