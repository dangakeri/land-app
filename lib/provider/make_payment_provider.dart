import 'package:flutter/material.dart';
import 'package:land/ApiService/api_service.dart';

class MakePaymentProvider extends ChangeNotifier {
  bool isLoading = false;

  Future makePayment(String amount) async {
    isLoading = true;
    notifyListeners();
    var response = await ApiService().makePayment(amount);
    print(response.body);
    isLoading = false;
    notifyListeners();
  }
}
