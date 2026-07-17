import 'package:flutter/material.dart';

class AlertDialogWidget extends StatelessWidget {
  const AlertDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dialog Widgets"),
        backgroundColor: Colors.blue,
      ),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              showDialog(
                context: context, 
                builder: (context){
                  return AlertDialog(
                    icon: Icon(Icons.warning_amber_rounded, size: 60, color: Colors.amber,),
                    title: Text("Delete Record"),
                    content: Text("Are you sure to delete this record?"),
                    actions: [
                      TextButton(onPressed: (){
                        print("Delete Cancelled");
                        Navigator.pop(context);
                      }, child: Text("Cancel")),
                      ElevatedButton(onPressed: (){
                        print("Record Deleted");
                        Navigator.pop(context);
                      }, child: Text("Delete"))
                    ],
                  );
                }
                );
            }, child: Text("Call Alert Dialog Widget")),

            // Simple DIalog WIdget
            ElevatedButton(onPressed: (){
              showDialog(

                context: context, 
                builder: (context){
                  return SimpleDialog(
                    title: Text("Select Language"),
                    children: [
                    SimpleDialogOption(
                      onPressed: (){
                          print("English Languge Selected");
                      },
                      child: Text("English"),
                    ),  
                    SimpleDialogOption(
                      onPressed: (){
                          print("Hindi Languge Selected");
                      },
                      child: Text("Hindi"),
                    ),  
                    SimpleDialogOption(
                      onPressed: (){
                          print("Marathi Languge Selected");
                      },
                      child: Text("Marathi"),
                    ),  
                    SimpleDialogOption(
                      onPressed: (){
                          print("Punjabi Languge Selected");
                      },
                      child: Text("Punjabi"),
                    ),  
                    ],

                  );
                });
            }, child: Text("Simple Dialog Widget")),

            // About Dialog Widget
          ElevatedButton(onPressed: (){
            showAboutDialog(
              context: context,
              applicationName: "FLutter Training App",
              applicationVersion: "Version 2.0",
              applicationIcon: FlutterLogo(size:60),
              children: [
                Text("Flutter Training Program"),
                SizedBox(height: 10,),
                Text("Presented By:"),
                SizedBox(height: 10,),
                Text("Beta Labs Learning Solutions", style: TextStyle(fontWeight: FontWeight.bold),)
              ]
              );
          }, child: Text("About App"))
          ],
        ),
      )
    );
  }
}