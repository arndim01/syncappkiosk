import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:syncappkiosk/models/transaction/transaction.model.dart';
import 'package:syncappkiosk/models/transaction/transactionlog.model.dart';
import 'package:syncappkiosk/services/transaction.service.dart';

class TransactionController extends GetxController {
  late final TransactionService _transactionService;
  late TextEditingController accountController;
  late String referenceNumber;

  var isLoading = true.obs;
  @override
  void onInit() {
    super.onInit();
    _transactionService = Get.put(TransactionService());
    accountController = TextEditingController(text: '09');
    referenceNumber = '';
  }

  Future<String?> create(String? number) async {
    try {
      isLoading(true);

      var details =
          await _transactionService.create(Transaction(number: number));
      if (details != null) {
        return details.referenceNumber.toString();
      }
    } catch (e) {
      print(e);
      return null;
    } finally {
      isLoading(false);
    }
    return null;
  }

  Future<bool?> createLog(String referenceNumber, int amount) async {
    try {
      isLoading(true);

      var details = await _transactionService.createLog(
          TransactionLog(referenceNumber: referenceNumber, amount: amount));
      if (details) {
        return true;
      }
    } catch (e) {
      print(e);
      return false;
    } finally {
      isLoading(false);
    }
    return false;
  }
}
