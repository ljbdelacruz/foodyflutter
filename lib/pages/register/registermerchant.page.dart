//TODO: Apply Merchant  From User

//account access usermerchant


import 'package:flutter/material.dart';
import 'package:foody/components/header/design3.header.dart';
import 'package:foody/config/Constants.config.dart';

class RegisterMerchantPage extends StatefulWidget{
  final RegisterMerchantPageVM vm=RegisterMerchantPageVM();
  RegisterMerchantPage();
  @override
  RegisterMerchantPageState createState() => RegisterMerchantPageState();
}
class RegisterMerchantPageState extends State<RegisterMerchantPage> {
  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
                        color:Constants.instance.themeColor,
                        child: Scaffold(
                        appBar: PreferredSize(child: Design3Header(widget.vm.header, (){
                          //btn clicked
                        }), preferredSize: Size.fromHeight(100)),
                        backgroundColor: Colors.transparent,
                        body:
                          SingleChildScrollView(child:Column(
                              children: [
                                //register merchant page
                          ],)

                          )
                        ,),
        )
      );
  }
}

class RegisterMerchantPageVM{
  Design3HeaderVM header;
  RegisterMerchantPageVM(){
    this.header=Design3HeaderVM();
  }

}