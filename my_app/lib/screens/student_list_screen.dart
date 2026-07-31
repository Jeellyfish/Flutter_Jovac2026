import 'package:flutter/material.dart';

import '../database/database_helper.dart';
import '../models/student.dart';

class StudentListScreen extends StatefulWidget {
  const StudentListScreen({super.key});

  @override
  State<StudentListScreen> createState() => _StudentListScreenState();
}

class _StudentListScreenState extends State<StudentListScreen> {
  List<Student> students = [];
  List<Student> filteredStudents = [];

  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadStudents();
  }

  Future<void> loadStudents() async {
    students = await DatabaseHelper.instance.getStudents();

    setState(() {
      filteredStudents = students;
    });
  }

  void searchStudent(String value) async {
    if (value.isEmpty) {
      loadStudents();
      return;
    }

    final result =
        await DatabaseHelper.instance.searchStudents(value);

    setState(() {
      filteredStudents = result;
    });
  }

  Future<void> deleteStudent(int id) async {
    bool? confirm = await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Delete Student"),
        content: const Text(
          "Are you sure you want to delete this student?",
        ),
        actions: [
          TextButton(
            child: const Text("Cancel"),
            onPressed: () => Navigator.pop(context, false),
          ),
          ElevatedButton(
            child: const Text("Delete"),
            onPressed: () => Navigator.pop(context, true),
          ),
        ],
      ),
    );

    if (confirm == true) {
      await DatabaseHelper.instance.deleteStudent(id);
      loadStudents();
    }
  }

  Future<void> editStudent(Student student) async {
    final nameController =
        TextEditingController(text: student.studentName);

    final rollController =
        TextEditingController(text: student.rollNumber);

    final emailController =
        TextEditingController(text: student.email);

    final mobileController =
        TextEditingController(text: student.mobile);

    final cgpaController =
        TextEditingController(text: student.cgpa.toString());

    String department = student.department;
    String semester = student.semester;

    await showDialog(
      context: context,
      builder: (_) {
        return StatefulBuilder(
          builder: (context, setStateDialog) {
            return AlertDialog(
              title: const Text("Edit Student"),
              content: SingleChildScrollView(
                child: Column(
                  children: [

                    TextField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        labelText: "Student Name",
                      ),
                    ),

                    const SizedBox(height: 10),

                    TextField(
                      controller: rollController,
                      decoration: const InputDecoration(
                        labelText: "Roll Number",
                      ),
                    ),

                    const SizedBox(height: 10),

                    TextField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        labelText: "Email",
                      ),
                    ),

                    const SizedBox(height: 10),

                    TextField(
                      controller: mobileController,
                      decoration: const InputDecoration(
                        labelText: "Mobile",
                      ),
                    ),

                    const SizedBox(height: 10),

                    DropdownButton<String>(
                      value: department,
                      isExpanded: true,
                      items: const [
                        DropdownMenuItem(
                          value: "Computer Science",
                          child: Text("Computer Science"),
                        ),
                        DropdownMenuItem(
                          value: "Information Technology",
                          child: Text("Information Technology"),
                        ),
                        DropdownMenuItem(
                          value: "Electronics",
                          child: Text("Electronics"),
                        ),
                        DropdownMenuItem(
                          value: "Mechanical",
                          child: Text("Mechanical"),
                        ),
                        DropdownMenuItem(
                          value: "Civil",
                          child: Text("Civil"),
                        ),
                        DropdownMenuItem(
                          value: "Electrical",
                          child: Text("Electrical"),
                        ),
                      ],
                      onChanged: (value) {
                        setStateDialog(() {
                          department = value!;
                        });
                      },
                    ),

                    const SizedBox(height: 10),

                    DropdownButton<String>(
                      value: semester,
                      isExpanded: true,
                      items: List.generate(
                        8,
                        (index) => DropdownMenuItem(
                          value: "Semester ${index + 1}",
                          child: Text("Semester ${index + 1}"),
                        ),
                      ),
                      onChanged: (value) {
                        setStateDialog(() {
                          semester = value!;
                        });
                      },
                    ),

                    const SizedBox(height: 10),

                    TextField(
                      controller: cgpaController,
                      keyboardType:
                          const TextInputType.numberWithOptions(
                              decimal: true),
                      decoration: const InputDecoration(
                        labelText: "CGPA",
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  child: const Text("Cancel"),
                  onPressed: () => Navigator.pop(context),
                ),
                ElevatedButton(
                  child: const Text("Update"),
                  onPressed: () async {
                    Student updated = Student(
                      id: student.id,
                      studentName: nameController.text,
                      rollNumber: rollController.text,
                      email: emailController.text,
                      mobile: mobileController.text,
                      department: department,
                      semester: semester,
                      cgpa: double.parse(cgpaController.text),
                    );

                    await DatabaseHelper.instance
                        .updateStudent(updated);

                    if (!mounted) return;

                    Navigator.pop(context);

                    loadStudents();
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }

  DataRow buildRow(Student student) {
    return DataRow(
      cells: [
        DataCell(Text(student.studentName)),
        DataCell(Text(student.rollNumber)),
        DataCell(Text(student.department)),
        DataCell(Text(student.semester)),
        DataCell(Text(student.cgpa.toString())),
        DataCell(
          Row(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.edit,
                  color: Colors.blue,
                ),
                onPressed: () => editStudent(student),
              ),
              IconButton(
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
                onPressed: () =>
                    deleteStudent(student.id!),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registered Students"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [

            TextField(
              controller: searchController,
              decoration: const InputDecoration(
                hintText: "Search by Name or Roll No",
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: searchStudent,
            ),

            const SizedBox(height: 20),

            Expanded(
              child: filteredStudents.isEmpty
                  ? const Center(
                      child: Text(
                        "No Students Found",
                        style: TextStyle(fontSize: 18),
                      ),
                    )
                  : SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SingleChildScrollView(
                        child: DataTable(
                          headingRowColor:
                              MaterialStateProperty.all(
                                  Colors.deepPurple.shade100),
                          border: TableBorder.all(),
                          columns: const [
                            DataColumn(
                                label: Text("Name")),
                            DataColumn(
                                label: Text("Roll No")),
                            DataColumn(
                                label: Text("Department")),
                            DataColumn(
                                label: Text("Semester")),
                            DataColumn(
                                label: Text("CGPA")),
                            DataColumn(
                                label: Text("Actions")),
                          ],
                          rows: filteredStudents
                              .map(buildRow)
                              .toList(),
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