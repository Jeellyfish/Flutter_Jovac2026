void main(){
  List<String> students = ["Akane", "Bunny", "Chopper", "Doraemon", "Eren", "Fujiko"];
  Map<String, int> marks = {
    "Akane": 85,
    "Bunny": 92,
    "Chopper": 78,
    "Doraemon": 95,
    "Eren": 88,
    "Fujiko": 90
  };

  print("---- Using for loop ----");
  for(int i = 0; i < students.length; i++){
    print(students[i]);
  }

  print("\n---- Using while loop ----");
  int i = 0;
  while(i < students.length){
    print(students[i]);
    i++;
  }

  print("\n---- Using do-while loop ----");
  int j = 0;
  do{
    print(students[j]);
    j++;
  }while(j < students.length);

  print("\n---- Using for-in loop ----");
  for(String student in students){
    print(student);
  }

  print("\n---- Using forEach ----");
  students.forEach(print);

  print("\n================================");
  print("      STUDENT GRADE REPORT      ");
  print("================================");

  for (String student in students) {
    int mark = marks[student]!;

    String grade;

    if(mark >= 90){
      grade = "A+";
    } else if(mark >= 80){
      grade = "A";
    } else if(mark >= 70){
      grade = "B";
    } else if(mark >= 60){
      grade = "C";
    } else if(mark >= 40){
      grade = "D";
    } else {
      grade = "Fail";
    }

    String performance;

    switch(grade){
      case "A+":
        performance = "Outstanding";
        break;
      case "A":
        performance = "Excellent";
        break;
      case "B":
        performance = "Very Good";
        break;
      case "C":
        performance = "Good";
        break;
      case "D":
        performance = "Needs Improvement";
        break;
      default:
        performance = "Failed";
    }

    print("\nStudent: $student");
    print("Mark: $mark");
    print("Grade: $grade");
    print("Performance: $performance");
    print("--------------------------------");
  }

  print("==================================");
}