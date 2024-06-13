import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Chat App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MessagePage(),
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
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatScreen(),
                ),
              );
            },
            child: ChatCard(
              name: 'Alexa Rossie',
              profileImageUrl:
                  'https://res.cloudinary.com/dk0z4ums3/image/upload/v1695608365/attached_image/sebelum-mencintai-orang-lain-yuk-cintai-dirimu-sendiri-terlebih-dahulu.jpg',
              lastMessage:
                  'Hello, I have a question about the room availability.',
              timestamp: '10:00 AM',
            ),
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

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<ChatMessage> messages = [
    ChatMessage(
      text: 'WOY MAU SEWAAA',
      isSentByMe: false,
    ),
    ChatMessage(
      text: 'Khusus lu 100 jt pertahun',
      isSentByMe: true,
    ),
  ];

  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('images/fotoorang.jpg'),
            ),
            SizedBox(width: 8.0),
            Text('Alexa Rossie'),
          ],
        ),
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Divider(
            // Add a divider below admin messages
            color: Colors.grey,
            thickness: 1,
            height: 0.5,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return ChatMessageWidget(message: messages[index]);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textEditingController,
                    decoration: InputDecoration(
                      hintText: 'Type your message',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    String messageText = _textEditingController.text;
                    _textEditingController.clear();
                    setState(() {
                      messages.add(ChatMessage(
                        text: messageText,
                        isSentByMe: true,
                      ));
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String text;
  final bool isSentByMe;

  ChatMessage({required this.text, required this.isSentByMe});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Align(
        alignment: isSentByMe ? Alignment.bottomRight : Alignment.bottomLeft,
        child: Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: isSentByMe ? Colors.blue[200] : Colors.grey[200],
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 16.0,
              color: isSentByMe ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}

class ChatMessageWidget extends StatelessWidget {
  final ChatMessage message;

  ChatMessageWidget({required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Align(
        alignment:
            message.isSentByMe ? Alignment.bottomRight : Alignment.bottomLeft,
        child: Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: message.isSentByMe ? Colors.blue[200] : Colors.grey[200],
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Text(
            message.text,
            style: TextStyle(
              fontSize: 16.0,
              color: message.isSentByMe ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
