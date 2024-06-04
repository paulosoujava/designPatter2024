class Person {
  late String name;
  late int age;
  late double height;
  late double weight;
}

class PersonBuilder {
  late var _person = Person();

  void newPerson() {
    _person = Person();
  }

  Person build() {
    return _person;
  }

  setName(String name) {
    _person.name = name;
    return this;
  }

  setAge(int age) {
    _person.age = age;
    return this;
  }

  setHeight(double height) {
    _person.height = height;
    return this;
  }

  setWeight(double weight) {
    _person.weight = weight;
    return this;
  }
}

main() {
  var personBuilder = PersonBuilder();
  final person1 = personBuilder
      .setName('Joaquim')
      .setAge(30)
      .setHeight(1.80)
      .setWeight(80.0);
  personBuilder.newPerson();
  final person2 =
      personBuilder.setName('Ana').setAge(30).setHeight(1.50).setWeight(70.0);
}
