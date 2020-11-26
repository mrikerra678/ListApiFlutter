import 'dart:async';
import 'package:http/http.dart' as http;

const baseUrl = "https://randomuser.me/api";

class API {
  static Future getUsers() {
    var url = baseUrl + "/?results=20&nat=es";
    return http.get(url);
  }
}
