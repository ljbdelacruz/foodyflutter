import 'package:flutter/material.dart';
import 'package:foody/methodinterface/widget.interface.dart';

import 'cells/chatitemreceiver.cells.dart';
import 'cells/chatitemsender.cells.dart';
class ChatListSubUI extends StatelessWidget {
  final GetIntData getIndex;
  final ChatListSubUIVM vm;
  ChatListSubUI(this.vm, this.getIndex);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
                          controller: vm._scrollController,
                          // reverse: true,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: vm.childList,
                          )
    );
  }
}

class ChatListSubUIVM{
  ScrollController _scrollController = ScrollController();
  var childList = <Widget>[];

  setupDummy(GetIntData getIndex){
    this.appendSender("Tester Message", "22:40 PM", getIndex);
    this.appendReceiver("Tester", "22:40 PM", getIndex);    
    this.appendReceiver("asdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasd", "22:40 PM", getIndex);        
  }
  appendSender(String content, String time, GetIntData getIndex){
    childList.add(
      Align(alignment: Alignment(1, 0), child:ChatItemSenderCells(ChatItemCellsVM(content, time), getIndex))
    );
  }
  appendReceiver(String content, String time, GetIntData getIndex){
    childList.add(
      Align(alignment: Alignment(-1, 0), child:ChatItemReceiverCells(ChatItemCellsVM(content, time), getIndex))
    );
  }


}



