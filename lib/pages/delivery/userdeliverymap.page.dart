import 'package:flutter/material.dart';
import 'package:foody/components/header/design3.header.dart';
import 'package:foody/config/Constants.config.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';


class UserDeliveryMapPage extends StatefulWidget{
  final UserDeliveryMapPageVM vm=UserDeliveryMapPageVM();
  UserDeliveryMapPage();
  @override
  _UserDeliveryMapPageState createState() => _UserDeliveryMapPageState();
}
class _UserDeliveryMapPageState extends State<UserDeliveryMapPage> {


  void _onMapCreated(GoogleMapController controller) {
    widget.vm._controller.complete(controller);
  }
  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
                        color:Constants.instance.themeColor,
                        child: Scaffold(
                        appBar: PreferredSize(child: Design3Header(widget.vm.header, (){
                          //btn clicked
                        }), preferredSize: Size.fromHeight(100)),
                        backgroundColor: Colors.transparent,
                        body:
                          SingleChildScrollView(child:Column(
                              children: [
                                Container(height:300, child: GoogleMap(
                                    onMapCreated: _onMapCreated,
                                    initialCameraPosition: CameraPosition(
                                      target: widget.vm.center,
                                      zoom: 11.0,
                                    ),
                                  )
                                )
                              ]
                          )
                          )
                        ,),
        )
      );
  }

}

class UserDeliveryMapPageVM{
  Design3HeaderVM header;
  Completer<GoogleMapController> _controller = Completer();
  LatLng center = const LatLng(45.521563, -122.677433);
  UserDeliveryMapPageVM(){
    this.header=Design3HeaderVM();
  }

}