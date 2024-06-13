import 'package:flutter/material.dart';

class PersonalInformationKostPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF27374E), // AppBar color
      ),
      body: Column(
        children: [
          Container(
            color:
                const Color(0xFF27374E), // Background color for the top section
            padding: const EdgeInsets.all(16.0),
            child: const Center(
              child: Column(
                children: [
                  // Profile Picture
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(
                        'assets/logo_livingh2f'), // Replace with user's profile picture
                  ),
                  SizedBox(height: 10),
                  // Name and Edit Icon
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Pondokan H2F', // Replace with user's name
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 10.0),
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
                          leading: const Icon(Icons.person,
                              color: Color(0xFF27374E)),
                          title: const Text('Email'),
                          subtitle: const Text('pondokanh2f@gmail.com'),
                          trailing: const Icon(Icons.edit, color: Colors.grey),
                          onTap: () {
                            // Handle edit full name
                          },
                        ),
                        const Divider(),
                        ListTile(
                          leading:
                              const Icon(Icons.email, color: Color(0xFF27374E)),
                          title: const Text('Phone Number'),
                          subtitle: const Text('0812-3487-0319'),
                          trailing: const Icon(Icons.edit, color: Colors.grey),
                          onTap: () {
                            // Handle edit email
                          },
                        ),
                        const Divider(),
                        ListTile(
                          leading: const Icon(Icons.location_on,
                              color: Color(0xFF27374E)),
                          title: const Text('Alamat'),
                          subtitle: const Text('Lengkong, Kec. Bojongsoang'),
                          trailing: const Icon(Icons.edit, color: Colors.grey),
                          onTap: () {
                            // Handle edit address
                          },
                        ),
                        const Divider(),
                        ListTile(
                          leading: const Icon(Icons.calendar_today,
                              color: Color(0xFF27374E)),
                          title: const Text('Date of Birth'),
                          subtitle: const Text('01 Jan 1990'),
                          trailing: const Icon(Icons.edit, color: Colors.grey),
                          onTap: () {
                            // Handle edit date of birth
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
