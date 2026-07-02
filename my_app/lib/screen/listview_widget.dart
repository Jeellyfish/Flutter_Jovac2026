import "package:flutter/material.dart";

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("List View Widget"),
        backgroundColor: Colors.deepOrange,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.settings, size:30, color: Colors.blue,),
                SizedBox(width: 20,),
                Text("Setting", style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.w500
                ),),
              ],
            ),
          ),
          Divider(),
            Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                const Icon(Icons.logout, size: 30, color: Colors.red),
                const SizedBox(width: 20),
                const Text(
                  "Logout",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                const Icon(Icons.search, size: 30, color: Colors.purple),
                const SizedBox(width: 20),
                const Text(
                  "Search",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),

          const Divider(),

          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                const Icon(Icons.favorite_border, size: 30, color: Colors.pink),
                const SizedBox(width: 20),
                const Text(
                  "Favorites",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),

          const Divider(),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                const Icon(Icons.history, size: 30, color: Colors.brown),
                const SizedBox(width: 20),
                const Text(
                  "Order History",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),

          const Divider(),

          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                const Icon(Icons.help_outline, size: 30, color: Colors.teal),
                const SizedBox(width: 20),
                const Text(
                  "Help & Support",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),

          const Divider(),

          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                const Icon(Icons.info_outline, size: 30, color: Colors.indigo),
                const SizedBox(width: 20),
                const Text(
                  "About Us",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          Divider(),
            Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                const Icon(Icons.home, size: 30, color: Colors.blue),
                const SizedBox(width: 20),
                const Text(
                  "Home",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),

          const Divider(),

          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                const Icon(Icons.person, size: 30, color: Colors.blue),
                const SizedBox(width: 20),
                const Text(
                  "Profile",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),

          const Divider(),

          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                const Icon(Icons.shopping_cart, size: 30, color: Colors.blue),
                const SizedBox(width: 20),
                const Text(
                  "Cart",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),

        ],
      )
    );
  }
}