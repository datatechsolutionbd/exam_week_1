
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
  String studentID;
  String grade;
  List<double> courseScores = [];

  Student(
      String name,
      int age,
      String address,
      Role role,
      this.studentID,
      this.grade,
      ) : super(name, age, address, role);

  @override
  void displayRole() {
    print("Role: Student");
  }

  double calculateAverageScore() {
    if (courseScores.isEmpty) {
      return 0.0;
    }

    double totalScore = courseScores.reduce((a, b) => a + b);
    return totalScore / courseScores.length;
  }
}

class Teacher extends Person {
  String teacherID;
  List<String> coursesTaught = [];

  Teacher(
      String name,
      int age,
      String address,
      Role role,
      this.teacherID,
      ) : super(name, age, address, role);

  @override
  void displayRole() {
    print("Role: Teacher");
  }

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

  Student student = Student("John Doe", 20, "123 Street St", studentRole, "S123456", "A");
  Teacher teacher = Teacher("Jane Smith", 35, "456 Avenue Ave", teacherRole, "T987654");

  student.courseScores = [90.0, 85.0, 92.0];

  teacher.coursesTaught = ["Mathematics", "Physics", "Computer Science"];

  student.displayRole();
  print("Student ID: ${student.studentID}");
  print("Grade: ${student.grade}");
  print("Average Score: ${student.calculateAverageScore()}");

  print("\n");

  teacher.displayRole();
  print("Teacher ID: ${teacher.teacherID}");
  teacher.displayCoursesTaught();
}


class StudentRole implements Role {
  @override
  void displayRole() {
    print("I am a Student.");
  }
}

class TeacherRole implements Role {
  @override
  void displayRole() {
    print("I am a Teacher.");
  }
}


