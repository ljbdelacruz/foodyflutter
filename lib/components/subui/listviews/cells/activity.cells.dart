
import 'package:flutter/material.dart';
import 'package:foody/methodinterface/widget.interface.dart';


class ActivityCells extends StatelessWidget {
  final GetIntData billerTag;
  final ActivityCellsVM vm;
  ActivityCells(this.vm, this.billerTag);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            this.billerTag(this.vm.index);
          },
          child: Row(children: [
            Visibility(visible: this.vm.image.length > 0 ? true : false, child: Expanded(flex: 1, child: Image.asset(this.vm.image),),),
            Column(children: [
              Text(vm.title, style:TextStyle(fontSize:vm.titleFz)),
              Text(vm.desc, style:TextStyle(fontSize:vm.descFz)),
              Text(vm.status, style:TextStyle(fontSize:vm.statusFz))
            ],)
          ],)
        ),
      ),
    );
  }
}

class ActivityCellsVM{
  String title;
  double titleFz = 10;
  String desc;
  double descFz = 10;
  String status;
  double statusFz = 10;
  String image;
  int index=0;
  ActivityCellsVM.item(this.title, this.desc, this.status, this.image, this.index){
    this.titleFz=12;
    this.descFz=12;
    this.statusFz=10;
  }
}


