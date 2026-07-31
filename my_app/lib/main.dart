import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const PlacementApp());
}

class PlacementApp extends StatelessWidget {
  const PlacementApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Placement Registration',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const RegistrationScreen(),
    );
  }
}

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController rollController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController cgpaController = TextEditingController();

  String branch = "Computer Science";
  bool interested = true;

  final List<String> branches = [
    "Computer Science",
    "Information Technology",
    "Electronics",
    "Mechanical",
    "Civil",
    "Electrical",
  ];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      nameController.text = prefs.getString("name") ?? "";
      rollController.text = prefs.getString("roll") ?? "";
      emailController.text = prefs.getString("email") ?? "";
      mobileController.text = prefs.getString("mobile") ?? "";
      cgpaController.text = prefs.getString("cgpa") ?? "";
      branch = prefs.getString("branch") ?? "Computer Science";
      interested = prefs.getBool("interest") ?? true;
    });
  }

  Future<void> saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString("name", nameController.text);
    await prefs.setString("roll", rollController.text);
    await prefs.setString("email", emailController.text);
    await prefs.setString("mobile", mobileController.text);
    await prefs.setString("cgpa", cgpaController.text);
    await prefs.setString("branch", branch);
    await prefs.setBool("interest", interested);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Registration Saved Successfully!"),
        backgroundColor: Colors.green,
      ),
    );
  }

  Future<void> clearData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    setState(() {
      nameController.clear();
      rollController.clear();
      emailController.clear();
      mobileController.clear();
      cgpaController.clear();
      branch = "Computer Science";
      interested = true;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Form Cleared"),
      ),
    );
  }

  Widget buildTextField(
      String label,
      IconData icon,
      TextEditingController controller,
      TextInputType type,
      ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: controller,
        keyboardType: type,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Required";
          }
          return null;
        },
        decoration: InputDecoration(
          prefixIcon: Icon(icon,color: Colors.deepPurple),
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Student Placement Registration"),
        backgroundColor: Colors.deepPurple,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Form(
          key: _formKey,

          child: Column(

            children: [

              const SizedBox(height: 10),

              Image.network(
                "https://cdn-icons-png.flaticon.com/512/3135/3135755.png",
                height: 120,
              ),

              const SizedBox(height: 15),

              const Text(
                "Register Your Details",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              buildTextField(
                "Student Name",
                Icons.person,
                nameController,
                TextInputType.name,
              ),

              buildTextField(
                "Roll Number",
                Icons.badge,
                rollController,
                TextInputType.text,
              ),

              buildTextField(
                "Email",
                Icons.email,
                emailController,
                TextInputType.emailAddress,
              ),

              buildTextField(
                "Mobile Number",
                Icons.phone,
                mobileController,
                TextInputType.phone,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: DropdownButtonFormField<String>(
                  value: branch,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.apartment,
                      color: Colors.deepPurple,
                    ),
                    labelText: "Branch",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  items: branches.map((value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      branch = value!;
                    });
                  },
                ),
              ),

              buildTextField(
                "CGPA",
                Icons.bar_chart,
                cgpaController,
                const TextInputType.numberWithOptions(decimal: true),
              ),

              const SizedBox(height: 10),

              Card(
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.work,
                        color: Colors.deepPurple,
                      ),
                      const SizedBox(width: 10),
                      const Expanded(
                        child: Text(
                          "Interested in Placement",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      Switch(
                        value: interested,
                        activeColor: Colors.deepPurple,
                        onChanged: (value) {
                          setState(() {
                            interested = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Row(
                children: [

                  Expanded(
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      onPressed: () {

                        if (_formKey.currentState!.validate()) {

                          saveData();

                        }

                      },
                      icon: const Icon(Icons.save,color: Colors.white),
                      label: const Text(
                        "SAVE DETAILS",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),

                  const SizedBox(width: 10),

                  Expanded(
                    child: OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      onPressed: clearData,
                      icon: const Icon(Icons.delete),
                      label: const Text("CLEAR FORM"),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 15),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                  onPressed: () {

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const DashboardScreen(),
                      ),
                    );

                  },
                  icon: const Icon(Icons.dashboard,color: Colors.white),
                  label: const Text(
                    "VIEW DASHBOARD",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

            ],
          ),
        ),
      ),
    );
  }
}

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  String name = "";
  String roll = "";
  String email = "";
  String mobile = "";
  String branch = "";
  String cgpa = "";
  bool interested = false;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      name = prefs.getString("name") ?? "";
      roll = prefs.getString("roll") ?? "";
      email = prefs.getString("email") ?? "";
      mobile = prefs.getString("mobile") ?? "";
      branch = prefs.getString("branch") ?? "";
      cgpa = prefs.getString("cgpa") ?? "";
      interested = prefs.getBool("interest") ?? false;
    });
  }

  Future<void> deleteData() async {

    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.clear();

    if (mounted) {

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Details Deleted Successfully"),
          backgroundColor: Colors.red,
        ),
      );

      Navigator.pop(context);
    }
  }

  Widget detailTile(
    IconData icon,
    String title,
    String value,
  ) {

    return ListTile(
      leading: Icon(
        icon,
        color: Colors.deepPurple,
      ),
      title: Text(title),
      trailing: Text(
        value,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Placement Dashboard"),
        backgroundColor: Colors.deepPurple,
      ),

      body: SingleChildScrollView(

        padding: const EdgeInsets.all(16),

        child: Column(

          children: [

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [

                  const CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.green,
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),

                  const SizedBox(width: 15),

                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [

                        Text(
                          "Welcome, $name!",
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 5),

                        const Text(
                          "Your placement details are saved.",
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(15),
              ),

              child: Column(

                children: [

                  detailTile(
                    Icons.person,
                    "Student Name",
                    name,
                  ),

                  const Divider(height: 1),

                  detailTile(
                    Icons.badge,
                    "Roll Number",
                    roll,
                  ),

                  const Divider(height: 1),

                  detailTile(
                    Icons.email,
                    "Email",
                    email,
                  ),

                  const Divider(height: 1),

                  detailTile(
                    Icons.phone,
                    "Mobile Number",
                    mobile,
                  ),

                  const Divider(height: 1),

                  detailTile(
                    Icons.school,
                    "Branch",
                    branch,
                  ),

                  const Divider(height: 1),

                  detailTile(
                    Icons.bar_chart,
                    "CGPA",
                    cgpa,
                  ),

                  const Divider(height: 1),

                  ListTile(
                    leading: const Icon(
                      Icons.workspace_premium,
                      color: Colors.deepPurple,
                    ),

                    title:
                        const Text("Placement Status"),

                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [

                        Icon(
                          interested
                              ? Icons.check_circle
                              : Icons.cancel,
                          color: interested
                              ? Colors.green
                              : Colors.red,
                        ),

                        const SizedBox(width: 5),

                        Text(
                          interested
                              ? "Interested"
                              : "Not Interested",
                          style: TextStyle(
                            color: interested
                                ? Colors.green
                                : Colors.red,
                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                onPressed: () async {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.edit,
                  color: Colors.white,
                ),
                label: const Text(
                  "EDIT DETAILS",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 12),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                onPressed: () async {

                  bool? confirm = await showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("Delete Details"),
                        content: const Text(
                          "Are you sure you want to delete all saved placement details?",
                        ),
                        actions: [

                          TextButton(
                            onPressed: () {
                              Navigator.pop(context, false);
                            },
                            child: const Text("Cancel"),
                          ),

                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                            ),
                            onPressed: () {
                              Navigator.pop(context, true);
                            },
                            child: const Text(
                              "Delete",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),

                        ],
                      );
                    },
                  );

                  if (confirm == true) {
                    deleteData();
                  }
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
                label: const Text(
                  "DELETE DETAILS",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}