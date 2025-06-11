class Data{
  void printData(){
    print('Hello form Data');
  }
}

class Demo extends Data{
  @override
  void printData(){
    print('Hello from Demo');
    super.printData();
  }
}

void main(){
  Demo demo = Demo();
  demo.printData();
}