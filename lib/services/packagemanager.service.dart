

import 'package:package_info/package_info.dart';

class PackageManagerService{

  getPackageKeyHash(){
      PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
        PackageInfo info = packageInfo;        
        
      });
  }
}