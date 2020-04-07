import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PreDesignTextFields extends StatelessWidget {
  final PreDesignTextFieldsVM vm;
  PreDesignTextFields(this.vm);
  @override
  Widget build(BuildContext context) {
    return TextField(
        keyboardType: vm.keyboardType, 
        enabled: vm.enabled,
        decoration: InputDecoration(labelText: vm.inputP, 
          labelStyle: TextStyle(color:vm.inputPC), 
          enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: vm.inputPC)),
          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color:vm.inputPC)),
          disabledBorder: UnderlineInputBorder(borderSide: BorderSide(color:vm.inputPC))
        ),

        maxLength: vm.inputLimit,
        style: TextStyle(color:vm.inputPC),
        obscureText: vm.obscureText, controller: vm.tfController,
        onTap: (){
          print("ONTAPPP");
          if(this.vm.callback != null){
            this.vm.callback();
          }

        },
        );
  }
}

class PreDesignTextFieldsVM{
  bool enabled=true;
  String inputP;
  Color inputPC;
  TextInputType keyboardType=TextInputType.emailAddress;
  PreDesignTextFieldOnClick callback;

  TextEditingController tfController;
  int inputLimit=10;
  bool obscureText=false;
  PreDesignTextFieldsVM(this.inputP, this.inputPC,this.tfController, this.inputLimit, this.obscureText, this.keyboardType);
  PreDesignTextFieldsVM.defaultInput(this.inputP, this.tfController, this.inputLimit, this.obscureText, this.keyboardType){
    this.inputPC=Colors.white;
  }
  PreDesignTextFieldsVM.clickableInput(this.inputP, this.tfController, this.inputLimit, this.keyboardType, this.callback){
    this.obscureText=false;
    this.inputPC=Colors.white;
  }

  PreDesignTextFieldsVM.grey(this.inputP, this.tfController, this.inputLimit, this.obscureText, this.keyboardType){
    this.inputPC=Colors.grey;
  }

  PreDesignTextFieldsVM.disabledTF(this.inputP, this.tfController, this.inputLimit, this.obscureText, this.keyboardType){
    this.inputPC=Colors.white;    
    this.enabled=false;
  }
  PreDesignTextFieldsVM.disabledTFBlack(this.inputP, this.tfController, this.inputLimit, this.obscureText, this.keyboardType, this.inputPC){
    // this.inputPC=Colors.black;    
    this.enabled=false;
  }  
}
typedef PreDesignTextFieldOnClick = void Function();