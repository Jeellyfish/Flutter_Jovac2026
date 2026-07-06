import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isFollowing = false;

  void followUser() {
    setState(() {
      isFollowing = !isFollowing;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          isFollowing ? "Following Profile" : "Flutter Profile",
        ),
        backgroundColor:
            isFollowing ? Colors.green : Colors.blue,
        foregroundColor: Colors.white,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const CircleAvatar(
              radius: 70,
              backgroundImage: NetworkImage(
                "https://i.pravatar.cc/300",
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "John Doe",
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              "Flutter Developer",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 22,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              "john@example.com",
              style: TextStyle(fontSize: 18),
            ),

            const SizedBox(height: 40),

            ElevatedButton.icon(
              onPressed: followUser,

              icon: Icon(
                isFollowing
                    ? Icons.check
                    : Icons.person_outline,
              ),

              label: Text(
                isFollowing
                    ? "Following"
                    : "Follow",
              ),

              style: ElevatedButton.styleFrom(
                backgroundColor:
                    isFollowing ? Colors.green : Colors.blue,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
                textStyle: const TextStyle(fontSize: 22),
              ),
            ),
          ],
        ),
      ),
    );
  }
}