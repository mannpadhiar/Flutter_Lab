class CustomException implements Exception{
  String exc;

  CustomException(this.exc);

  @override
  String toString() {
    return "CustomException: $exc";
  }
}

void main(){
  try{
    throw CustomException('custom Exception!!');
  }catch(e){
    print(e);
  }
}