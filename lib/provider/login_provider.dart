import 'package:flutter/material.dart';
import 'package:land/ApiService/api_service.dart';

class LoginProvider extends ChangeNotifier {
  bool isLoading = false;

  Future loginProvider() async {
    isLoading = true;
    notifyListeners();
    var response = await ApiService().loginUser();
    print(response.body);
    isLoading = false;
    notifyListeners();
  }
}
