import 'package:flutter/material.dart';
import 'package:foody/components/header/design3.header.dart';
import 'package:foody/components/subui/listviews/cartlist.subui.dart';
import 'package:foody/config/Constants.config.dart';


class CartPage extends StatefulWidget{
  final CartPageVM vm=CartPageVM();
  CartPage();
  @override
  CartPageState createState() => CartPageState();
}
class CartPageState extends State<CartPage> {
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
                        body:body()
                        
                        ,),
        )
      );
  }

  Widget body(){
    return SingleChildScrollView(child:Column(
                              children: [
                                CartListSubUI(widget.vm.cartListVM, widget.vm.getIndex)
                              ]
                          )
    );
  }

}

class CartPageVM{
  Design3HeaderVM header;
  CartListSubUIVM cartListVM;
  CartPageVM(){
    this.header=Design3HeaderVM();
    this.cartListVM=CartListSubUIVM(this.getIndex);
  }

  getIndex(int index){
    print("GetIndex");
  }

}