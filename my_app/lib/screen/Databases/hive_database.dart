import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HiveDatabaseDemo extends StatefulWidget {
  const HiveDatabaseDemo({super.key});

  @override
  State<HiveDatabaseDemo> createState() => _HiveDatabaseDemoState();
}

class _HiveDatabaseDemoState extends State<HiveDatabaseDemo> {
  // Box(Table) to store data in Hive Database

  final Box studentBox =  Hive.box("studentBox");

  @override
  void initState(){
    super.initState();

    insertStudent();
  }

  @override
  Widget build(BuildContext context) {
    List keys = studentBox.keys.toList();
    // [1,2,3,4,5]
    return Scaffold(
      appBar: AppBar(
        title: Text("Hive Database"),
        backgroundColor: Colors.deepOrange,
      ),
      body: ListView.builder(
        itemCount: keys.length,
        itemBuilder: (context, index) {
          var student = studentBox.get(keys[index]);

          return Card(
            child: ListTile(
              title: Text(student["name"]),
              subtitle: Text(
                  "${student["course"]} | Age : ${student["age"]}"),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
          
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {
          
                      studentBox.put(
                        keys[index],
                        {
                          "name": "${student["name"]} Updated",
                          "course": student["course"],
                          "age": student["age"] + 1,
                        },
                      );
          
                      setState(() {});
                    },
                  ),
          
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
          
                      studentBox.delete(keys[index]);
          
                      setState(() {});
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
  
  void insertStudent() {
    if(studentBox.isEmpty)
    {
      studentBox.put(1, {"name":"Rahul", "course":"Flutter", "age":21});
      studentBox.put(2, {"name":"Manish", "course":"Android", "age":20});
      studentBox.put(3, {"name":"Romila", "course":"MBA", "age":25});
      studentBox.put(4, {"name":"Pankaj", "course":"BBA", "age":21});
      studentBox.put(5, {"name":"Sachin", "course":"MCA", "age":25});
    }
    setState(() {
      
    });
  }
}