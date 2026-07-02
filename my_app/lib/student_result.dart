import "dart:io";

void main(){
    stdout.write("Enter your name : ");
    String name = stdin.readLineSync()!;

    stdout.write("Enter marks in Subject 1: ");
    int m1 = int.parse(stdin.readLineSync()!);

    stdout.write("Enter marks in Subject 2: ");
    int m2 = int.parse(stdin.readLineSync()!);

    stdout.write("Enter marks in Subject 3: ");
    int m3 = int.parse(stdin.readLineSync()!);

    stdout.write("Enter your course: ");
    String course = stdin.readLineSync()!;

    stdout.write("Semester : ");
    int semester = int.parse(stdin.readLineSync()!);

    int total = m1 + m2 + m3;
    double avg = total / 3.0;
    double percentage = (total / 300.0) * 100;
    stdout.write("========================================\n");
    stdout.write("STUDENT RESULT REPORT\n");
    stdout.write("========================================\n");
    stdout.write("Name: $name\n");
    stdout.write("Course: $course\n");
    stdout.write("Semester: $semester\n");
    stdout.write("Total Marks: $total\n");
    stdout.write("Average Marks: $avg\n");
    stdout.write("Percentage: $percentage%\n");

    stdout.write(percentage >= 40 ? "Pass\n" : "Fail\n");
    stdout.write("========================================\n");

}