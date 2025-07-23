import 'dart:io';

void main(){
  try{
    String s = stdin.readLineSync()!;
    int.parse(s);
  }on FormatException catch (e){
    print('Exception in format please enter valid format!!! || Exception :: $e');
  }catch(e){
    print("Exception : $e");
  }
}