import 'package:flutter/material.dart';
import 'package:flutter_section_table_view/flutter_section_table_view.dart';
import 'package:foody/methodinterface/widget.interface.dart';

import 'cells/topay.cell.dart';

class WidgetlistVSubUI extends StatelessWidget {
  final WidgetlistVSubUIVM vm;
  WidgetlistVSubUI(this.vm);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: vm.height,
      child: SafeArea(
        child: SectionTableView(
          sectionCount: 1,
          numOfRowInSection: (section) {
            return vm.childList.length;
          },
          cellAtIndexPath: (section, row) {
            return Container(
              child: vm.childList[row],
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
class WidgetlistVSubUIVM{
  var childList = <Widget>[];
  double height = 400;
  Color dividerC = Colors.grey;
  WidgetlistVSubUIVM();

  appendToPayCell(int index, double amount, String orderDesc, String image, GetIntData getIndex, GetIntData payBtn){
    this.childList.add(ToPayCells(ToPayCellsVM(index, amount, orderDesc, image), getIndex, payBtn));
  }

}



