import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_app/screen/zz_Tasks/student.dart';
import 'package:my_app/screen/zz_Tasks/update_student_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(StudentAdapter());

  await Hive.openBox<Student>('students');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Hive CRUD",
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final Box<Student> studentBox =
      Hive.box<Student>('students');

  final TextEditingController nameController =
      TextEditingController();

  final TextEditingController courseController =
      TextEditingController();

  final TextEditingController ageController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Hive CRUD Students"),
        backgroundColor: Colors.deepPurple,
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        child: const Icon(Icons.add),

        onPressed: () {

          showDialog(

            context: context,

            builder: (context) {

              return AlertDialog(

                title: const Text("Add Student"),

                content: SingleChildScrollView(

                  child: Column(

                    mainAxisSize: MainAxisSize.min,

                    children: [

                      TextField(
                        controller: nameController,
                        decoration:
                            const InputDecoration(
                          labelText: "Name",
                        ),
                      ),

                      TextField(
                        controller: courseController,
                        decoration:
                            const InputDecoration(
                          labelText: "Course",
                        ),
                      ),

                      TextField(
                        controller: ageController,
                        keyboardType:
                            TextInputType.number,
                        decoration:
                            const InputDecoration(
                          labelText: "Age",
                        ),
                      ),
                    ],
                  ),
                ),

                actions: [

                  ElevatedButton(

                    onPressed: () {

                      Student student = Student(

                        name: nameController.text,

                        course: courseController.text,

                        age: int.parse(ageController.text),
                      );

                      studentBox.add(student);

                      nameController.clear();
                      courseController.clear();
                      ageController.clear();

                      Navigator.pop(context);

                      setState(() {});
                    },

                    child: const Text("SAVE"),
                  )
                ],
              );
            },
          );
        },
      ),

      body: ValueListenableBuilder(

        valueListenable: studentBox.listenable(),

        builder: (context, Box<Student> box, _) {

          if (box.isEmpty) {

            return const Center(
              child: Text("No Students"),
            );
          }

          return ListView.builder(

            itemCount: box.length,

            itemBuilder: (context, index) {

              Student student = box.getAt(index)!;

              return Card(

                margin: const EdgeInsets.all(8),

                child: ListTile(

                  title: Text(
                    student.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  subtitle: Text(
                    "${student.course} | Age : ${student.age} | ID : ${index + 1}",
                  ),

                  trailing: Row(

                    mainAxisSize: MainAxisSize.min,

                    children: [                      // Edit Button
                      IconButton(
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.deepPurple,
                        ),
                        onPressed: () async {

                          bool? updated =
                              await Navigator.push(

                            context,

                            MaterialPageRoute(

                              builder: (_) =>
                                  UpdateStudentScreen(

                                student: student,

                                index: index,
                              ),
                            ),
                          );

                          if (updated == true) {
                            setState(() {});
                          }
                        },
                      ),

                      // Delete Button
                      IconButton(
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        onPressed: () {

                          studentBox.deleteAt(index);

                          setState(() {});
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}