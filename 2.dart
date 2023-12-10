
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

void main() {
  Role studentRole = StudentRole();
  Role teacherRole = TeacherRole();

  Person student = Person("John Doe", 20, "123 Street St", studentRole);
  Person teacher = Person("Jane Smith", 35, "456 Avenue Ave", teacherRole);

  student.displayRole();
  teacher.displayRole();
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
