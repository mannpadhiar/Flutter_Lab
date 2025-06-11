class Data{
  static int counter = 0;
}

class Demo extends Data{
  void increment(){
    Data.counter++;
    print(Data.counter);
  }
}

class Demo2 extends Data{
  void increment(){
    Data.counter++;
    print(Data.counter);
  }
}


