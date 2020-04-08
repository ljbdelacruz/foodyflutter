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
        crossAxisCount: vm.crossAxisCount,
        childAspectRatio: vm.widthAspect / vm.heightAspect,
        crossAxisSpacing: vm.crossAxisSpacing,
        mainAxisSpacing: vm.mainAxisSpacing,
      ),
    );
  }
  Widget getCellsOption(int index, ctx){
    if(vm.cellType == CollectionListCellType.menu){
      return MenuItemCells(CategoryCellsVM(vm.items[index].index, vm.items[index].title, vm.items[index].imageUrl, vm.items[index].titleFz), getIndex,);      
    }else{
      return CategoryCells(CategoryCellsVM(vm.items[index].index, vm.items[index].title, vm.items[index].imageUrl, vm.items[index].titleFz), getIndex);
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
}

enum CollectionListCellType{
  category, menu
}



