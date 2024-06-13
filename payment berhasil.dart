import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(
          backgroundColor: Color(0xFF0E2D47),
          title: Text(
            'Upload File',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'images/berhasil.png',
                width: 250,
                height: 250,
              ),
              SizedBox(height: 20),
              Text(
                'Congratulations',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0E2D47), // Dark blue color
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Your payment has been successful! Thank you',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF0E2D47), // Dark blue color
                ),
              ),
              SizedBox(height: 150),
              ElevatedButton(
                onPressed: () {
                  // Add your upload logic here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 20, 42, 60),
                  padding: EdgeInsets.symmetric(horizontal: 150, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Back to Home',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ), // Add space between text and button
            ],
          ),
        ),
      ),
    );
  }
}
