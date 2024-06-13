import 'package:flutter/material.dart';

class PersonalInformationUserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF27374E), // AppBar color
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.white, // Background color for the bottom section
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                    child: const Text(
                      'Personal Information',
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
                          leading: const Icon(Icons.person, color: Color(0xFF27374E)),
                          title: const Text('Full Name'),
                          subtitle: const Text('Sarah Angelina'),
                          trailing: const Icon(Icons.edit, color: Colors.grey),
                          onTap: () {
                            // Handle edit full name
                          },
                        ),
                        const Divider(),
                        ListTile(
                          leading: const Icon(Icons.email, color: Color(0xFF27374E)),
                          title: const Text('Email'),
                          subtitle: const Text('sarahangelina@gmail.com'),
                          trailing: const Icon(Icons.edit, color: Colors.grey),
                          onTap: () {
                            // Handle edit email
                          },
                        ),
                        const Divider(),
                        ListTile(
                          leading: const Icon(Icons.phone, color: Color(0xFF27374E)),
                          title: const Text('Phone'),
                          subtitle: const Text('+1234567890'),
                          trailing: const Icon(Icons.edit, color: Colors.grey),
                          onTap: () {
                            // Handle edit phone
                          },
                        ),
                        const Divider(),
                        ListTile(
                          leading: const Icon(Icons.location_on, color: Color(0xFF27374E)),
                          title: const Text('Address'),
                          subtitle: const Text('123 Main St, Anytown, USA'),
                          trailing: const Icon(Icons.edit, color: Colors.grey),
                          onTap: () {
                            // Handle edit address
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