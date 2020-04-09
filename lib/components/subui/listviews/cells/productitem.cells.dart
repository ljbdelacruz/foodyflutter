
import 'package:flutter/material.dart';
import 'package:foody/methodinterface/widget.interface.dart';


class ProductItemCells extends StatelessWidget {
  final GetIntData billerTag;
  final ProductItemCellsVM vm;
  ProductItemCells(this.vm, this.billerTag);

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
          child:Image.asset(this.vm.imageUrl, fit: BoxFit.cover,),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          title: Column(children: [
            Align(alignment:Alignment.topLeft, child: Text(vm.title)),
            Align(alignment:Alignment.topLeft, child: Text(vm.subDesc)),
          ],),
        ),
      ),
    );
  }
}
class ProductItemCellsVM{
  int index;
  String title;
  String subDesc;
  String imageUrl;
  ProductItemCellsVM(this.index, this.title, this.subDesc, this.imageUrl);
}

