import "package:flutter/material.dart";

class InkWellWidget extends StatelessWidget {
  const InkWellWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Material(
          color: Colors.deepOrange,
          child: GestureDetector(
            onTap: (){
              print("COntainer has been clicked");
            },
            onDoubleTap: (){
              print("Double Tapped");
            },
            onLongPress: (){
              print("COntianer Long Pressed");
            },
            child: Container(
              width: 250,
              height: 100,
              alignment: Alignment.center,
              

              child: Text("Click Me"),
            
            ),
          ),
        ),
      )
    );
  }
}