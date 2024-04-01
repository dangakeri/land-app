import 'dart:convert';

import 'package:http/http.dart' as http;

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

  Future<http.Response> makePayment(String amount) async {
    try {
      var response = await http.post(
          headers: {
            'Content-type': 'application/json',
            'Accept': 'application/json',
          },
          Uri.parse(
              'https://kifaru.elarchdesigns.com/api/v1/mpesa/mpesaPayment'),
          body: jsonEncode({
            "phone": "254759401048",
            "amount": amount,
            "description": "Payment for X product at Mess Pay"
          }));
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
