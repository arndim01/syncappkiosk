import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:syncappkiosk/models/transaction/receipt.model.dart';
import 'package:syncappkiosk/models/transaction/transaction.model.dart';
import 'package:syncappkiosk/models/transaction/transactionlog.model.dart';
import 'package:syncappkiosk/services/transaction.service.dart';

class TransactionController extends GetxController {
  late final TransactionService _transactionService;
  late TextEditingController accountController;
  late Receipt receipt;
  late String referenceNumber;
  late List<double> amountList;
  var isLoading = true.obs;
  @override
  void onInit() {
    super.onInit();
    _transactionService = Get.put(TransactionService());
    accountController = TextEditingController(text: '09');
    receipt = Receipt();
    referenceNumber = '';
    amountList = List.empty(growable: true);
  }

  void addAmountValue(String value){
    if (_isNumeric(value)) {
      amountList.add(double.parse(value));
    }
  }

  bool _isNumeric(String str) {
    if (str.isEmpty) {
      return false;
    }
    return double.tryParse(str) != null;
  }

  double getTotalAmount() {
    double sum = 0;
    if (amountList.isEmpty) {
      return 0;
    }
    sum = amountList.fold(0, (previousValue, element) => previousValue + element);
    return sum;
  }

  void setTransactionDetails(String referenceNumber, String accountNumber){
    receipt.setAccountNumber = accountNumber;
    receipt.setReferenceNumber = referenceNumber;
    amountList.clear();
  }

  void setTransactionAmountDetails()
  {
    double sum = 0;
    for (var n in amountList) {
      sum+=n;
    }
    print(sum);
    receipt.setAmount = sum;
    receipt.setFee = 10;
    receipt.setCashIn = sum - receipt.getFee;
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

  Future<bool?> updateLog(String referenceNumber) async {
    try{

      var details = await _transactionService.update(TransactionLog(referenceNumber: referenceNumber));
      if( details ){
        return true;
      }
    }catch(e ){
      print(e);
      return false;
    } finally{
      
    }
    return false;
  }
}
