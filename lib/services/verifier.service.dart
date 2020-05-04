

class VerifierService{
  static VerifierService instance=VerifierService();

  String validateString(dynamic value){
    if(value != null){
      return value.toString();
    }else{
      return "";
    }
  }
  bool validateBool(dynamic value){
    if(value != null){
      return value;
    }else{
      return false;
    }
  }
  double validateDouble(dynamic value){
    if(value != null){
      return value.toDouble();
    }else{
      return 0;
    }
  }
  int validateInt(dynamic value){
    if(value != null){
      return int.parse(value);
    }else{
      return 0;
    }
  }
}