import 'package:flutter/material.dart';
import 'package:foody/components/subui/listviews/cells/category.cells.dart';
import 'package:foody/components/subui/listviews/cells/menuitem.cells.dart';
import 'package:foody/methodinterface/widget.interface.dart';

class CollectionListSubUI extends StatelessWidget {
  final GetIntData getIndex;
  final CollectionListSubUIVM vm; 
  CollectionListSubUI(this.vm, this.getIndex);
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: vm.items.length,      
      itemBuilder: (ctx, i) => getCellsOption(i, ctx),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: vm.widthAspect / vm.heightAspect,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
  Widget getCellsOption(int index, ctx){
    if(vm.cellType == CollectionListCellType.menu){
      return MenuItemCells(CategoryCellsVM(index, vm.items[index].title, vm.items[index].imageUrl), getIndex);      
    }else{
      return CategoryCells(CategoryCellsVM(index, vm.items[index].title, vm.items[index].imageUrl), getIndex);
    }
  }
}

class CollectionListSubUIVM{
  CollectionListCellType cellType=CollectionListCellType.menu;
  double widthAspect=3;
  double heightAspect=3;
  List<CategoryCellsVM> items=[];
  CollectionListSubUIVM(this.widthAspect, this.heightAspect);
  appendItems(int index, String title, String image){
    items.add(CategoryCellsVM(index, title, image));
  }
}

enum CollectionListCellType{
  category, menu
}



