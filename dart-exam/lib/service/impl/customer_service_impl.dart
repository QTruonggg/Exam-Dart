import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dart_exam/model/customer.dart';
import 'package:dart_exam/service/customer_service.dart';

class CustomerServiceImpl implements CustomerService {
  final String baseUrl;

  CustomerServiceImpl({required this.baseUrl});

  @override
  Future<void> addCustomer(Customer customer) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/customers'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(customer.toJson()),
    );

    print('Add Customer Response: ${response.statusCode}');
  }

  @override
  Future<List<Customer>> getAllCustomers() async {
    final response = await http.get('$baseUrl/api/customers');
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Customer.valueFromJson(json)).toList();
    } else {
      print('Failed to get customers. Error: ${response.statusCode}');
      return [];
    }
  }
}