import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";

class StatelessButtonsWidget extends StatelessWidget {
  const StatelessButtonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stateless Buttons"),
        backgroundColor: Colors.blue,
        actions: [
            PopupMenuButton(
                  itemBuilder: (context) => [
                    PopupMenuItem(value: 1, child: Text("Profile")),
                    PopupMenuItem(value: 2, child: Text("Settings")),
                    PopupMenuItem(value: 3, child: Text("Logout")),
                  ],
                  onSelected: (value) {
                    print(value);
                  },
                ),
        ],
      ),
      // Floating Button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("Floating Action Button Pressed");
        },
        foregroundColor: Colors.blue,
        child: Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [
            // Elevated Buttons
            ElevatedButton(
              onPressed: () {
                print("Elevated Button Pressed");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(12),
                ),
              ),
              child: Text("Elevated Button"),
            ),
            SizedBox(height: 20),
            // Outlined Button
            OutlinedButton(
              onPressed: () {
                print("Outlined Button Pressed");
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                side: BorderSide(color: Colors.blue, width: 5),
                textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(12),
                ),
              ),
              child: Text("Outlined Button"),
            ),
            SizedBox(height: 20),
            // Outlined Button
            TextButton(
              onPressed: () {
                print("Text Button Pressed");
              },
              style: TextButton.styleFrom(
                padding: EdgeInsets.all(20),
                foregroundColor: Colors.blue,
                textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(12),
                ),
              ),
              child: Text("Text Button"),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        print("Icon Button Pressed");
                      },
                      icon: Icon(Icons.favorite, color: Colors.red, size: 35),
                    ),
                    Text("Favorite"),
                  ],
                ),
                SizedBox(width: 20),
                Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        print("Icon Button Pressed");
                      },
                      icon: Icon(Icons.settings, color: Colors.blue, size: 35),
                    ),
                    Text("Setting"),
                  ],
                ),
                SizedBox(width: 20),
                Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        print("Icon Button Pressed");
                      },
                      icon: Icon(Icons.delete, color: Colors.orange, size: 35),
                    ),
                    Text("Delete"),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            // Dropdown Button
            DropdownButton<String>(
              value: "Flutter",
              isExpanded: true,
              items: [
                DropdownMenuItem(value: "Flutter", child: Text("Flutter")),
                DropdownMenuItem(
                  value: "React Native",
                  child: Text("React Native"),
                ),
                DropdownMenuItem(value: "Android", child: Text("Android")),
                DropdownMenuItem(value: "IOS", child: Text("IOS")),
              ],
              onChanged: (value) {
                print(value);
              },
            ),
            // PopupMenuButton
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Popup Menu", style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),),
                PopupMenuButton(
                  itemBuilder: (context) => [
                    PopupMenuItem(value: 1, child: Text("Profile")),
                    PopupMenuItem(value: 2, child: Text("Settings")),
                    PopupMenuItem(value: 3, child: Text("Logout")),
                  ],
                  onSelected: (value) {
                    print(value);
                  },
                ),
              ],
            ),
              SizedBox(height: 20),
              Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BackButton(
                  color: Colors.blue,
                ),
                CloseButton(
                  color: Colors.red,
                )
              ],
              ),
              SizedBox(height: 20),
              CupertinoButton(
                color: CupertinoColors.activeBlue,
                borderRadius: BorderRadius.circular(20),
                padding:EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Text("Cupertino Button Pressed", style: TextStyle(color: CupertinoColors.white),), 
                onPressed: (){
                  print("Cupertino Button perssed");
                })
          ],
        ),
      ),
    );
  }
}