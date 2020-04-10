import 'package:flutter/material.dart';
import 'package:foody/methodinterface/widget.interface.dart';
import 'package:flutter_section_table_view/flutter_section_table_view.dart';
import 'cells/chatlistview.cells.dart';
class ChatRoomListSubUI extends StatelessWidget {
  final GetInt2Data sliderOnClick;
  final GetIntData getIndex;
  final ChatRoomListSubUIVM vm;
  ChatRoomListSubUI(this.vm, this.getIndex, this.sliderOnClick);

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
              child: ChatListViewCells(vm.items[row], this.getIndex, this.sliderOnClick)
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


class ChatRoomListSubUIVM{
  Color dividerC=Colors.white;
  List<ChatListViewCellsVM> items=[];
  double height=400;

  ChatRoomListSubUIVM(this.height){
    this.items.add(ChatListViewCellsVM.dum1());
    this.items.add(ChatListViewCellsVM.dum2());
  }
}