import 'package:flutter/material.dart';
import 'package:foody/components/subui/listviews/tableviewlist.subui.dart';
import 'package:foody/methodinterface/widget.interface.dart';
class ActivitySubPage extends StatelessWidget {
  final GetIntData getIndex;
  final ActivitySubPageVM vm;
  ActivitySubPage(this.vm, this.getIndex);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child:Column(children: [
        Container(height:200, child:TableViewListSubUI(vm.collectionVM, this.getIndex))
      ])
    );
  }
}

class ActivitySubPageVM{
  TableViewListSubUIVM collectionVM;
  ActivitySubPageVM(){
    this.collectionVM=TableViewListSubUIVM.setHeight(700);
    this.collectionVM.appendActivityCells(0, "Title 1 here", "description", "Status: PENDING", "assets/images/plus.png");
    this.collectionVM.appendActivityCells(1, "Title 2 here", "description", "Status: PENDING", "assets/images/plus.png");
  }
}

