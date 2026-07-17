import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SmartCafeScreen extends StatefulWidget {
  const SmartCafeScreen({super.key});

  @override
  State<SmartCafeScreen> createState() => _SmartCafeScreenState();
}

class _SmartCafeScreenState extends State<SmartCafeScreen> {
  final Map<String, Map<String, String>> menu = {
    "Burger": {
      "name": "Veg Burger",
      "price": "₹120",
      "desc": "Delicious veg burger with fresh veggies and cheese.",
      "emoji": "🍔"
    },
    "Pizza": {
      "name": "Margherita Pizza",
      "price": "₹180",
      "desc": "Cheesy pizza with fresh basil.",
      "emoji": "🍕"
    },
    "Sandwich": {
      "name": "Veg Sandwich",
      "price": "₹90",
      "desc": "Healthy grilled sandwich.",
      "emoji": "🥪"
    },
    "Cold Coffee": {
      "name": "Cold Coffee",
      "price": "₹80",
      "desc": "Creamy chilled coffee.",
      "emoji": "☕"
    },
    "French Fries": {
      "name": "French Fries",
      "price": "₹70",
      "desc": "Crispy golden fries.",
      "emoji": "🍟"
    },
  };

  String category = "Burger";
  int qty = 1;

  void showMsg(String text) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(text)));
  }

  @override
  Widget build(BuildContext context) {
    final item = menu[category]!;

    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text("Smart Café"),
        actions: const [Icon(Icons.more_vert)],
        backgroundColor: Colors.deepPurpleAccent,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: const Text("Today's Special"),
              content: const Text("Veg Burger\nOnly ₹99"),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Close"))
              ],
            ),
          );
        },
        label: const Text("Today's Special"),
        icon: const Icon(Icons.restaurant),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text("Choose Category",
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.deepPurpleAccent)),
          const SizedBox(height: 8),
          DropdownButtonFormField<String>(
            value: category,
            decoration: const InputDecoration(border: OutlineInputBorder()),
            items: menu.keys
                .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                .toList(),
            onChanged: (v) => setState(() => category = v!),
          ),
          const SizedBox(height: 20),
          const Text("Selected Item",
              style: TextStyle(fontWeight: FontWeight.bold)),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(children: [
                CircleAvatar(
                  radius: 35,
                  child: Text(item["emoji"]!, style: const TextStyle(fontSize: 35)),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item["name"]!,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        Text(item["desc"]!),
                        const SizedBox(height: 5),
                        Text(item["price"]!,
                            style: const TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold))
                      ]),
                ),
                PopupMenuButton<String>(
                  onSelected: showMsg,
                  itemBuilder: (_) => const [
                    PopupMenuItem(value: "Add Cheese", child: Text("🧀 Add Cheese")),
                    PopupMenuItem(value: "Extra Sauce", child: Text("🌶 Extra Sauce")),
                    PopupMenuItem(value: "View Nutrition", child: Text("🌿 View Nutrition")),
                    PopupMenuItem(value: "Share Item", child: Text("🔗 Share Item")),
                  ],
                )
              ]),
            ),
          ),
          const SizedBox(height: 20),
          const Text("Quantity",
              style: TextStyle(fontWeight: FontWeight.bold)),
          Row(children: [
            IconButton(
                onPressed: () {
                  if (qty > 1) setState(() => qty--);
                },
                icon: const Icon(Icons.remove_circle, size: 40)),
            Text("$qty", style: const TextStyle(fontSize: 24)),
            IconButton(
                onPressed: () => setState(() => qty++),
                icon: const Icon(Icons.add_circle,
                    size: 40, color: Colors.deepPurple))
          ]),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () => showMsg("Order Placed Successfully!"),
              icon: const Icon(Icons.shopping_cart),
              label: const Text("Place Order"),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () => showMsg("Saved for later"),
              child: const Text("Save for Later"),
            ),
          ),
          Center(
            child: TextButton.icon(
              onPressed: () {
                setState(() {
                  qty = 1;
                  category = "Burger";
                });
                showMsg("Selection Cleared");
              },
              icon: const Icon(Icons.delete, color: Colors.red),
              label: const Text("Clear Selection",
                  style: TextStyle(color: Colors.red)),
            ),
          ),
          const Divider(height: 40),
          const Center(child: Text("Order on iPhone Style")),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: CupertinoButton.filled(
              onPressed: () => showMsg("iOS Order Placed"),
              child: const Text(" Order on iPhone Style"),
            ),
          ),
        ]),
      ),
    );
  }
}
