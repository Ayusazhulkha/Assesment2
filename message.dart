import 'package:flutter/material.dart';

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
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    lastMessage,
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
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
    );
  }
}
