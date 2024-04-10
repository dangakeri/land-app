import 'package:flutter/material.dart';
import 'package:land/ApiService/api_service.dart';

class MakePaymentProvider extends ChangeNotifier {
  bool isUploading = false;
  bool isLoading = false;
  String phoneNumber = "";
  String location = "";
  String size = "";
  String owner = "";
  String description = "";
  String price = "";
  String? image;

  Future makePayment(String amount) async {
    isLoading = true;
    notifyListeners();
    await ApiService().makePayment(amount, phoneNumber);

    isLoading = false;
    notifyListeners();
  }

  Future uploadLand(BuildContext context) async {
    isUploading = true;
    notifyListeners();

    await ApiService().createListingDio(
        context, location, size, description, owner, price, image!);
  }
}
