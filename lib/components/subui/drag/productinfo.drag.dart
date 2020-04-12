import 'package:flutter/material.dart';
import 'package:foody/components/label/titletext.label.dart';
import 'package:foody/themes/lightcolor.themes.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';


class ProductInfoDragSubUI extends StatelessWidget {
  final ProductInfoDragSubUIVM vm;
  ProductInfoDragSubUI(this.vm);
  @override
  Widget build(BuildContext context) {
    return _detailWidget(context);
  }


  Widget _detailWidget(BuildContext context) {
    return DraggableScrollableSheet(
      maxChildSize: .8,
      initialChildSize: .53,
      minChildSize: .53,
      builder: (context, scrollController) {
        return Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
              color: Colors.white),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                SizedBox(height: 5),
                Container(
                  alignment: Alignment.center,
                  child: Container(
                    width: 50,
                    height: 5,
                    decoration: BoxDecoration(
                        color: LightColor.iconColor,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      TitleText(text: vm.title, fontSize: 25),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              TitleText(
                                text: "\$ ",
                                fontSize: 18,
                                color: LightColor.red,
                              ),
                              TitleText(
                                text: vm.price,
                                fontSize: 25,
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              SmoothStarRating(
                                allowHalfRating: false,
                                // onRatingChanged: (v) {
                                //   // rating = v;
                                //   // setState(() {});
                                // },
                                starCount: 5,
                                rating: vm.rating,
                                size: 20,
                                filledIconData: Icons.star,
                                halfFilledIconData: Icons.star_half,
                                color: Colors.yellow,
                                borderColor: Colors.yellow,
                                spacing:0.0
                              ),
                              Text("("+vm.reviewerDisplay+")", style: TextStyle(fontSize:10),)
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                _availableSize(context),
                SizedBox(
                  height: 20,
                ),
                // _availableColor(),
                // SizedBox(
                //   height: 20,
                // ),
                _description(),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _availableSize(BuildContext context) {
    if(vm.servings.length > 0){
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TitleText(
            text: "Servings",
            fontSize: 14,
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _sizeWidget("S", context:context),
              _sizeWidget("M", isSelected: true, context:context),
              _sizeWidget("L", context:context),
              _sizeWidget("XL", context:context),
            ],
          )
        ],
      );
    }else{
      return Container();
    }
  }

  Widget _sizeWidget(String text,
      {Color color = LightColor.iconColor, bool isSelected = false, BuildContext context}) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
            color: LightColor.iconColor,
            style: !isSelected ? BorderStyle.solid : BorderStyle.none),
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color:
            isSelected ? LightColor.orange : Theme.of(context).backgroundColor,
      ),
      child: TitleText(
        text: text,
        fontSize: 16,
        color: isSelected ? LightColor.background : LightColor.titleTextColor,
      ),
    );
  }
  Widget _description() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TitleText(
          text: "Description",
          fontSize: 14,
        ),
        SizedBox(height: 20),
        Text(vm.description),
      ],
    );
  }



}

class ProductInfoDragSubUIVM{
  String title;
  String price;
  double rating;
  String description;
  int reviewer;
  String reviewerDisplay="0";
  List<ServingsUIVM> servings = [];

  ProductInfoDragSubUIVM(){
    this.title="Queens Burger asdasdasdasdadasd";
    this.price="249";
    this.description="Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";
    this.setup();
  }
  ProductInfoDragSubUIVM.setup(this.title, this.price, this.description, this.rating, this.reviewer){
    this.setup();
  }
  appendServings(String title){
    this.servings.add(ServingsUIVM(title, false));
  }

  setup(){
    if(this.title.length > 13){
      this.title=this.title.substring(0,13)+"...";
    }
    if(this.reviewer.toString().length > 3){
      this.reviewerDisplay=this.reviewer.toString().substring(0,1)+"k";
    }else{
      this.reviewerDisplay=this.reviewer.toString();
    }
  }
  selectServing(int index){
    this.servings.forEach((item){item.isSelected=false;});
    this.servings[index].isSelected=true;
  }
}

class ServingsUIVM{
  String title;
  bool isSelected;
  ServingsUIVM(this.title, this.isSelected);
}