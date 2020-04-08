
import 'package:flutter/material.dart';
import 'package:foody/methodinterface/widget.interface.dart';


class ActivityCells extends StatelessWidget {
  final GetIntData getIndex;
  final ActivityCellsVM vm;
  ActivityCells(this.vm, this.getIndex);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            this.getIndex(this.vm.index);
          },
          child: Card(child: Padding(padding: EdgeInsets.all(20), child: Row(children: [
            Padding(padding: EdgeInsets.fromLTRB(0, 0, 20, 0), child: Visibility(visible: this.vm.image.length > 0 ? true : false, child: Image.asset(this.vm.image, width:50, height:50),)),
            Column(children: [
                Align(alignment:Alignment.topLeft, child: Text(vm.title, textAlign: TextAlign.left, style:TextStyle(fontSize:vm.titleFz, color:Colors.black))),
                Align(alignment:Alignment.topLeft, child: Text(vm.desc, textAlign: TextAlign.left, style:TextStyle(fontSize:vm.descFz, color:Colors.black))),
                Align(alignment:Alignment.topLeft, child: Text(vm.status, textAlign: TextAlign.left, style:TextStyle(fontSize:vm.statusFz, color:Colors.black))),
            ],)
          ],))
          )
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


