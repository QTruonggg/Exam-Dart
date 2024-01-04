import 'package:dart_exam/model/customer.dart';

abstract class CustomerService {
  Future<void> addCustomer(Customer customer);
  Future<List<Customer>> getAllCustomers();
}