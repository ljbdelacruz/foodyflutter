//TODO: Apply Merchant  From User

//account access usermerchant


import 'package:flutter/material.dart';
import 'package:foody/components/header/design3.header.dart';
import 'package:foody/config/Constants.config.dart';

class ManageStorePage extends StatefulWidget{
  final ManageStorePageVM vm=ManageStorePageVM();
  ManageStorePage();
  @override
  ManageStorePageState createState() => ManageStorePageState();
}
class ManageStorePageState extends State<ManageStorePage> {
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
                                //manage store page
                                Text("Manage Store Page")
                          ],)

                          )
                        ,),
        )
      );
  }
}

class ManageStorePageVM{
  Design3HeaderVM header;
  ManageStorePageVM(){
    this.header=Design3HeaderVM();
  }

}