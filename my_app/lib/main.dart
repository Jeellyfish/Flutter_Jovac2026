import "package:flutter/material.dart";
import "package:my_app/screen/zz_Tasks/home_screen.dart";
import "package:my_app/screen/zz_Tasks/edit_course_screen.dart";
void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student Navigator',
      
      home: const HomeScreen(),
      routes:{
        '/edit' : (context) => const EditCourseScreen(),
      }
    );
  }
}