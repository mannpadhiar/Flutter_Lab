class CustomException implements Exception{
  String exc;

  CustomException(this.exc);
}

void main(){
  try{
    throw CustomException('custom Exception!!').exc;
  }catch(e){
    print('Exc : ${e.toString()}');
  }
}