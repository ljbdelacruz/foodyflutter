import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Searchbar1TextFields extends StatelessWidget {
  Searchbar1TextFieldsVM vm;
  Searchbar1TextFields(this.vm);
  @override
  Widget build(BuildContext context) {
    
  }
}  

class Searchbar1TextFieldsVM{
  bool enabled=true;
  String inputP;
  Color inputPC;
  TextInputType keyboardType=TextInputType.emailAddress;
  PreDesignTextFieldOnClick callback;
  TextEditingController tfController;
  int inputLimit=10;
  bool obscureText=false;
  Searchbar1TextFieldsVM(this.inputP, this.inputPC,this.tfController, this.inputLimit, this.obscureText, this.keyboardType);
}
typedef PreDesignTextFieldOnClick = void Function();