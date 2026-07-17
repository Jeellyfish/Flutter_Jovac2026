import 'package:flutter/material.dart';

class TooltipDemo extends StatelessWidget {
  const TooltipDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Tooltip Examples"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Tooltip(
                message: "Add New Item",
                child: Icon(
                  Icons.add_circle,
                  size: 60,
                  color: Colors.blue,
                ),
              ),
            ),

            const Divider(height: 40),
            const SizedBox(height: 10),
            Center(
              child: Tooltip(
                message: "Delete Permanently",
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(12),
                ),
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                padding: const EdgeInsets.all(12),
                child: const Icon(
                  Icons.delete,
                  size: 60,
                  color: Colors.red,
                ),
              ),
            ),

            const Divider(height: 40),

            const SizedBox(height: 15),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Tooltip(
                  message: "Home",
                  child: Icon(Icons.home, size: 40),
                ),
                Tooltip(
                  message: "Search",
                  child: Icon(Icons.search, size: 40),
                ),
                Tooltip(
                  message: "Favorite",
                  child: Icon(Icons.favorite,
                      size: 40, color: Colors.red),
                ),
                Tooltip(
                  message: "Profile",
                  child: Icon(Icons.person, size: 40),
                ),
              ],
            ), 
          
          ],
        ),
      ),
    );
  }
}