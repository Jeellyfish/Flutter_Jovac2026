import 'package:flutter/material.dart';

class CircularProgressDemo extends StatelessWidget {
  const CircularProgressDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CircularProgressIndicator Demo"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Example 1
            const Text(
              "1. Default Circular Progress",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            const Center(
              child: CircularProgressIndicator(),
            ),

            const Divider(height: 40),

            // Example 2
            const Text(
              "2. Progress with Custom Color",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            const Center(
              child: CircularProgressIndicator(
                color: Colors.green,
              ),
            ),
          const SizedBox(height: 15),
          Divider(),
            // Example 3
            const Text(
              "3. Large Sized Progress",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            const Center(
              child: SizedBox(
                height: 100,
                width: 100,
                child: CircularProgressIndicator(
                  strokeWidth: 10,
                  color: Colors.red,
                ),
              ),
            ),

            const Divider(height: 40),

          
            // Example 4
            const Text(
              "4. Progress with Percentage",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: const [
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: CircularProgressIndicator(
                      value: 0.75,
                      strokeWidth: 8,
                      color: Colors.indigo,
                    ),
                  ),
                  Text(
                    "75%",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}