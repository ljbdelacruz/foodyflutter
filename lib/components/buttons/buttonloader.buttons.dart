import 'dart:async';
import 'package:flutter/material.dart';

class ButtonLoader extends StatefulWidget{
  final ButtonLoaderVM vm;
  final ButtonLoaderCallback onButtonClick;
  final ButtonLoaderCallbackComplete loaderComplete;  
  //0-no animation, 1-start animation, 2-end animation success
  ButtonLoader(this.vm, this.onButtonClick, this.loaderComplete);
  @override
  _ButtonLoader createState() => _ButtonLoader();
}
class _ButtonLoader extends State<ButtonLoader> {
    bool buttonEnabled=true;
    @override
    Widget build(BuildContext context) {
      return Column(children: <Widget>[
            new Padding(
              padding: const EdgeInsets.all(0),
              child: new MaterialButton(
                child: setUpButtonChild(),
                onPressed: () {
                  setState(() {
                    if (widget.vm.mystate == 0) {
                      animateButton();
                    }
                  });
                },
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(widget.vm.bRadius)),
                enableFeedback: this.buttonEnabled,
                elevation: 4.0,
                minWidth: double.infinity,
                height: widget.vm.bHeight,
                color: widget.vm.bgColor,
              ),
            )
          ],);
    }

    Widget setUpButtonChild() {
    if (widget.vm.mystate == 0) {
      return new Text(
        widget.vm.title,
        style: TextStyle(
          color: widget.vm.titleC,
          fontSize: 16.0,
        ),
      );
    } else if (widget.vm.mystate == 1) {
      this.buttonEnabled=false;              
      return CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(widget.vm.titleC),
      );
    } else {
      this.buttonEnabled=true;
      Timer(Duration(milliseconds: 500), () {
        widget.loaderComplete();
      });
      return Icon(Icons.check, color: Colors.white);
    }
  }
  void animateButton() {
      widget.onButtonClick();    
  }
}

class ButtonLoaderVM{
  String title;
  Color titleC=Colors.black;
  int mystate=0;
  double titleFz;
  Color bgColor = Colors.yellow;
  double bRadius = 100;
  double bHeight=50;

  ButtonLoaderVM(this.title, this.mystate, this.titleFz, bgColor, this.bRadius, this.bHeight);
  ButtonLoaderVM.preDefault(this.title, this.titleFz, this.mystate){
      this.bRadius=100;
  }
  ButtonLoaderVM.successMessage(this.title, this.titleFz, this.mystate){
      this.bRadius=11;
  }

}


typedef ButtonLoaderCallback = void Function();
typedef ButtonLoaderCallbackComplete = void Function();