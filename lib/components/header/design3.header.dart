import 'package:flutter/material.dart';
import 'package:foody/components/buttons/image2.button.dart';
import 'package:foody/services/Color.service.dart';

class Design3Header extends StatelessWidget {
  final Design3HeaderCallback callback;
  final Design3HeaderVM vm;
  Design3Header(this.vm, this.callback);
    @override
    Widget build(BuildContext context) {
      return PreferredSize(preferredSize: Size.fromHeight(200), child:Container(
              color: vm.bgColor,
              child: Column(children: [
                Container(
                          height: 90,
                          decoration: BoxDecoration(border:Border(bottom: BorderSide(width: 2, color:Colors.white))), 
                          child: Row(children: [
                            Image2Buttons(Image2ButtonsVM.back("assets/images/backwhite.png", 0), (type){
                                Navigator.pop(context);
                            })
                          ],)
                ,),             
              ]
            ,),), 
            // automaticallyImplyLeading: false,
          );
    }
}

class Design3HeaderVM{
  Color bgColor=ColorsService.instance.primaryColor();
}
typedef Design3HeaderCallback = void Function();