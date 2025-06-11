class Student{
  void printHello(){
    print('Hello from student');
  }
}

class Demo extends Student{
  void printDemo(){
    print('Hello from Demo');
    super.printHello();
  }
}

void main(){
  Demo d = Demo();
  d.printDemo();
  d.printHello();
}