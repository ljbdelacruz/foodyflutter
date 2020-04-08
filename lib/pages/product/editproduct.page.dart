import 'package:flutter/material.dart';
import 'package:foody/components/buttons/buttonloader.buttons.dart';
import 'package:foody/components/header/design3.header.dart';
import 'package:foody/components/textfields/predesign.textfields.dart';
import 'package:foody/config/Constants.config.dart';


class EditProductPage extends StatefulWidget{
  final EditProductPageVM  vm=EditProductPageVM();
  EditProductPage();
  @override
  _EditProductPageState createState() => _EditProductPageState();
}
class _EditProductPageState extends State<EditProductPage> {
  @override
  void dispose() {
    super.dispose();
  }

  finishLoader(){
    setState(() {
      widget.vm.buttonState=0;
    });
  }
  startLoader(){
    setState(() {
      widget.vm.buttonState=1;
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
                        color:Constants.instance.themeColor,
                        child: Scaffold(
                        appBar:PreferredSize(preferredSize: Size.fromHeight(100), child: Design3Header(widget.vm.header, (){})),
                        backgroundColor: Colors.transparent,
                        body:
                          SingleChildScrollView(child:Column(
                              children: [
                                PreDesignTextFields(widget.vm.titleVM),
                                PreDesignTextFields(widget.vm.descVM),
                                PreDesignTextFields(widget.vm.priceVM),
                                ButtonLoader(widget.vm.nextBtn, (){
                                  //button clicked
                                  this.startLoader();
                                }, (){
                                  //finish loader
                                })
                              ]
                          )
                          )
                        ,),
        )
      );
  }
}

class EditProductPageVM{
  Design3HeaderVM header;
  TextEditingController titleC=TextEditingController();
  TextEditingController descC=TextEditingController();
  TextEditingController priceC=TextEditingController();

  PreDesignTextFieldsVM titleVM;
  PreDesignTextFieldsVM descVM;
  PreDesignTextFieldsVM priceVM;
  ButtonLoaderVM nextBtn;
  int buttonState=0;

  EditProductPageVM(){
    this.header=Design3HeaderVM();
    this.titleVM=PreDesignTextFieldsVM.grey("Title", this.titleC, 100, false, TextInputType.text);
    this.descVM=PreDesignTextFieldsVM.grey("Description", this.descC, 500, false, TextInputType.text);
    this.priceVM=PreDesignTextFieldsVM.grey("Price", this.descC, 10, false, TextInputType.number);
    this.nextBtn=ButtonLoaderVM.preDefault("Next", 12, this.buttonState);
  }

}