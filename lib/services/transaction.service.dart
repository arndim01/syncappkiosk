import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:get/get_connect/connect.dart' hide Response;
import 'package:syncappkiosk/models/transaction/transaction.model.dart';

class TransactionService extends GetConnect {
  final String TRANSACTION_URL = 'http://localhost:3010/transaction/create';
  final String TRANSACTION_LOG_URL =
      'http://localhost:3010/transactionlog/create';

  Future<Transaction?> create(Transaction model) async {
    var dio = Dio();
    Response response =
        await dio.post(TRANSACTION_URL, data: json.encode(model.toJson()));
    if (response.statusCode == HttpStatus.ok) {
      print(response.data.toString());
      return Transaction.fromJson(response.data);
    } else {
      return null;
    }
  }
}
