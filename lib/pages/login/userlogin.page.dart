import 'package:flutter/material.dart';
import 'package:foody/components/buttons/buttonloader.buttons.dart';
import 'package:foody/components/subui/loginfields/userlogin.subui.dart';

class UserLoginPage extends StatefulWidget{
  final UserLoginPageVM  vm=UserLoginPageVM();
  UserLoginPage();
  @override
  _UserLoginPageState createState() => _UserLoginPageState();
}
class _UserLoginPageState extends State<UserLoginPage> {
  @override
  void dispose() {
    super.dispose();
  }
  finishLoader(){
    setState(() {
      this.widget.vm.buttonState=0;
    });
  }
  startLoader(){
    setState(() {
      this.widget.vm..buttonState=1;
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Container(
                        child: Scaffold(
                        backgroundColor: Colors.transparent,
                        body: 
                          SingleChildScrollView(child:Column(
                              children: [
                                UserLoginSubUI(widget.vm.userLoginForm),
                                ButtonLoader(widget.vm.buttonVM, (){
                                  //clicked
                                  this.startLoader();
                                }, (){
                                  //finished loader
                                })
                              ],),
                          )
                              
                        ,),
                        )
      );
  }
}

class UserLoginPageVM{
  UserLoginSubUIVM userLoginForm;
  TextEditingController emailC=TextEditingController();
  TextEditingController passC=TextEditingController();
  ButtonLoaderVM buttonVM;
  int buttonState=0;

  UserLoginPageVM(){
    this.userLoginForm=UserLoginSubUIVM.userLogin(this.emailC, this.passC);
    this.buttonVM=ButtonLoaderVM.preDefault("Login", 12, this.buttonState);
  }
}