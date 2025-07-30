void main() async{
  try{
    await Future.delayed(Duration(seconds: 2));
    throw('Future Based Exception happen!!!');
  }catch(e){
    print('Exception happen in fetch data :$e');
  }
}