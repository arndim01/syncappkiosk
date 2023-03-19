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
    double tempfee = 2;
    for (var n in amountList) {
      sum+=n;
    }

    if( sum >= 25 && sum <= 200 ){
            tempfee = 5;
        }else if(sum > 200 && sum <= 500 ){
            tempfee = 10;
        }else if(sum > 500 && sum < 1000){
            tempfee = 15;
        }else if(sum >= 1000 && sum < 2000){
            tempfee = 20;
        }else if(sum >= 2000 && sum < 3000){
            tempfee = 40;
        }else if(sum >= 3000 && sum < 4000){
            tempfee = 60;
        }else if(sum >= 4000 && sum < 5000){
            tempfee = 80;
        }else if(sum >= 5000 && sum < 6000){
            tempfee = 100;
        }else if(sum >= 6000 && sum < 7000){
            tempfee = 120;
        }else if(sum >= 7000 && sum < 8000){
            tempfee = 140;
        }else if(sum >= 8000 && sum < 9000){
            tempfee = 160;
        }else if(sum >= 9000 && sum < 10000){
            tempfee = 180;
        }else if(sum >= 10000){
            tempfee = 200;
        }else{
            tempfee = 2;
        }


    receipt.setAmount = sum;
    receipt.setFee = tempfee;
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
