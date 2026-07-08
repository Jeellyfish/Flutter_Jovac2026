import 'package:flutter/material.dart';

class HomeScreen1 extends StatefulWidget {
    const HomeScreen1({super.key});

    @override
    State<HomeScreen1> createState() => _HomeScreen1State();
}

class _HomeScreen1State extends State<HomeScreen1> {
    String appBarTitle = "Flutter App";
    String buttonText = "Follow";
    Color buttonColor = Colors.blue;

    void updateState() {
        setState(() {
        appBarTitle = "My Profile";
    });
    print(appBarTitle);
    buttonColor = Colors.green;
    buttonText = "Followed";
    }

    @override
    Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text(
            appBarTitle,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
        ),
        body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            CircleAvatar(
                radius: 70,
                backgroundColor: Colors.purple,
                child: Icon(Icons.person, size: 90, color: Colors.white),
            ),
            Text(
                "Pankaj Kapoor",
                textDirection: TextDirection.ltr,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Text(
                "Flutter Devloper",
                textDirection: TextDirection.ltr,
                style: TextStyle(
                color: const Color.fromARGB(255, 7, 7, 7),
                fontSize: 15,
                fontWeight: FontWeight.bold,
                ),
            ),
            ElevatedButton(
                onPressed: updateState,
                style: ElevatedButton.styleFrom(
                backgroundColor: buttonColor,
                foregroundColor: Colors.white,
                ),
                child: Text(buttonText),
            ),
            ],
        ),
        ),
    );
    }
}
