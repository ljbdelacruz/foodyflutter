
import 'package:flutter/material.dart';
import 'package:foody/methodinterface/widget.interface.dart';


class ToPayCells extends StatelessWidget {
  final GetIntData billerTag;
  final GetIntData payBtn;
  final ToPayCellsVM vm;

  ToPayCells(this.vm, this.billerTag, this.payBtn);
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
          title: Card(child: 
            Row(children: [
              Column(children: [
                Align(alignment:Alignment.topLeft, child: Text(vm.orderDesc)),
                Align(alignment:Alignment.topLeft, child: Text(vm.amount.toString())),
              ],),
              OutlineButton(onPressed: (){
                //pay orders
                this.payBtn(vm.index);
              }, child: Text("Pay Order"))
            ],)
          ,),
        ),
      ),
    );
  }
}
class ToPayCellsVM{
  int index;
  double amount;
  String orderDesc;
  String imageUrl;
  ToPayCellsVM(this.index, this.amount, this.orderDesc, this.imageUrl);

}

