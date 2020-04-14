import 'package:flutter/material.dart';
import 'package:foody/components/header/design3.header.dart';
import 'package:foody/config/Constants.config.dart';

class ManageStoreProductPage extends StatefulWidget{
  final ManageStoreProductPageVM vm=ManageStoreProductPageVM();
  ManageStoreProductPage();
  @override
  ManageStoreProductPageState createState() => ManageStoreProductPageState();
}
class ManageStoreProductPageState extends State<ManageStoreProductPage> {
  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context){
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
                                Text("Manage store product Page")
                          ],)

                          )
                        ,),
        )
      );
  }
}

class ManageStoreProductPageVM{
  Design3HeaderVM header;
  ManageStoreProductPageVM(){
    this.header=Design3HeaderVM();
  }
}