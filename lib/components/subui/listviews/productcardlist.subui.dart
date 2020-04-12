


import 'package:flutter/material.dart';
import 'package:foody/methodinterface/widget.interface.dart';

import 'cells/productcard.cells.dart';

class ProductCardListSubUI extends StatelessWidget {
  final GetIntData getIndex;
  final ProductCardListSubUIVM vm;
  ProductCardListSubUI(this.vm, this.getIndex);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: MediaQuery.of(context).size.width,
      height: 300,
      child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 4 / 3,
              mainAxisSpacing: 30,
              crossAxisSpacing: 20),
          padding: EdgeInsets.only(left: 20),
          scrollDirection: Axis.horizontal,
          children: vm.childList
              .map((product) => ProductCardCells(
                    product,
                  ))
              .toList()),
    );
  }
}

class ProductCardListSubUIVM{
  var childList = <ProductCardCellsVM>[];

  ProductCardListSubUIVM(){
    this.childList.add(ProductCardCellsVM.dum1());
    this.childList.add(ProductCardCellsVM.dum2());    
  }



}



