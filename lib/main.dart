import 'package:cocktail/screen/loadingpage.dart';
import 'package:cocktail/screen/welcomepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'cocktail app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:
          // const loadingpage(),
          const welcomepage(),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Cocktail Recipe"),
//       ),
//       body: Text("starting page"),

//       //
//     );
//   }
// }
