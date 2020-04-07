import 'package:flutter/material.dart';
import 'package:foody/components/subui/listviews/cells/category.cells.dart';
import 'package:foody/components/subui/listviews/cells/menuitem.cells.dart';
import 'package:foody/methodinterface/widget.interface.dart';

class CollectionScrollSubUI extends StatelessWidget {
  final GetIntData getIndex;
  final CollectionScrollSubUIVM vm; 
  CollectionScrollSubUI(this.vm, this.getIndex);
  @override
  Widget build(BuildContext context) {
    return Container(
            child:SingleChildScrollView(scrollDirection: Axis.horizontal,
                    child: Row(children:  [
                      
                    ],
            )
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

class CollectionScrollSubUIVM{
  CollectionListCellType cellType=CollectionListCellType.menu;
  double width=3;
  double height=3;
  List<CategoryCellsVM> items=[];
  CollectionScrollSubUIVM(this.width, this.height);
  appendItems(int index, String title, String image){
    items.add(CategoryCellsVM(index, title, image));
  }
}

enum CollectionListCellType{
  category, menu
}



