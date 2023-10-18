import 'package:flutter/material.dart';
import 'dart:math';

class ChatMessage {
  final String sender;
  final String message;
  final String timestamp;

  ChatMessage({
    required this.sender,
    required this.message,
    required this.timestamp,
  });
}

class ChatMessage1 {
  final String sender;
  final String message;
  final String timestamp;
  final Color color;

  ChatMessage1({
    required this.sender,
    required this.message,
    required this.timestamp,
    required this.color,
  });
}

void main() {
  runApp(ChatApp());
}

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('ChitChat Club'),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.grid_on), text: 'Grid View'),
              Tab(icon: Icon(Icons.list), text: 'List View'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            GridViewTabScreen(),
            ListViewTabScreen(),
          ],
        ),
      ),
    );
  }
}

//final List<String> items = List.generate(20, (index) => "Clock ${index + 1}");
class GridViewTabScreen extends StatelessWidget {
  final List<ChatMessage> chatMessages = List.generate(
    20,
    (index) => ChatMessage(
      sender: "User ${index + 1}",
      message: "Hello! This is message ${index + 1}.",
      timestamp: "12:3${index}",
    ),
  );

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: chatMessages.length,
      itemBuilder: (context, index) {
        return Card(
          color: _getRandomColor(), // Random color for each card
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  chatMessages[index].sender,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  chatMessages[index].message,
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
                SizedBox(height: 8),
                Text(
                  chatMessages[index].timestamp,
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Function to get a random color
  Color _getRandomColor() {
    final random = Random();
    return Colors.primaries[random.nextInt(Colors.primaries.length)];
  }
}

class ListViewTabScreen extends StatelessWidget {
  final List<ChatMessage1> chatMessages = List.generate(
    20,
    (index) => ChatMessage1(
      sender: "User ${index + 1}",
      message: "Hello! This is message ${index + 1}.",
      timestamp: "12:3${index}",
      color: _getRandomColor(),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: chatMessages.length,
      itemBuilder: (context, index) {
        return ListTile(
          tileColor: chatMessages[index].color, // Use color for tile background
          title: Text(
            chatMessages[index].message,
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
          subtitle: Text(
            "${chatMessages[index].sender} • ${chatMessages[index].timestamp}",
            style: TextStyle(fontSize: 12, color: Colors.white),
          ),
          onTap: () {
            // Handle item tap here
          },
        );
      },
    );
  }

  // Function to get a random color
  static Color _getRandomColor() {
    final random = Random();
    return Colors.primaries[random.nextInt(Colors.primaries.length)];
  }
}
