import "package:flutter/material.dart";

class FlexibleWidget extends StatelessWidget {
  const FlexibleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Flexible Widget"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(Icons.email, size: 35,),
            SizedBox(width: 20,),
            Flexible(child: Text("pankajkapoor.flutterdeveloper@gmail.com"))
          ],
        ),
      )
    );
  }
}