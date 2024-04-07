import 'package:flutter/material.dart';
import 'package:land/ApiService/api_service.dart';

class MakePaymentProvider extends ChangeNotifier {
  bool isLoading = false;
  String phoneNumber = "";
  String location = "";
  String size = "";
  String owner = "";
  String description = "";
  String price = "";

  Future makePayment(String amount) async {
    isLoading = true;
    notifyListeners();
    var response = await ApiService().makePayment(amount, phoneNumber);
    print(response.body);
    isLoading = false;
    notifyListeners();
  }
}
