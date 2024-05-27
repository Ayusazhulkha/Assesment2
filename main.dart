import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      routes: {
        '/message': (context) => MessagePage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification'),
        actions: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8.0),
            decoration: BoxDecoration(
              color: Colors.lightBlueAccent,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: Icon(Icons.notifications, color: Colors.white),
              onPressed: () {
                // Handle notification tap
              },
            ),
          ),
          IconButton(
            icon: Icon(Icons.message),
            onPressed: () {
              Navigator.pushNamed(context, '/message');
            },
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          RenterCard(
            name: 'Alexa Rossie',
            profileImageUrl:
                'https://res.cloudinary.com/dk0z4ums3/image/upload/v1695608365/attached_image/sebelum-mencintai-orang-lain-yuk-cintai-dirimu-sendiri-terlebih-dahulu.jpg', // URL foto profil
            paymentDetails: 'Payment for Room Type A, No. 11',
            onReview: () {
              // Handle review action
            },
            onDecline: () {
              // Handle decline action
            },
            onApprove: () {
              // Handle approve action
            },
          ),
          Divider(),
          RenterCard(
            name: 'Oppa Kaesang',
            profileImageUrl:
                'https://media.suara.com/pictures/653x366/2022/10/24/57468-kaesang-pangarep.jpg', // URL foto profil
            paymentDetails: 'Payment for Room Type B, No. 5',
            onReview: () {
              // Handle review action
            },
            onDecline: () {
              // Handle decline action
            },
            onApprove: () {
              // Handle approve action
            },
          ),
          Divider(),
          RenterCard(
            name: 'Via Vallen',
            profileImageUrl:
                'https://media.suara.com/pictures/653x366/2024/03/14/57348-potret-syahrini.webp', // URL foto profil
            paymentDetails: 'Payment for Room Type C, No. 7',
            onReview: () {
              // Handle review action
            },
            onDecline: () {
              // Handle decline action
            },
            onApprove: () {
              // Handle approve action
            },
          ),
        ],
      ),
    );
  }
}

class RenterCard extends StatelessWidget {
  final String name;
  final String profileImageUrl;
  final String paymentDetails;
  final VoidCallback onReview;
  final VoidCallback onDecline;
  final VoidCallback onApprove;

  RenterCard({
    required this.name,
    required this.profileImageUrl,
    required this.paymentDetails,
    required this.onReview,
    required this.onDecline,
    required this.onApprove,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(profileImageUrl),
                  radius: 30,
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        paymentDetails,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.normal),
                      ),
                      SizedBox(
                          height:
                              16), // Add some spacing between text and buttons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            onPressed: onReview,
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            child: Text('Review'),
                          ),
                          SizedBox(width: 8),
                          ElevatedButton(
                            onPressed: onDecline,
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            child: Text('Decline'),
                          ),
                          SizedBox(width: 8),
                          ElevatedButton(
                            onPressed: onApprove,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromRGBO(140, 171, 196,
                                  1), // Set the background color to blue
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            child: const Text('Approve'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MessagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Messages'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          ChatCard(
            name: 'Alexa Rossie',
            profileImageUrl:
                'https://res.cloudinary.com/dk0z4ums3/image/upload/v1695608365/attached_image/sebelum-mencintai-orang-lain-yuk-cintai-dirimu-sendiri-terlebih-dahulu.jpg',
            lastMessage:
                'Hello, I have a question about the room availability.',
            timestamp: '10:00 AM',
          ),
          Divider(),
          ChatCard(
            name: 'Kim Oppa',
            profileImageUrl:
                'https://media.suara.com/pictures/653x366/2022/10/24/57468-kaesang-pangarep.jpg',
            lastMessage: 'Can I schedule a visit for next week?',
            timestamp: '9:30 AM',
          ),
          Divider(),
          ChatCard(
            name: 'Via Vallen',
            profileImageUrl:
                'https://media.suara.com/pictures/653x366/2024/03/14/57348-potret-syahrini.webp',
            lastMessage: 'What are the payment options available?',
            timestamp: 'Yesterday',
          ),
        ],
      ),
    );
  }
}

class ChatCard extends StatelessWidget {
  final String name;
  final String profileImageUrl;
  final String lastMessage;
  final String timestamp;

  ChatCard({
    required this.name,
    required this.profileImageUrl,
    required this.lastMessage,
    required this.timestamp,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatPage(name: name),
            ),
          );
        },
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(profileImageUrl),
                radius: 30,
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      lastMessage,
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 16),
              Text(
                timestamp,
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChatPage extends StatelessWidget {
  final String name;

  ChatPage({required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat with $name'),
      ),
      body: Center(
        child: Text(
          'Chat Room with $name', // Isi konten chat di sini
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
