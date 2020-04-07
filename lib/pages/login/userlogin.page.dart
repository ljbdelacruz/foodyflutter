import 'package:flutter/material.dart';
import 'package:foody/components/buttons/buttonloader.buttons.dart';
import 'package:foody/components/subui/loginfields/userlogin.subui.dart';
import 'package:foody/config/Constants.config.dart';
import 'package:foody/methodinterface/widget.interface.dart';
import 'package:foody/services/facebook.service.dart';
import 'package:foody/services/navigator.service.dart';

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
                                }),
                                ButtonLoader(widget.vm.fbLoginVM, (){
                                  //clicked
                                  this.startLoader();
                                  widget.vm.loginUsingFB((){
                                    this.finishLoader();
                                    NavigatorService.instance.toDashboard(context);
                                  }, (msg){
                                    //show error message
                                  });
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
  ButtonLoaderVM fbLoginVM;

  UserLoginPageVM(){
    this.userLoginForm=UserLoginSubUIVM.userLogin(this.emailC, this.passC);
    this.buttonVM=ButtonLoaderVM.preDefault("Login", 12, this.buttonState);
    this.fbLoginVM=ButtonLoaderVM.preDefault("Facebook Login", 12, this.buttonState);
  }
  loginUsingFB(NormalCallback scall, GetStringData fcall){
    FacebookService.instance.fbLoginInit((){
      //cancel
    }, (msg){
      //error message
    }, (data){
      //success process
      print(data.firstName);
      print(data.email);
      Constants.instance.fbLoginInfo=data;
      //navigate to dashboards
      scall();
    });
  }

}