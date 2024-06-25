// ignore_for_file: depend_on_referenced_packages

import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:convert';
import 'package:path/path.dart';
import 'package:take_hand/application_layer/utils/checkenternet.dart';
import 'package:take_hand/application_layer/utils/statusrequst.dart';
import 'package:take_hand/main.dart';

class CurdSQL {
  Map<String, String> myheaders = {
    'Content-Type': 'application/json',
    'X-Requested-With': 'XMLHttpRequest',
    'Authorization':
        'Bearer ${sharedPreferences.getString('token').toString()}',
  };
  Map<String, String> myheaders2 = {
    'Content-Type': 'application/json',
    'Authorization':
        'Bearer ${sharedPreferences.getString('token').toString()}',
  };

  Map<String, String> myheaders3 = {
    'Authorization':
        'Bearer ${sharedPreferences.getString('token').toString()}',
  };
  getrequest(
    String url, {
    bool? encode,
    Map<String, String>? myheadersres,
  }) async {
    try {
      if (await checkInternet()) {
        var respos = await http.get(Uri.parse(url), headers: myheadersres);
        if (respos.statusCode == 200 || respos.statusCode == 201) {
          dynamic body = jsonDecode(respos.body);
          return body;
        } else if (respos.statusCode == 401) {
          // getx.Get.offAll(() => LoginScreen());
          // sharedPreferences.remove('token');
          return;
        } else {
          dynamic body = jsonDecode(respos.body);
          return body;
        }
      } else {
        print('offline');
        return StatusRequest.offlinefailure;
      }
    } catch (e) {
      print('Catch : $e');
      return StatusRequest.serverfailure;
    }
  }

  postrequest(String url, Map data,
      {bool? encode, Map<String, String>? myheadersres}) async {
    try {
      if (await checkInternet()) {
        Response respos = await http.post(
          Uri.parse(url),
          body: encode == true ? jsonEncode(data) : data,
          headers: myheadersres,
        );
        print(respos.body);
        print(respos.statusCode);
        if (respos.statusCode == 200 || respos.statusCode == 201) {
          dynamic body = jsonDecode(respos.body);
          return body;
        } else {
          print('serverfailure');
          return StatusRequest.erorr;
        }
      } else {
        print('offline');
        return StatusRequest.offlinefailure;
      }
    } catch (e) {
      print('Catch : $e');
      return StatusRequest.serverfailure;
    }
  }

  putrequest(String url, Map data, {bool? encode}) async {
    try {
      if (await checkInternet()) {
        Response respos = await http.put(
          Uri.parse(url),
          body: encode == true ? jsonEncode(data) : data,
          headers: myheaders2,
        );
        if (respos.statusCode == 200 || respos.statusCode == 201) {
          dynamic body = jsonDecode(respos.body);
          return body;
        } else {
          print(respos.body);
          return StatusRequest.serverfailure;
        }
      } else {
        return StatusRequest.offlinefailure;
      }
    } catch (e) {
      print('ERorr $e');
      return StatusRequest.erorr;
    }
  }

  putrequestforFile(
    String url,
    Map data,
    File file,
  ) async {
    MultipartRequest requst = http.MultipartRequest('Put', Uri.parse(url));
    int length = await file.length();
    ByteStream stream = http.ByteStream(file.openRead());
    MultipartFile multefile = http.MultipartFile(
      'uploads/',
      stream,
      length,
      filename: basename(file.path),
    );
    requst.headers.addAll(myheaders2);
    requst.files.add(multefile);
    data.forEach((key, value) {
      requst.fields[key] = value;
    });
    StreamedResponse myrequest = await requst.send();
    Response response = await http.Response.fromStream(myrequest);
    print('-----------------------------------------');
    print(response.body);
    print(response.statusCode);
    if (myrequest.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print('erorrrrrr');
    }
  }

  postrequestforFile(
    String url,
    namepost,
    Map data,
    File file,
  ) async {
    MultipartRequest requst = http.MultipartRequest('Post', Uri.parse(url));
    int length = await file.length();
    ByteStream stream = http.ByteStream(file.openRead());
    MultipartFile multefile = http.MultipartFile(namepost, stream, length,
        filename: basename(file.path));
    requst.headers.addAll(myheaders);
    requst.files.add(multefile);
    data.forEach((key, value) {
      requst.fields[key] = value;
    });
    StreamedResponse myrequest = await requst.send();
    Response response = await http.Response.fromStream(myrequest);
    print(response.body);
    if (myrequest.statusCode == 200) {
      print(response.body);
      return jsonDecode(response.body);
    } else {}
  }
}
