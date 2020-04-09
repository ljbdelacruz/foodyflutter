import 'package:flutter/material.dart';
import 'package:foody/components/header/design3.header.dart';
import 'package:foody/config/Constants.config.dart';


class SelectPaymentPage extends StatefulWidget{
  final SelectPaymentPageVM vm=SelectPaymentPageVM();
  SelectPaymentPage();
  @override
  SelectPaymentPageState createState() => SelectPaymentPageState();
}
class SelectPaymentPageState extends State<SelectPaymentPage> {
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
                                Text("Select Payment Page")
                              ]
                          )
                        ,),
        )
      )
    );
  }
}

class SelectPaymentPageVM{
  Design3HeaderVM header;

  SelectPaymentPageVM(){
    this.header=Design3HeaderVM();
  }
}