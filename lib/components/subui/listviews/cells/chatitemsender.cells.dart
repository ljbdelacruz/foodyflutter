
import 'package:flutter/material.dart';
import 'package:foody/methodinterface/widget.interface.dart';


class ChatItemSenderCells extends StatelessWidget {
  final GetIntData getIndex;
  final ChatItemCellsVM vm;
  ChatItemSenderCells(this.vm, this.getIndex);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(
            right: 8.0, left: 50.0, top: 4.0, bottom: 4.0),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(0),
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15)),
          child: Container(
            color: vm.bgColor,
            // margin: const EdgeInsets.only(left: 10.0),
            child: Stack(children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 12.0, left: 23.0, top: 8.0, bottom: 15.0),
                child: Text(
                  vm.content,
                ),
              ),
              Positioned(
                bottom: 1,
                left: 10,
                child: Text(
                  vm.time,
                  style: TextStyle(
                      fontSize: 10, color: Colors.black.withOpacity(0.6)),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}

class ChatItemCellsVM{
  String content;
  String time;
  Color bgColor = Colors.blue[500];
  double right=8;
  ChatItemCellsVM(this.content, this.time);
  ChatItemCellsVM.receiver(this.content, this.time, this.right);  
}


