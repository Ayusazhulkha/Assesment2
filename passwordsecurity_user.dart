import 'package:flutter/material.dart';

class PasswordSecurityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF27374E), // AppBar color
      ),
      body: Column(
        children: [
          Container(
            color: const Color(0xFF27374E), // Background color for the top section
            padding: const EdgeInsets.all(16.0),
            child: const Center(
              child: Column(
                children: [
                  // Profile Picture
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/fotoprofil.jpg'), // Replace with user's profile picture
                  ),
                  SizedBox(height: 10),
                  // Name and Edit Icon
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Sarah Angelina', // Replace with user's name
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white, // Text color
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.white, // Background color for the bottom section
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                    child: const Text(
                      'Password & Security',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF27374E),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.all(16.0),
                      children: [
                        ListTile(
                          leading: const Icon(Icons.lock, color: Color(0xFF27374E)),
                          title: const Text('Change Password'),
                          trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
                          onTap: () {
                            // Navigate to change password page
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}