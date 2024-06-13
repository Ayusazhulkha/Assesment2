import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Chat App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChatScreen(),
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
      text: 'WOYY MAU SEWAAA',
      isSentByAdmin: false,
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
              backgroundImage: AssetImage('images/admin.png'),
            ),
            SizedBox(width: 8.0),
            Text('Admin'),
          ],
        ),
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            // Handle close button press
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
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: ElevatedButton(
                    onPressed: () {
                      // Logic for "Ajukan Sewa" button
                    },
                    child: Text('Ajukan Sewa'),
                  ),
                ),
                SizedBox(height: 8.0),
                Row(
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
                        // Handle send button press
                        String messageText = _textEditingController.text;
                        _textEditingController.clear();
                        setState(() {
                          messages.add(ChatMessage(
                            text: messageText,
                            isSentByAdmin:
                                false, // Message sent by the customer
                          ));
                        });
                      },
                    ),
                  ],
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
  final bool isSentByAdmin;

  ChatMessage({required this.text, required this.isSentByAdmin});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Align(
        alignment: isSentByAdmin ? Alignment.bottomLeft : Alignment.bottomRight,
        child: Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: isSentByAdmin ? Colors.grey[200] : Colors.blue[200],
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 16.0,
              color: isSentByAdmin ? Colors.black : Colors.white,
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!message
            .isSentByAdmin) // If the message is from the customer, add a divider
          Container(
            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Align(
              alignment: message.isSentByAdmin
                  ? Alignment.bottomLeft
                  : Alignment.bottomRight,
              child: Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: message.isSentByAdmin
                      ? Colors.grey[200]
                      : Colors.blue[200],
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Text(
                  message.text,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: message.isSentByAdmin ? Colors.black : Colors.white,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
