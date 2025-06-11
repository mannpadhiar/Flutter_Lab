abstract class Data{
  abstract int a;
  void printData();
}

class Demo extends Data{
  @override
  int a = 2;

  @override
  void printData(){
    print('hello');
  }
}

void main(){
  Demo demo = Demo();
  demo.printData();
}