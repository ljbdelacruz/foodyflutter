import 'package:flutter/material.dart';
import 'package:foody/components/subui/listviews/cells/category.cells.dart';
import 'package:foody/components/subui/listviews/cells/menuitem.cells.dart';
import 'package:foody/methodinterface/widget.interface.dart';

import 'cells/activity.cells.dart';

class CollectionListSubUI extends StatelessWidget {
  final GetIntData getIndex;
  final CollectionListSubUIVM vm;
  CollectionListSubUI(this.vm, this.getIndex);
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: vm.cellType == CollectionListCellType.activity ? vm.activityCells.length : vm.items.length,
      itemBuilder: (ctx, i) => getCellsOption(i, ctx),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: vm.crossAxisCount,
        childAspectRatio: vm.widthAspect / vm.heightAspect,
        crossAxisSpacing: vm.crossAxisSpacing,
        mainAxisSpacing: vm.mainAxisSpacing,
      ),
    );
  }
  Widget getCellsOption(int index, ctx){
    switch(vm.cellType){
      case CollectionListCellType.menu:
        return MenuItemCells(vm.items[index], getIndex,);
        break;
      case CollectionListCellType.category:
        return CategoryCells(vm.items[index], getIndex);
        break;
      case CollectionListCellType.activity:
        return ActivityCells(vm.activityCells[index], getIndex);
        break;
    }
  }
}

class CollectionListSubUIVM{
  CollectionListCellType cellType=CollectionListCellType.menu;
  int crossAxisCount=3;
  double crossAxisSpacing = 10;
  double mainAxisSpacing = 10;
  double widthAspect=3;
  double heightAspect=3;
  double fontSize=10;
  List<ActivityCellsVM> activityCells=[];
  List<CategoryCellsVM> items=[];
  CollectionListSubUIVM(this.widthAspect, this.heightAspect){
    this.fontSize=15;
  }
  CollectionListSubUIVM.footer(this.widthAspect, this.heightAspect, this.crossAxisCount){
    this.crossAxisSpacing=0;
    mainAxisSpacing=0;
  }
  CollectionListSubUIVM.product(this.widthAspect, this.heightAspect, this.crossAxisCount, this.crossAxisSpacing, this.mainAxisSpacing);
  appendItems(int index, String title, String image){
    items.add(CategoryCellsVM(index, title, image, this.fontSize));
  }
  appendActivityCells(int index, String title, String desc, String status, String image){
    this.cellType = CollectionListCellType.activity;
    this.widthAspect=1;
    this.heightAspect=1;
    this.crossAxisCount=1;
    this.crossAxisSpacing=0;
    this.mainAxisSpacing=0;
    activityCells.add(ActivityCellsVM.item(title, desc, status, image, index));
  }
}

enum CollectionListCellType{
  category, menu, activity
}



