// main.dart
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'assignment.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'LTG POS',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.lightGreen,
        ),
      home: Assignment(),
    );
  }
}

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   // This variable holds the text typeed by the user
//   String _enteredText = '';
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Kindacode.com'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Center(
//           child: TextField(
//             onChanged: (value) {
//               setState(() {
//                 _enteredText = value;
//               });
//             },
//             decoration: InputDecoration(
//                 labelText: 'Your Name',
//                 border: const OutlineInputBorder(),
//                 // Display the number of entered characters
//                 counterText: '${_enteredText.length.toString()} character(s)'),
//           ),
//         ),
//       ),
//     );
//   }
// }