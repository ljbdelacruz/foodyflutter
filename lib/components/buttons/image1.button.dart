import 'package:flutter/material.dart';
import 'package:foody/methodinterface/widget.interface.dart';

class Image1Buttons extends StatelessWidget {
  final NormalCallback callback;
  final Image1ButtonsVM vm;
  Image1Buttons(this.vm, this.callback);
  @override
  Widget build(BuildContext context) {
    return Container( color: vm.bgColor, child: 
          OutlineButton(
          borderSide: BorderSide(color: Colors.transparent),
          highlightColor: Colors.transparent,
          color: Colors.transparent, 
          onPressed: this.callback, child: Column(children: [
              Flexible(fit: FlexFit.tight, flex: 2, child: Image.asset(vm.image)),
              Flexible(fit: FlexFit.tight, flex: 1, child: Text(vm.title, textAlign: TextAlign.center, style:TextStyle(color:vm.titleC, fontSize: vm.titleFz)))      
            ],),
            )
    ); 
        
  }
}

class Image1ButtonsVM{
  Color bgColor=Colors.yellow;
  String title;
  Color titleC = Colors.black;
  double titleFz=12;
  String image;
  Image1ButtonsVM(this.title, this.image, this.bgColor);

}