import 'package:flutter/material.dart';
import 'package:foody/methodinterface/widget.interface.dart';
import 'package:flutter_section_table_view/flutter_section_table_view.dart';
import 'cells/cartitem.cells.dart';
class CartListSubUI extends StatelessWidget {
  final GetIntData getIndex;
  final CartListSubUIVM vm;
  CartListSubUI(this.vm, this.getIndex);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: vm.height,
      child: SafeArea(
        child: SectionTableView(
          sectionCount: 1,
          numOfRowInSection: (section) {
            return vm.items.length;
          },
          cellAtIndexPath: (section, row) {
            return Container(
              child: vm.items[row],
            );
          },
          divider: Container(
            color: vm.dividerC,
            height: 1.0,
          ),
        ),
      ),
    );
  }
}


class CartListSubUIVM{
  Color dividerC=Colors.white;
  double height=400;
  List<Widget> items = [];
  CartListSubUIVM(GetIntData getIndex){
    this.appendCartItemCells(getIndex);
  }
  appendCartItemCells(GetIntData getIndex){
    items.add(CartItemCells(CartItemCellsVM.dum1(), getIndex));
  }

}