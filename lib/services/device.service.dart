

import 'package:foody/methodinterface/widget.interface.dart';
import 'package:package_info/package_info.dart';
import 'package:location/location.dart';


class DeviceService{
  static DeviceService instance=DeviceService();
  DeviceInfo deviceinfo=DeviceInfo();
  getDeviceInfo(){
    
  }

}


class DeviceInfo{
  double longitude=0;
  double latitude=0;
  DeviceInfo();



  //location service functionalities
  bool locationPermission(Location location){
    location.hasPermission().then((permissionStats){
      if(permissionStats == PermissionStatus.granted){
        return true;
      }else{
        return false;
      }
    });
    return false;
  }
  enableService(Location location, NormalCallback scall, NormalCallback fcall){
    location.serviceEnabled().then((isEnabled){
      if(isEnabled){
        location.requestService().then((isServiceEnabled){
          if(isServiceEnabled){
            scall();
          }else{
            fcall();
          }
        });
      }else{
        fcall();
      }
    });

  }

  getLocation(GetStringData fcall, GetLocationData scall){
    Location location = new Location();
    this.enableService(location, (){
      if(this.locationPermission(location)){
        location.getLocation().then((ldata){
          this.longitude=ldata.longitude;
          this.latitude=ldata.latitude;
          scall(ldata);
        });
      }else{
        fcall("Please enable service on location on this app");
      }
    }, (){
      //failed
      fcall("Service unavailable on this device");
    });
  }


}