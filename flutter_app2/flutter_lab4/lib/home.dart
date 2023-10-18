import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("home"),
      ),
      body: Column(
        children: [
          const Text("Home Screen"),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed("/details");
              arguments:
              "Data from home";
            },
            child: const Text('click'),
          )
        ],
      ),
    );
  }
}
