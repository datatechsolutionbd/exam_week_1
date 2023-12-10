
abstract class Role {
  void displayRole();
}

class Person implements Role {
  String name;
  int age;
  String address;
  Role role;

  Person(this.name, this.age, this.address, this.role);

  String get getName => name;
  int get getAge => age;
  String get getAddress => address;

  @override
  void displayRole() {
    print("Role information:");
    role.displayRole();
  }
}

class Student extends Person {
  List<double> courseScores = [];

  Student(
      String name,
      int age,
      String address,
      Role role,
      ) : super(name, age, address, role);

  double calculateAverageScore() {
    if (courseScores.isEmpty) {
      return 0.0;
    }

    double totalScore = courseScores.reduce((a, b) => a + b);
    return totalScore / courseScores.length;
  }
}

class Teacher extends Person {

  List<String> coursesTaught = [];
  Teacher(
      String name,
      int age,
      String address,
      Role role,
      ) : super(name, age, address, role);

  void displayCoursesTaught() {
    if (coursesTaught.isEmpty) {
      print("The teacher is not currently teaching any courses.");
    } else {
      print("Courses Taught:");
      for (String course in coursesTaught) {
        print("- $course");
      }
    }
  }
}

void main() {
  Role studentRole = StudentRole();
  Role teacherRole = TeacherRole();

  Student student = Student("John Doe", 20, "123 Main St", studentRole);
  student.courseScores = [92.0, 86.0, 89.0];

  Teacher teacher = Teacher("Mrs. Smith", 35, "456 Oak St", teacherRole);
  teacher.coursesTaught = ["Math", "English", "Bangla"];

  print("Student Information:");
  student.displayRole();
  print("Name: ${student.getName}");
  print("Age: ${student.getAge}");
  print("Address: ${student.getAddress}");
  print("Average Score: ${student.calculateAverageScore()}\n");

  print("Teacher Information:");
  teacher.displayRole();
  print("Name: ${teacher.getName}");
  print("Age: ${teacher.getAge}");
  print("Address: ${teacher.getAddress}");
  teacher.displayCoursesTaught();
}

class StudentRole implements Role {
  @override
  void displayRole() {
    print("Role: Student");
  }
}

class TeacherRole implements Role {
  @override
  void displayRole() {
    print("Role: Teacher");
  }
}

