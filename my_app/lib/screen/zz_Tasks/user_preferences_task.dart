import "package:flutter/material.dart";

class UserPreferencesScreen extends StatefulWidget {
  const UserPreferencesScreen({super.key});

  @override
  State<UserPreferencesScreen> createState() => _UserPreferencesScreenState();
}

class _UserPreferencesScreenState extends State<UserPreferencesScreen> {
  bool notifications = true;
  bool terms = true;
  double fontSize = 20;
  int theme = 1;
  String gender = "Female";
  int step = 1;
  String interest = "Flutter";

  final interests = ["Flutter", "AI", "Web", "Game Dev"];

  void resetAll() {
    setState(() {
      notifications = false;
      terms = false;
      fontSize = 20;
      theme = 0;
      gender = "Male";
      interest = "Flutter";
      step = 0;
    });
  }

  void save() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.green,
        content: const Text("Preferences Saved Successfully!"),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  Widget sectionIcon(IconData icon) => CircleAvatar(
        radius: 18,
        backgroundColor: Colors.deepPurple.shade50,
        child: Icon(icon, color: Colors.deepPurple),
      );

  Widget title(String text, IconData icon) => Row(
        children: [
          sectionIcon(icon),
          const SizedBox(width: 10),
          Text(text,
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ],
      );

  Widget card(Widget child) => Card(
        elevation: 2,
        margin: const EdgeInsets.only(bottom: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(padding: const EdgeInsets.all(16), child: child),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.white),
        backgroundColor: Colors.deepPurple,
        title: const Text("User Preferences",
            style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            card(Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                title("Enable Notifications", Icons.notifications),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(notifications ? "Enabled" : "Disabled"),
                    Switch(
                        value: notifications,
                        onChanged: (v) => setState(() => notifications = v))
                  ],
                )
              ],
            )),
            card(Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                title("Choose Theme", Icons.palette),
                const SizedBox(height: 10),
                ToggleButtons(
                  isSelected: [theme == 0, theme == 1],
                  fillColor: Colors.deepPurple,
                  selectedColor: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  onPressed: (i) => setState(() => theme = i),
                  children: const [
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 28),
                        child: Text("☀ Light")),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 28),
                        child: Text("🌙 Dark")),
                  ],
                )
              ],
            )),
            card(Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                title("Select Gender", Icons.person),
                Row(
                  children: ["Male", "Female", "Other"]
                      .map((g) => Expanded(
                              child: Row(children: [
                            Radio<String>(
                                value: g,
                                groupValue: gender,
                                onChanged: (v) =>
                                    setState(() => gender = v!)),
                            Flexible(child: Text(g))
                          ])))
                      .toList(),
                )
              ],
            )),
            card(Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                title("Terms & Conditions", Icons.check_box),
                CheckboxListTile(
                  value: terms,
                  contentPadding: EdgeInsets.zero,
                  title: const Text("I accept the Terms & Conditions"),
                  onChanged: (v) => setState(() => terms = v!),
                )
              ],
            )),
            card(Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                title("Font Size", Icons.text_fields),
                Row(children: [
                  const Text("10"),
                  Expanded(
                    child: Slider(
                      value: fontSize,
                      min: 10,
                      max: 30,
                      divisions: 20,
                      onChanged: (v) => setState(() => fontSize = v),
                    ),
                  ),
                  const Text("30")
                ]),
                Center(
                    child: Text(
                  "Flutter is Awesome!",
                  style: TextStyle(fontSize: fontSize),
                ))
              ],
            )),
            card(Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                title("Choose Interest", Icons.favorite),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: interests
                      .map((e) => ChoiceChip(
                            label: Text(e),
                            selected: interest == e,
                            onSelected: (_) =>
                                setState(() => interest = e),
                          ))
                      .toList(),
                )
              ],
            )),
            card(Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                title("Quick Actions", Icons.flash_on),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ActionChip(
                        avatar: const Icon(Icons.refresh),
                        label: const Text("Reset"),
                        onPressed: resetAll),
                    const SizedBox(width: 16),
                    ElevatedButton.icon(
                        onPressed: save,
                        icon: const Icon(Icons.save),
                        label: const Text("Save"))
                  ],
                )
              ],
            )),
            card(Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                title("Profile Completion", Icons.flag),
                const SizedBox(height: 20),
                Row(children: List.generate(5, (i) {
                  if (i.isOdd) {
                    return Expanded(
                        child: Divider(
                            thickness: 2,
                            color: step > i ~/ 2
                                ? Colors.deepPurple
                                : Colors.grey.shade300));
                  }
                  int idx = i ~/ 2;
                  bool active = idx <= step;
                  return CircleAvatar(
                    radius: 18,
                    backgroundColor:
                        active ? Colors.deepPurple : Colors.grey.shade300,
                    child: Text("${idx + 1}",
                        style: const TextStyle(color: Colors.white)),
                  );
                })),
                const SizedBox(height: 10),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Personal"),
                    Text("Preferences"),
                    Text("Finish")
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OutlinedButton(
                        onPressed: () {
                          if (step > 0) {
                            setState(() => step--);
                          }
                        },
                        child: const Text("Cancel")),
                    ElevatedButton(
                        onPressed: () {
                          if (step < 2) {
                            setState(() => step++);
                          }
                        },
                        child: const Text("Continue"))
                  ],
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
