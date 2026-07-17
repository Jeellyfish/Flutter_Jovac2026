import 'package:flutter/material.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BottomSheet Widget"),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Selectable Text Widget", style: TextStyle(fontWeight: FontWeight.bold),),
            Padding(

              padding: const EdgeInsets.all(8.0),
              child: SelectableText(
                
                "SelectableText is a Flutter widget that displays text that users can select, copy, and interact with. Unlike the normal Text widget, it allows users to highlight and copy the displayed text",
              
              ),
            ),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
                showModalBottomSheet(
                  context: context, 
                  builder: (context){
                      return Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Text("Choose an Option",
                            style: TextStyle(fontSize: 20),
                            ), 
                            SizedBox(height: 20,),
                            ListTile(
                              leading: Icon(Icons.camera_alt, color: Colors.blue,),
                              title: Text("Camera"),
                              onTap: (){
                                print("Camera Slelected");
                                Navigator.pop(context);
                              },
                            ),
                            ListTile(
                              leading: Icon(Icons.photo, color: Colors.red,),
                              title: Text("Gallary"),
                              onTap: (){
                                print("Gallary Slelected");
                                Navigator.pop(context);
                              },
                            ),
                            ListTile(
                              leading: Icon(Icons.share, color: Colors.green,),
                              title: Text("Share"),
                              onTap: (){
                                print("Share Photos");
                                Navigator.pop(context);
                              },
                            ),
                            ListTile(
                              leading: Icon(Icons.cancel, color: Colors.grey,),
                              title: Text("Cancel"),
                              onTap: (){
                                print("Cancel Slelected");
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      );
                  }
                  );
            }, child: Text("BottomSheet Widget")),
          ],
        ),
      ),
    );
  }
}