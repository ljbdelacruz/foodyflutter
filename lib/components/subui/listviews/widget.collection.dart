import 'package:flutter/material.dart';

class WidgetCollection extends StatelessWidget {
  final WidgetCollectionVM vm;
  WidgetCollection(this.vm);
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: vm.childList.length,
      itemBuilder: (ctx, i) => vm.childList[i],
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: vm.crossAxisCount,
        childAspectRatio: vm.widthAspect / vm.heightAspect,
        crossAxisSpacing: vm.crossAxisSpacing,
        mainAxisSpacing: vm.mainAxisSpacing,
      ),
    );
  }
}
class WidgetCollectionVM{
  var childList = <Widget>[];
  Color dividerC = Colors.white;
  int crossAxisCount=3;
  double crossAxisSpacing = 10;
  double mainAxisSpacing = 10;
  double widthAspect=3;
  double heightAspect=3;
  WidgetCollectionVM();
  WidgetCollectionVM.advanceSetup(this.widthAspect, this.heightAspect, this.crossAxisCount, this.crossAxisSpacing, this.mainAxisSpacing, this.childList);
}


