import 'package:sem_5/lab-3/model/user_crud.dart';

class PersonController{
  final List<Person> _persons = [];

  get getPersons => _persons;

  void addPerson(Person person){
    _persons.add(person);
    print('Person added');
  }

  void deleteUser(Person person){
    _persons.removeWhere((element) => element.name == person.name,);
  }

  void editPerson(Person oldPerson,Person newPerson){
    int index = _persons.indexWhere((element) => element.name == oldPerson.name,);
    _persons[index] = newPerson;
  }
}