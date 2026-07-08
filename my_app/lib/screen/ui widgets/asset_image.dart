import "package:flutter/material.dart";

class ImageWidget extends StatelessWidget {
  const ImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Widgets"),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
              Image.asset("assets/images/burger.jpg",
              width: double.infinity,
              height: 200,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 20,),
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset("assets/images/burger.jpg",
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 20,),
              CircleAvatar(
                radius: 100,
                backgroundImage: NetworkImage("https://picsum.photos/350/200",
                ),
              )
          ],
        ),
      ),
    );
  }
}