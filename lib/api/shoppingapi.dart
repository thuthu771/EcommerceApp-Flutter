//import 'dart:convert';

import 'package:flutter/foundation.dart';
//import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:online_ui/shoppingmodel.dart';

class Shoppingimg with ChangeNotifier {
  List<Shoppingg>? _imageUrl;
  List<Shoppingg>? get imageUrl => _imageUrl;

  String baseurl = "https://fakestoreapi.com/products";
  bool _isloading = false;
  bool get isloading => _isloading;

  //String get images => null;

  //String get images => null;

  Future<void> fetchdata() async {
    _isloading = true;
    var response = await http.get(Uri.parse(baseurl));
    if (response.statusCode == 200) {
      if (kDebugMode) {
        print(response.body);
      }

      final data = shoppinggFromJson(response.body);
      _imageUrl = data;
      _isloading = false;

      notifyListeners();
    } else {
      if (kDebugMode) {
        print("error");
      }
    }
  }
}
