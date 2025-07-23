import 'dart:io';

void main(){
  int a = int.parse(stdin.readLineSync()!);
  int b = int.parse(stdin.readLineSync()!);

  try{
    print(a~/b);
  }catch (e){
    print("error is :$e");
  }
}