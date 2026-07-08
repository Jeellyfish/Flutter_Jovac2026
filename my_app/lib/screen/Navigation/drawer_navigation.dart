import 'package:flutter/material.dart';

class DrawerNavigationWidget extends StatefulWidget {
  const DrawerNavigationWidget({super.key});

  @override
  State<DrawerNavigationWidget> createState() => _DrawerNavigationWidgetState();
}

class _DrawerNavigationWidgetState extends State<DrawerNavigationWidget> {
  int selectedPage = 0;
  final List<Widget> pages = [
    Center(
      child:Text(
        "🏠 Home Screen",
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ), 
    ),

    Center(
      child:Text(
        "👤 Profile Screen",
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ), 
    ),

    Center(
      child:Text(
        "⚙ Settings Screen",
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ), 
    ),

    Center(
      child:Text(
        "📞 Contact Screen",
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ), 
    ),

    Center(
      child:Text(
        "🪢 Share Screen",
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ), 
    ),

    Center(
      child:Text(
        "🚪 Logout Screen",
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ), 
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Drawer Navigation"),
        backgroundColor: Colors.blue,
        // Drawer Widget
      ),
        drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, size: 35,color: Colors.purple,),
                  ),
                  SizedBox(width: 20,), 
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Pankaj Kapoor", style: TextStyle(fontSize: 16),),
                      Text("pankaj@gmail.com", style: TextStyle(fontSize: 12),),
                    ],
                  ) 
                ],
              )
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text("Home"),
                onTap: (){
                  print("Home Clicked");
                  setState(() {
                    selectedPage = 0;
                  });
                  Navigator.pop(context);
                },

              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text("Profile"),
                onTap: (){
                  print("Profile Clicked");
                  setState(() {
                    selectedPage = 1;
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text("Settings"),
                onTap: (){
                  print("Settings Clicked");
                  setState(() {
                    selectedPage = 2;
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.phone, color: Colors.red,),
                title: Text("Contact"),
                onTap: (){
                  print("Contact Clicked");
                  setState(() {
                    selectedPage = 3;
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.share),
                title: Text("Share"),
                onTap: (){
                  print("Share Clicked");
                  setState(() {
                    selectedPage = 4;
                  });
                  Navigator.pop(context);
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.logout_sharp),
                title: Text("Logout"),
                onTap: (){
                  setState(() {
                    selectedPage = 5;
                  });
                  print("Logout Clicked");
                  Navigator.pop(context);
                },
              ),
              
          ],
        ),
      ),
      body: pages[selectedPage],
    );
  }
}