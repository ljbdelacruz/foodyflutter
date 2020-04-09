
import 'package:flutter/material.dart';
import 'package:foody/components/subui/listviews/cells/chatitemsender.cells.dart';
import 'package:foody/methodinterface/widget.interface.dart';

class ChatItemReceiverCells extends StatelessWidget {
  final GetIntData getIndex;
  final ChatItemCellsVM vm;
  ChatItemReceiverCells(this.vm, this.getIndex);
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
      padding:
          const EdgeInsets.only(right: 75, left: 8.0, top: 8.0, bottom: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0),
            bottomRight: Radius.circular(15),
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15)),
        child: Container(
          color: vm.bgColor,
          child: Stack(children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 8.0, left: 8.0, top: 8.0, bottom: 15.0),
              child: Text(
                vm.content,
              ),
            ),
            Positioned(
              bottom: 1,
              right: 10,
              child: Text(
                vm.time,
                style: TextStyle(
                    fontSize: 10, color: Colors.black.withOpacity(0.6)),
              ),
            )
          ]),
        ),
      ),
    ));
  }
}


