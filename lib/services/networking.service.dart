
import 'dart:convert';

import 'package:foody/methodinterface/widget.interface.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:connectivity/connectivity.dart';

class NetworkingService {
  static NetworkingService instance=NetworkingService();

  Map<String, String> sheader(){
    return {"Content-Type":"application/x-www-form-urlencoded"};
  }

  checkInternetConnection(NormalCallback hasInterent, GetStringData fcall){
    (Connectivity().checkConnectivity()).then((connectivityResult){
        if (connectivityResult == ConnectivityResult.mobile) {
          // I am connected to a mobile network.
          hasInterent();
        } else if (connectivityResult == ConnectivityResult.wifi) {
          // I am connected to a wifi network.
          hasInterent();
        }else{
          fcall("Please make sure internet connection in available");
        }
    });    
  }
  postRequest(String baseURL, Map<String, dynamic> body, Map<String, dynamic> headers, GetDynamicData scall, GetStringData fcall){
      print(baseURL);
      print(headers.toString());
      NetworkingService.instance.checkInternetConnection((){
        http.post(baseURL, 
                  body: body,
                  headers: headers).then((response){
              print(body.toString());
              NetworkingService.instance.responseHandler(response, (data){
                scall(data);
              }, fcall);
            }).catchError((err){
              fcall(err.toString());
        });
      }, fcall);
  }
  getRequest(String url, Map<String, dynamic> headers, GetDynamicData scall, GetStringData fcall){
      NetworkingService.instance.checkInternetConnection((){
        http.get(url, 
                  headers: headers
                  ).then((response){
                    NetworkingService.instance.responseHandler(response, (data){
                      scall(data);
                  }, fcall);
        }).catchError((err){
          fcall(err.toString());
        });
      }, fcall);
  }
  putRequest(String baseURL, Map<String, dynamic> body, Map<String, dynamic> headers, GetDynamicData scall, GetStringData fcall){
      print(baseURL);
      print(body.toString());
      print(headers.toString());
      NetworkingService.instance.checkInternetConnection((){
        http.put(baseURL, 
                  body: body,
                  headers: headers).then((response){
              NetworkingService.instance.responseHandler(response, (data){
                print("Response");
                print(data);
                scall(data);
              }, fcall);
            }).catchError((err){
              fcall(err.toString());
        });
      }, fcall);
  }



  responseHandler(Response resp, GetDynamicData callback, GetStringData fcallback){
      print("Response Code: "+resp.statusCode.toString());
      if (resp.statusCode == 200){
          final body = json.decode(resp.body);
          print(resp.body.toString());
          callback(body);
          // middleware for request interceptor
        }else{
          print("ERROR HERE:"+resp.statusCode.toString());
          fcallback("Sorry we are unable to process this request right now");
        }
  }

}