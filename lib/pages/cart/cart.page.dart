import 'package:flutter/material.dart';
import 'package:foody/components/buttons/buttonloader.buttons.dart';
import 'package:foody/components/header/design3.header.dart';
import 'package:foody/components/subui/listviews/cartlist.subui.dart';
import 'package:foody/components/subui/listviews/cells/cartitem.cells.dart';
import 'package:foody/config/Constants.config.dart';
import 'package:foody/services/navigator.service.dart';


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
                        body:body(),
                        bottomNavigationBar: Container(height:80, child: ButtonLoader(widget.vm.nextBtn, (){
                          this.startLoader();
                          NavigatorService.instance.toSelectPayment(context);
                        }, (){}))
                        ,),
        )
      );
  }
  startLoader(){
    setState(() {
      widget.vm.btnState=1;
    });
  }
  finishLoader(){
    setState(() {
      widget.vm.btnState=0;
    });
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
  ButtonLoaderVM nextBtn;
  int btnState=0;
  CartPageVM(){
    this.header=Design3HeaderVM();
    this.cartListVM=CartListSubUIVM();
    Constants.instance.cart.items.forEach((item){
      this.cartListVM.appendCartItemCells(newCartItem(item.quantity, item.product.price, item.product.title, item.product.mainImage));
    });
    this.nextBtn=ButtonLoaderVM.preDefault("Next", 12, btnState);
  }
  Widget newCartItem(int quantity, double price, String name, String image){
    return CartItemCells(CartItemCellsVM(quantity, price, name, image), this.getIndex);
  }
  getIndex(int index){
    print("GetIndex");
  }


}