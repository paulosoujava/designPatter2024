class Person{
  String name;
  Person(this.name);
}

class MyDb {
  // Instância privada estática da classe
  static MyDb? _instance;
  final List<Person> people = [];

  // Construtor privado para evitar instanciação direta
  MyDb._();

  // Método estático para obter a instância única da classe
  static MyDb getInstance() {
    // Se a instância ainda não foi criada, crie uma nova
    _instance ??= MyDb._();
    // Retorne a instância existente
    return _instance!;
  }


  void addPerson(Person p) {
    people.add(p);
  }
  void removePerson(Person p) {
    people.remove(p);
  }

  void showUser(){
    for (var p in people) {
      print(p.name);
    }
  }
}

void main() {
  // Usando o Singleton
  MyDb singleton1 = MyDb.getInstance();
  MyDb singleton2 = MyDb.getInstance();

  // Ambas as instâncias são iguais
  print(identical(singleton1, singleton2)); // Output: true
final p = Person('Ana');
  // Usando o Singleton
  singleton1.addPerson(Person('João'));
  singleton2.addPerson(Person('Maria'));
  singleton1.addPerson(Person('Pedro'));
  singleton2.addPerson(p);
  singleton2.showUser();
  print("\n\n");
  singleton2.removePerson(p);
  singleton2.showUser();
}
