import "package:flutter/material.dart";
import "screen/stateless_widgets.dart";
import "screen/statefull_widget.dart";
void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: const HomeScreen(),
      home: const HomeScreen1(),
    );
  }
}