
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

void main() {
  // Create a Student
  Role studentRole = StudentRole();
  Student student = Student("John Doe", 20, "123 Street St", studentRole, "S123456", "A");

  student.displayRole();
  print("Student ID: ${student.studentID}");
  print("Grade: ${student.grade}");

  student.courseScores = [90.0, 85.0, 92.0];
  print("Average Score: ${student.calculateAverageScore()}");
}

class StudentRole implements Role {
  @override
  void displayRole() {
    print("I am a Student.");
  }
}