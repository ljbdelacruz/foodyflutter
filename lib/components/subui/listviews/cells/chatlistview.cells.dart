import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:foody/methodinterface/widget.interface.dart';

class ChatListViewCells extends StatelessWidget {
  final GetInt2Data sliderBtn;  
  final GetIntData getIndex;
  final ChatListViewCellsVM vm;
  ChatListViewCells(this.vm, this.getIndex, this.sliderBtn);
  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                flex: 10,
                child: ListTile(
                  title: Text(
                    vm.name,
                    style: TextStyle(fontSize: 16),
                  ),
                  subtitle: Text(
                    vm.lastMessage,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 12),
                  ),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(vm.image),
                  ),
                  trailing: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        vm.time,
                        style: TextStyle(fontSize: 12),
                      ),
                      vm.hasUnreadMessage
                          ? Container(
                              margin: const EdgeInsets.only(top: 5.0),
                              height: 18,
                              width: 18,
                              decoration: BoxDecoration(
                                  color: Colors.orange,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(25.0),
                                  )),
                              child: Center(
                                  child: Text(
                                vm.newMesssageCount.toString(),
                                style: TextStyle(fontSize: 11),
                              )),
                            )
                          : SizedBox()
                    ],
                  ),
                  onTap: () {
                    //
                    this.getIndex(vm.index);
                  },
                ),
              ),
            ],
          ),
          Divider(
            endIndent: 12.0,
            indent: 12.0,
            height: 0,
          ),
        ],
      ),
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'Archive',
          color: Colors.blue,
          icon: Icons.archive,
          onTap: () {
            //archive 
            this.sliderBtn(vm.index, 0);
          },
        ),
        // IconSlideAction(
        //   caption: 'Share',
        //   color: Colors.indigo,
        //   icon: Icons.share,
        //   onTap: () {

        //   },
        // ),
      ],
    );
  }
}



class ChatListViewCellsVM{
  int index;
  String image;
  String lastMessage;
  String name;
  String time;
  bool hasUnreadMessage;
  int newMesssageCount;
  ChatListViewCellsVM(this.index, this.image, this.lastMessage, this.name, this.time, this.hasUnreadMessage, this.newMesssageCount);

  ChatListViewCellsVM.dum1(){
    this.index=0;
    this.image="assets/images/home.png";
    this.lastMessage="Hello World";
    this.name="Lainel John Dela Cruz 2";
    this.time="22:40 PM";
    this.hasUnreadMessage=true;
    this.newMesssageCount=2;
  }
  ChatListViewCellsVM.dum2(){
    this.index=1;
    this.image="assets/images/home.png";
    this.lastMessage="Hello World 2";
    this.name="Lainel John Dela Cruz 3";
    this.time="22:41 PM";
    this.hasUnreadMessage=false;
    this.newMesssageCount=0;
  }
  
}