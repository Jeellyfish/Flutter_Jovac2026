import 'package:flutter/material.dart';

class NotificationsWidgets extends StatelessWidget {
  const NotificationsWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Snackbar Widgets"),
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Student Registration Successfull"),
                    // duration: Duration(milliseconds: 200),
                    )
                );
            }, child: Text("Simple Snackbar")),
            ElevatedButton(onPressed: (){
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content:Row(children: [
                    Icon(Icons.check_circle, color: Colors.white,),
                    SizedBox(width: 20,),
                    Text("Registration Successfully")
                  ]),
                  backgroundColor: Colors.green,
              )
              );
            }, child: Text("Icon Snackbar")),
            ElevatedButton(onPressed: (){
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Record Deleted"),
                  action: SnackBarAction(
                    label: "UNDO", 
                    onPressed: (){
                      print("Undo Clicked");
                    }
                    ),
                  ),
              );
            }, child: Text("Snackbar with Actions")),
          ],
        ),
      ),
    );
  }
}