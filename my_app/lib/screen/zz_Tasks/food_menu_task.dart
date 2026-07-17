import 'package:flutter/material.dart';

class FoodListScreen extends StatelessWidget {
  FoodListScreen({super.key});

  final List<Map<String, String>> foodItems = [
    {
      "emoji": "🍔",
      "name": "Cheese Burger",
      "price": "₹149",
    },
    {
      "emoji": "🍕",
      "name": "Veg Pizza",
      "price": "₹199",
    },
    {
      "emoji": "🍝",
      "name": "Pasta",
      "price": "₹179",
    },
    {
      "emoji": "🥪",
      "name": "Sandwich",
      "price": "₹99",
    },
    {
      "emoji": "🥤",
      "name": "Cold Drink",
      "price": "₹49",
    },
    {
      "emoji": "🍦",
      "name": "Ice Cream",
      "price": "₹69",
    },
    {
      "emoji": "🍰",
      "name": "Chocolate Cake",
      "price": "₹149",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ListView Example"),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: foodItems.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 3,
              margin: const EdgeInsets.symmetric(vertical: 6),
              child: Column(
                children: [
                  ListTile(
                    leading: Text(
                      foodItems[index]["emoji"]!,
                      style: const TextStyle(fontSize: 35),
                    ),
                    title: Text(
                      foodItems[index]["name"]!,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      foodItems[index]["price"]!,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    trailing: const Icon(
                      Icons.add_shopping_cart,
                      color: Colors.green,
                      size: 30,
                    ),
                  ),
                  const Divider(height: 1),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}