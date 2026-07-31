import 'package:flutter/material.dart';

import '../database/database_helper.dart';
import '../models/student.dart';
import 'package:my_app/screens/student_list_screen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _rollController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _cgpaController = TextEditingController();

  String department = 'Computer Science';
  String semester = 'Semester 1';

  final List<String> departments = [
    'Computer Science',
    'Information Technology',
    'Electronics',
    'Mechanical',
    'Civil',
    'Electrical'
  ];

  final List<String> semesters = [
    'Semester 1',
    'Semester 2',
    'Semester 3',
    'Semester 4',
    'Semester 5',
    'Semester 6',
    'Semester 7',
    'Semester 8',
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _rollController.dispose();
    _emailController.dispose();
    _mobileController.dispose();
    _cgpaController.dispose();
    super.dispose();
  }

  void clearFields() {
    _nameController.clear();
    _rollController.clear();
    _emailController.clear();
    _mobileController.clear();
    _cgpaController.clear();

    setState(() {
      department = departments.first;
      semester = semesters.first;
    });
  }

  Future<void> saveStudent() async {
    if (!_formKey.currentState!.validate()) return;

    Student student = Student(
      studentName: _nameController.text.trim(),
      rollNumber: _rollController.text.trim(),
      email: _emailController.text.trim(),
      mobile: _mobileController.text.trim(),
      department: department,
      semester: semester,
      cgpa: double.parse(_cgpaController.text),
    );

    await DatabaseHelper.instance.insertStudent(student);

    if (!mounted) return;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: const Column(
            children: [
              Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 70,
              ),
              SizedBox(height: 10),
              Text(
                "Student Registered Successfully!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              infoRow("Name", student.studentName),
              infoRow("Roll No", student.rollNumber),
              infoRow("Department", student.department),
              infoRow("Semester", student.semester),
              infoRow("CGPA", student.cgpa.toString()),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                clearFields();
              },
              child: const Text("Add Another"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const StudentListScreen(),
                  ),
                );

                clearFields();
              },
              child: const Text("View Students"),
            ),
          ],
        );
      },
    );
  }

  Widget infoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              "$title :",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(value),
          ),
        ],
      ),
    );
  }  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Student Registration"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [

              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: "Student Name",
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Enter student name";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 15),

              TextFormField(
                controller: _rollController,
                decoration: const InputDecoration(
                  labelText: "Roll Number",
                  prefixIcon: Icon(Icons.badge),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Enter roll number";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 15),

              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: "Email",
                  prefixIcon: Icon(Icons.email),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter email";
                  }

                  if (!value.contains("@")) {
                    return "Invalid email";
                  }

                  return null;
                },
              ),

              const SizedBox(height: 15),

              TextFormField(
                controller: _mobileController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: "Mobile Number",
                  prefixIcon: Icon(Icons.phone),
                ),
                validator: (value) {
                  if (value == null || value.length != 10) {
                    return "Enter valid mobile number";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 15),

              DropdownButtonFormField<String>(
                value: department,
                decoration: const InputDecoration(
                  labelText: "Department",
                  prefixIcon: Icon(Icons.school),
                ),
                items: departments.map((dept) {
                  return DropdownMenuItem(
                    value: dept,
                    child: Text(dept),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    department = value!;
                  });
                },
              ),

              const SizedBox(height: 15),

              DropdownButtonFormField<String>(
                value: semester,
                decoration: const InputDecoration(
                  labelText: "Semester",
                  prefixIcon: Icon(Icons.menu_book),
                ),
                items: semesters.map((sem) {
                  return DropdownMenuItem(
                    value: sem,
                    child: Text(sem),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    semester = value!;
                  });
                },
              ),

              const SizedBox(height: 15),

              TextFormField(
                controller: _cgpaController,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                decoration: const InputDecoration(
                  labelText: "CGPA",
                  prefixIcon: Icon(Icons.grade),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter CGPA";
                  }

                  final cgpa = double.tryParse(value);

                  if (cgpa == null || cgpa < 0 || cgpa > 10) {
                    return "CGPA must be between 0 and 10";
                  }

                  return null;
                },
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: saveStudent,
                  icon: const Icon(Icons.save),
                  label: const Text(
                    "Register Student",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  icon: const Icon(Icons.table_chart),
                  label: const Text(
                    "View Registered Students",
                    style: TextStyle(fontSize: 16),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const StudentListScreen(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}