import 'package:flutter/material.dart';
import 'package:foody/methodinterface/widget.interface.dart';
import 'package:flutter_section_table_view/flutter_section_table_view.dart';
import 'cells/activity.cells.dart';
class TableViewListSubUI extends StatelessWidget {
  final GetIntData getIndex;
  final TableViewListSubUIVM vm;
  TableViewListSubUI(this.vm, this.getIndex);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: vm.height,
      child: SafeArea(
        child: SectionTableView(
          sectionCount: 1,
          numOfRowInSection: (section) {
            return vm.activityCells.length;
          },
          cellAtIndexPath: (section, row) {
            return Container(
              child: ActivityCells(vm.activityCells[row], this.getIndex),
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


class TableViewListSubUIVM{
  Color dividerC=Colors.white;
  double height=400;
  List<ActivityCellsVM> activityCells=[];
  TableViewListSubUIVM.setHeight(this.height);
  appendActivityCells(int index, String title, String desc, String status, String image){
    activityCells.add(ActivityCellsVM.item(title, desc, status, image, index));
  }


}