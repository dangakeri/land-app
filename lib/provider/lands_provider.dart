import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:land/ApiService/api_service.dart';
import 'package:land/model/land_model.dart';

class LandsProvider extends ChangeNotifier {
  List<LandModel> landmodel = [];
  List<LandModel> get lands => landmodel;
  bool isLoading = false;

  Future allLands() async {
    isLoading = true;
    notifyListeners();
    var response = await ApiService().getAllLand();
    isLoading = false;
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data']['data'];
      landmodel = data.map((e) => LandModel.fromJson(e)).toList();
      print(landmodel);
      notifyListeners();
    }
    print(response.body);
    notifyListeners();
  }
}
