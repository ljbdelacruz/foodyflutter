import 'package:flutter/material.dart';
import 'package:foody/components/header/design3.header.dart';
import 'package:foody/config/Constants.config.dart';


class UserDeliveryStatusPage extends StatefulWidget{
  final UserDeliveryMapPageVM vm=UserDeliveryMapPageVM();
  UserDeliveryStatusPage();
  @override
  _UserDeliveryStatusPageState createState() => _UserDeliveryStatusPageState();
}
class _UserDeliveryStatusPageState extends State<UserDeliveryStatusPage> {
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

                              ]
                          )
                          )
                        ,),
        )
      );
  }
}

class UserDeliveryMapPageVM{
  Design3HeaderVM header;
  UserDeliveryMapPageVM(){
    this.header=Design3HeaderVM();
  }

}