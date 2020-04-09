import 'package:flutter/material.dart';
import 'package:foody/components/buttons/buttonloader.buttons.dart';
import 'package:foody/components/buttons/image1.button.dart';
import 'package:foody/methodinterface/widget.interface.dart';
import 'package:foody/services/Color.service.dart';

class OrderFooter extends StatelessWidget {
  final NormalCallback btn1Click;
  final NormalCallback btn2Click;  
  final OrderFooterVM vm;
  OrderFooter(this.vm, this.btn1Click, this.btn2Click);
    @override
    Widget build(BuildContext context) {
      return Container(height:100, 
      color:vm.bgColor,
      child: Row(children:[
        Flexible(fit: FlexFit.tight, flex:1, child: Image1Buttons(vm.btn1VM, this.btn1Click)),                
        Flexible(fit: FlexFit.tight, flex:2, child: Image1Buttons(vm.btn2VM, this.btn2Click)),                
      ])
      );
    }
}

class OrderFooterVM{
  Color bgColor=ColorsService.instance.primaryColor();
  Image1ButtonsVM btn1VM;
  Image1ButtonsVM btn2VM;  

  OrderFooterVM.order(){
    this.btn1VM=Image1ButtonsVM("Chat Now", "assets/images/plus.png", Colors.red);
    this.btn2VM=Image1ButtonsVM("Add to Cart", "assets/images/plus.png", Colors.yellow);
  }
}