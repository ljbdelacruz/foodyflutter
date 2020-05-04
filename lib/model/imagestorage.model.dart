

import 'package:foody/services/verifier.service.dart';

class ImageStorageModel{
  String id;
  String source;
  String type;
  String ownerId;

  ImageStorageModel.json(dynamic data){
    this.id=VerifierService.instance.validateString(data["id"]);
    this.source=VerifierService.instance.validateString(data["source"]);
    this.type=VerifierService.instance.validateString(data["type"]);
    this.ownerId=VerifierService.instance.validateString(data["ownerId"]);
  }
}

class ImageStorageParam{
  String src;
  String type;
  String ownerId;
  ImageStorageParam.newImage(this.src, this.type, this.ownerId);
  Map<String, dynamic> toNewParam(){
    return {"src":this.src, "type":this.type, "ownerId":this.ownerId};
  }
}