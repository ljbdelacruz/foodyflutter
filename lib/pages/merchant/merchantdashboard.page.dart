import 'package:flutter/material.dart';
import 'package:foody/components/header/design3.header.dart';
import 'package:foody/config/Constants.config.dart';

class MerchantDashboardPage extends StatefulWidget{
  final MerchantDashboardPageVM vm=MerchantDashboardPageVM();
  MerchantDashboardPage();
  @override
  MerchantDashboardPageState createState() => MerchantDashboardPageState();
}
class MerchantDashboardPageState extends State<MerchantDashboardPage> {
  @override
  void dispose(){
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
                                //manage store page
                                Text("Merchant Dashboard Page")
                          ],)

                          )
                        ,),
        )
      );
  }
}

class MerchantDashboardPageVM{
  Design3HeaderVM header;
  MerchantDashboardPageVM(){
    this.header=Design3HeaderVM();
  }

}