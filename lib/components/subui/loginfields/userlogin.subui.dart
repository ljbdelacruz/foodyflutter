import 'package:beauty_textfield/beauty_textfield.dart';
import 'package:flutter/material.dart';
class UserLoginSubUI extends StatelessWidget {
  final UserLoginSubUIVM vm;
  UserLoginSubUI(this.vm);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        BeautyTextfield(
            width: double.maxFinite,
            height: 60,
            duration: Duration(milliseconds: 300),
            inputType: TextInputType.text,
            prefixIcon: Icon(Icons.lock_outline),
            // suffixIcon: Icon(Icons.remove_red_eye),
            placeholder: "Username or Email",
            onTap: () {
                print('Click');
            },
            onChanged: (text) {
                print(text);
            },
            onSubmitted: (data) {
                print(data.length);
            },
        ),
        BeautyTextfield(
            width: double.maxFinite,
            height: 60,
            duration: Duration(milliseconds: 300),
            inputType: TextInputType.visiblePassword,
            prefixIcon: Icon(Icons.lock_outline),
            suffixIcon: Icon(Icons.remove_red_eye),
            placeholder: "Password",
            minLines: 1,
            maxLines: 1,            
            obscureText:true,

            onTap: () {
                print('Click');
            },
            onChanged: (text) {
                print(text);
            },
            onSubmitted: (data) {
                print(data.length);
            },
        ),


      ],),
    );
  }
}

class UserLoginSubUIVM{
  String inputP;
  Color inputPC = Colors.black;
  String passP;
  Color passPC = Colors.black;
  TextEditingController tfController; 
  TextEditingController passController;   


  UserLoginSubUIVM.userLogin(this.tfController, this.passController){
    this.inputP="Username or Email";
    this.passP="Password";
  }


}