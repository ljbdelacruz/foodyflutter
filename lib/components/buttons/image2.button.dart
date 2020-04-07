import 'package:flutter/material.dart';


class Image2Buttons extends StatelessWidget {
  final Image2ButtonCallback callback;
  final Image2ButtonsVM vm;
  Image2Buttons(this.vm, this.callback);
  @override
  Widget build(BuildContext context) {
    return Container( color: Colors.transparent, width: vm.width, height:vm.height, child: 
            OutlineButton(
              borderSide: BorderSide(color: Colors.transparent),            
              highlightColor: Colors.transparent,
              color: Colors.transparent, 
              onPressed: (){
                this.callback(vm.value);
              }, child: Column(children: [
                        Flexible(fit: FlexFit.tight, flex: 1, 
                                 child: Image.asset(vm.image),
                        ),
                        ],),
            )
    ); 
        
  }
}

class Image2ButtonsVM{
  String image;
  double width = 50;
  double height = 50;
  int value;
  Image2ButtonsVM(this.image, this.width, this.height);
  Image2ButtonsVM.transfer(this.image, this.value){
    this.width=120;
    this.height=120;
  }
  Image2ButtonsVM.back(this.image, this.value){
    this.width=80;
    this.height=80;
  }
  Image2ButtonsVM.menudashboard(this.image, this.value){
    this.width=50;
    this.height=50;
  }
  Image2ButtonsVM.subheadermenu(this.image, this.value){
    this.width=30;
    this.height=30;
  }  
  
}
typedef Image2ButtonCallback = void Function(int value);