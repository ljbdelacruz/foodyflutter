
import 'package:flutter/material.dart';
import 'package:foody/components/label/titletext.label.dart';
import 'package:foody/methodinterface/widget.interface.dart';
import 'package:foody/themes/lightcolor.themes.dart';


class CartItemCells extends StatelessWidget {
  final GetIntData getIndex;
  final CartItemCellsVM vm;
  CartItemCells(this.vm, this.getIndex);

  @override
  Widget build(BuildContext context) {
    // final product = Provider.of<Product>(context, listen: false);
    // final cart = Provider.of<Cart>(context, listen: false);
    return Container(
      height: 80,
      child: Row(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 1.2,
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    height: 70,
                    width: 70,
                    child: Stack(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            decoration: BoxDecoration(
                                color: LightColor.lightGrey,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Positioned(
                  top:10,
                  left: 10,
                  // bottom: -20,
                  child: Image.asset(vm.image, fit: BoxFit.cover, width:50, height:50),
                )
              ],
            ),
          ),
          Expanded(
              child: ListTile(
                  title: TitleText(
                    text: vm.name,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                  subtitle: Row(
                    children: <Widget>[
                      TitleText(
                        text: '\$ ',
                        color: LightColor.red,
                        fontSize: 12,
                      ),
                      TitleText(
                        text: vm.price.toString(),
                        fontSize: 14,
                      ),
                    ],
                  ),
                  trailing: Container(
                    width: 35,
                    height: 35,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: LightColor.lightGrey.withAlpha(150),
                        borderRadius: BorderRadius.circular(10)),
                    child: TitleText(
                      text: 'x${vm.quantity}',
                      fontSize: 12,
                    ),
                  )))
        ],
      ),
    );
  }
}
class CartItemCellsVM{
  int quantity;
  double price;
  String name;
  String image;

  CartItemCellsVM(this.quantity, this.price, this.name, this.image);
  CartItemCellsVM.dum1(){
    this.quantity=2;
    this.price=240;
    this.name="Queen Burger";
    this.image="assets/images/home.png";
  }
}

