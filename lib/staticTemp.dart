class Counter{
  static int counter = 0;

  void increment(){
    counter++;
  }
}

class Temp1{
  void accessCounter(){
    Counter().increment();
  }
}

class Temp2{
  void accessCounter(){
    Counter().increment();
  }
}

void main(){
  Temp1().accessCounter();
  Temp2().accessCounter();

  print(Counter.counter);
}