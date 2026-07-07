import "package:flutter/material.dart";

class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Screen 3"),
        backgroundColor: const Color.fromARGB(255, 129, 61, 230),
      ),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BackButton(onPressed: (){
              Navigator.pop(context);
            }, ),
            IconButton(onPressed: (){
              Navigator.pushNamed(context, 'S1');
            }, icon: Icon(Icons.home, size: 35,))
          ],
        ),

      )
    );
  }
}