import 'package:flutter/material.dart';

class BottomNavigationWidget extends StatefulWidget {
  const BottomNavigationWidget({super.key});

  @override
  State<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  int selectedIndex = 0;
  final List<Widget> pages = [
    Center(
      child:Text(
        "🏠 Home Screen",
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ), 
    ),
Center(
      child:Text(
        "🪢 Search Screen",
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ), 
    ),
    
    Center(
      child:Text(
        "👤 Profile Screen",
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ), 
    ),Center(
      child:Text(
        "⚙ Settings Screen",
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ), 
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
          title: Text("Bottombar Navigation"),
        backgroundColor: Colors.blue,
      ),

      //Bottom Navigation
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        // type: BottomNavigationBarType.shifting,

        onTap: (index){
            setState(() {
              selectedIndex = index;
            });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Person"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings"
          ),
        ],
        ),
        // body
        body:pages[selectedIndex]
    );
  }
}