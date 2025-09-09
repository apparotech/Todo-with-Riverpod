
import 'dart:ffi';



class Employee {
  final String name;
  final int id;

  Employee(this.name, this.id);


}

class Developer extends Employee {
  final String language;
  Developer(String name, int id, this.language) : super(name, id);


}

class FlutterDeveloper extends Developer{

  final String frameWorkVersion;

  FlutterDeveloper(String name, int id, String language, this.frameWorkVersion)
    : super(name, id, language);


}