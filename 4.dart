
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

class Teacher extends Person {
  // Additional attributes for Teacher
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
  Role teacherRole = TeacherRole();
  Teacher teacher = Teacher("Jane Smith", 35, "456 Avenue Ave", teacherRole, "T987654");

  teacher.displayRole();
  print("Teacher ID: ${teacher.teacherID}");

  teacher.coursesTaught = ["Mathematics", "Physics", "Computer Science"];

  teacher.displayCoursesTaught();
}

class TeacherRole implements Role {
  @override
  void displayRole() {
    print("I am a Teacher.");
  }
}

