class Student {
  int rollNumber;
  String name;

  Student(this.rollNumber, this.name);

  void printData(){
    print('rollNumber is $rollNumber');
    print('name is $name');
  }
}

void main(){
  Student firstStudent = Student(1001, 'mann');
  firstStudent.printData();
}