import 'package:flutter/material.dart';
import 'package:my_app/models/student.dart';
import 'package:my_app/widgets/custom_textfield.dart';
import 'package:my_app/widgets/success_dialog.dart';

class StudentRegistrationScreen extends StatefulWidget {
  const StudentRegistrationScreen({super.key});

  @override
  State<StudentRegistrationScreen> createState() =>
      _StudentRegistrationScreenState();
}

class _StudentRegistrationScreenState
    extends State<StudentRegistrationScreen> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final mobileController = TextEditingController();
  final rollController = TextEditingController();
  final cityController = TextEditingController();

  String? selectedCourse;

  final List<String> courses = [
    "B.Tech Computer Science",
    "B.Tech Information Technology",
    "BCA",
    "MCA",
    "MBA",
  ];

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    mobileController.dispose();
    rollController.dispose();
    cityController.dispose();
    super.dispose();
  }

  void resetForm() {
    nameController.clear();
    emailController.clear();
    mobileController.clear();
    rollController.clear();
    cityController.clear();

    setState(() {
      selectedCourse = null;
    });

    _formKey.currentState?.reset();
  }

  void submitForm() {
    if (_formKey.currentState!.validate()) {
      final student = Student(
        name: nameController.text,
        email: emailController.text,
        mobile: mobileController.text,
        rollNo: rollController.text,
        course: selectedCourse!,
        city: cityController.text,
      );

      showDialog(
        context: context,
        builder: (_) => SuccessDialog(student: student),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Student Registration"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [

                CircleAvatar(
                  radius: 45,
                  backgroundColor: Colors.deepPurple.shade100,
                  child: const Icon(
                    Icons.school,
                    size: 50,
                    color: Colors.deepPurple,
                  ),
                ),

                const SizedBox(height: 15),

                const Text(
                  "Student Registration",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 5),

                const Text(
                  "Please fill in the details to register",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),

                const SizedBox(height: 30),

                CustomTextField(
                  controller: nameController,
                  label: "Full Name",
                  icon: Icons.person,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Please enter your full name";
                    }

                    if (value.trim().length < 3) {
                      return "Minimum 3 characters required";
                    }

                    return null;
                  },
                ),

                CustomTextField(
                  controller: emailController,
                  label: "Email Address",
                  icon: Icons.email,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter email";
                    }

                    if (!RegExp(
                            r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                        .hasMatch(value)) {
                      return "Please enter a valid email";
                    }

                    return null;
                  },
                ),

                CustomTextField(
                  controller: mobileController,
                  label: "Mobile Number",
                  icon: Icons.phone,
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter mobile number";
                    }

                    if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                      return "Enter a valid 10 digit number";
                    }

                    return null;
                  },
                ),

                CustomTextField(
                  controller: rollController,
                  label: "Roll Number",
                  icon: Icons.badge,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter roll number";
                    }

                    return null;
                  },
                ),

                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: DropdownButtonFormField<String>(
                    value: selectedCourse,
                    decoration: InputDecoration(
                      labelText: "Course",
                      prefixIcon: const Icon(
                        Icons.menu_book,
                        color: Colors.deepPurple,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    items: courses
                        .map(
                          (course) => DropdownMenuItem(
                            value: course,
                            child: Text(course),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedCourse = value;
                      });
                    },
                    validator: (value) {
                      if (value == null) {
                        return "Please select course";
                      }
                      return null;
                    },
                  ),
                ),

                CustomTextField(
                  controller: cityController,
                  label: "City",
                  icon: Icons.location_on,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter city";
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 25),

                Row(
                  children: [

                    Expanded(
                      child: OutlinedButton(
                        onPressed: resetForm,
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          side: const BorderSide(
                            color: Colors.deepPurple,
                          ),
                        ),
                        child: const Text(
                          "Reset",
                          style: TextStyle(
                            color: Colors.deepPurple,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(width: 15),

                    Expanded(
                      child: ElevatedButton(
                        onPressed: submitForm,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          padding: const EdgeInsets.symmetric(vertical: 15),
                        ),
                        child: const Text(
                          "Submit",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}