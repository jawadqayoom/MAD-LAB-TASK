import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required String title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // bool java = false;
  // bool kotlin = false;
  //bool dart = false;
  //String skill = "";
  //double currentsliderval = 0.0;
  List options = ["Android", "dart", "Java", "ruby", "shafay"];
  String? choosenvalue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("hello app")),
      body: Row(children: [
        const Text("select skills:"),
        const SizedBox(
          width: 10,
        ),
        DropdownButton(
            value: choosenvalue,
            items: options
                .map((e) => DropdownMenuItem<String>(value: e, child: Text(e)))
                .toList(),
            onChanged: (value) {
              setState(() {
                choosenvalue = value!;
              });
            })
        // Slider(
        //     value: currentsliderval,
        //     divisions: 100,
        //     min: 0,
        //     max: 100,
        //     label: currentsliderval.toString(),
        //     onChanged: (value) {
        //       setState(() {
        //         currentsliderval = value;
        //       });
        //     })
        // const Text('JAVA'),
        // Radio(
        //   groupValue: skill,
        //   value: "java",
        //   onChanged: (value) {
        //     setState(() {
        //       skill = value!.toString();
        //     });
        //   },
        // ),
        // const Text('Kotlin'),
        // Radio(
        //   value: "kotlin",
        //   onChanged: (value) {
        //     setState(() {
        //       skill = value!;
        //     });
        //   },
        //   groupValue: skill,
        // ),
        // const Text('DArt'),
        // Checkbox(
        //     value: dart,
        //     onChanged: (value) {
        //       setState(() {
        //         dart = value!;
        //       });
        //     }),
      ]),
    );
  }
}
