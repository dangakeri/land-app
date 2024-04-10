import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class ApiService {
  // ignore: non_constant_identifier_names
  String base_url = 'https://landy-1o25.onrender.com/api/v1';

  Future<http.Response> loginUser() async {
    try {
      var response = await http.post(
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode(
          {
            'email': 'mainamwangi12@gmail.com',
            'password': '123455677',
          },
        ),
        Uri.parse('$base_url/user/login'),
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<http.Response> getAllLand() async {
    try {
      var response = await http.get(Uri.parse('$base_url/land/getLands'));

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<http.Response> makePayment(String amount, String phoneNumber) async {
    try {
      var response = await http.post(
          headers: {
            'Content-type': 'application/json',
            'Accept': 'application/json',
          },
          Uri.parse(
              'https://payment-api-ozou.onrender.com/api/v1/mpesa/mpesaPayment'),
          body: jsonEncode({
            "phone": phoneNumber.replaceFirst("0", "254"),
            "amount": amount,
            "description": "Payment for X product at xxxx",
            "agentName": "LAND PURCHASE KENYA"
          }));
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> createListingDio(
    BuildContext context,
    String location,
    String size,
    String description,
    String owner,
    String price,
    String image,
  ) async {
    print(image);
    var dio = Dio();

    var formData = FormData.fromMap({
      "location": location,
      "size": size,
      "owner": owner,
      "description": description,
      "price": price,
      "image": await MultipartFile.fromFile(
        image,
      ),
    });

    print(formData.fields);
    print(formData.files[0].value.filename);

    try {
      // dio.options.headers["Content-Type"] = "multipart/form-data";

      var res = await dio.post("$base_url/land/createLand", data: formData);
      print(res.data);

      return res;
    } on DioError catch (e) {
      print(e);
      throw Exception(e);
    }
  }
}

// TODO => [Tasks]
// . Buyer can be a seller and Seller can be a Buyer
// . Check on Authentication
// . Payment integration 
