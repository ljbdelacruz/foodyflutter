
import 'package:flutter/material.dart';
import 'package:foody/components/subui/listviews/cells/category.cells.dart';
import 'package:foody/methodinterface/widget.interface.dart';


class MenuItemCells extends StatelessWidget {
  final GetIntData billerTag;
  final CategoryCellsVM vm;
  MenuItemCells(this.vm, this.billerTag);

  @override
  Widget build(BuildContext context) {
    // final product = Provider.of<Product>(context, listen: false);
    // final cart = Provider.of<Cart>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            this.billerTag(this.vm.index);
          },
          child: Column(children: [
            Expanded(flex: 1, child: Image.asset(this.vm.imageUrl),),
            Expanded(flex: 1, child: Text(vm.title, style:TextStyle(fontSize:vm.titleFz)),)
          ],)
        ),
      ),
    );
  }
}


