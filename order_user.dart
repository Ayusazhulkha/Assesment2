import 'package:flutter/material.dart';

class OrderPage extends StatelessWidget {
  void _showOrderDetails(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: const Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Order Details',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF27374E),
                ),
              ),
              SizedBox(height: 10),
              Text(
                '1 Jan 22 - 1 Jan 23',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'History Pemesanan',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF27374E),
                ),
              ),
              SizedBox(height: 10),
              Text('Accommodation: Rp. 9.200.000'),
              Text('Cleaning: Rp. 600.000'),
              Text('Electricity Cost: Rp. 200.000'),
              Divider(color: Colors.grey),
              Text(
                'Total: Rp. 10.000.000',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

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
              child: ListView(
                padding: const EdgeInsets.all(16.0),
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      'Your Orders',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF27374E),
                      ),
                    ),
                  ),
                  Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(16.0),
                      title: const Text(
                        'Room 12 - Type B',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF27374E),
                        ),
                      ),
                      subtitle: const Text('1 year ago'),
                      trailing: ElevatedButton(
                        onPressed: () {
                          _showOrderDetails(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green, // Button color
                          foregroundColor: Colors.white, // Text color
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        ),
                        child: const Text('Accepted'),
                      ),
                    ),
                  ),
                  Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(16.0),
                      title: const Text(
                        'Room 11 - Type A',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF27374E),
                        ),
                      ),
                      subtitle: const Text('2 days ago'),
                      trailing: ElevatedButton(
                        onPressed: () {
                          _showOrderDetails(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red, // Button color
                          foregroundColor: Colors.white, // Text color
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        ),
                        child: const Text('Rejected'),
                      ),
                    ),
                  ),
                  Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(16.0),
                      title: const Text(
                        'Room 10 - Type A',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF27374E),
                        ),
                      ),
                      subtitle: const Text('1 hour ago'),
                      trailing: ElevatedButton(
                        onPressed: () {
                          _showOrderDetails(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF27374E), // Button color
                          foregroundColor: Colors.white, // Text color
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        ),
                        child: const Text('Waiting'),
                      ),
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

void main() {
  runApp(MaterialApp(
    home: OrderPage(),
  ));
}
