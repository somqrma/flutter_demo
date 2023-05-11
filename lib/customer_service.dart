import 'dart:convert';

import 'package:flutter_demo/models/api_response.dart';
import 'package:http/http.dart' as http;

import 'models/customer.dart';

class CustomerService {
  static String serverAddress = "https://boss-info-test-02.sandbox.operations.eu.dynamics.com/data/";

  static String cookie = "";

  static Future<List<Customer>> getCustomers() async {
    return httpGetResponse('CustomersV3');
  }

  static Future<List<Customer>> httpGetResponse(String apiURI) async {
    final http.Response response = await http.get(Uri.parse(serverAddress + apiURI), headers: {"Cookie": cookie});
    if (response.statusCode == 200) {
      var parsedResponse = ApiResponse.fromJson(json.decode(response.body));
      final List<Customer> customers = parsedResponse.value.map((personJson) => Customer.fromJson(personJson)).toList();
      return customers;
    } else {
      throw Exception('Failed to load customers');
    }
  }

}
