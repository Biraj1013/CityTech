import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class ApiService {
  var client = http.Client();

  Future<dynamic> get(String url) async {
    try {
      var response = await client.get(Uri.parse(url), headers: <String, String>{
        "Content-Type": "application/json;Charset=UTF-8",
        "Accept-Encoding": "gzip",
        "X-XSRF-TOKEN":
            "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoidGVzdEBnbWFpbC5jb20iLCJmdWxsX25hbWUiOiJ0ZXN0IHRlc2V0IiwiaWF0IjoxNjc2NDQ4Mjg2fQ.m0Svu9uxw-_6Lu-acuQB1iHciZY7QcUvnZOHJG4UUtw"
      }).timeout(const Duration(seconds: 15), onTimeout: () async {
        var result = await InternetAddress.lookup(url);
        if (result.isEmpty || result[0].rawAddress.isEmpty) {
          throw SocketException;
        }
        throw TimeoutException;
      });
      if (response.statusCode == HttpStatus.ok) {
        return jsonDecode(response.body);
      }
    } on SocketException {
      throw Exception("Server Connection Filed!");
    } on TimeoutException {
      throw Exception("Server Connection Filed!");
    } catch (e) {
      throw e.toString();
    }
  }
}
