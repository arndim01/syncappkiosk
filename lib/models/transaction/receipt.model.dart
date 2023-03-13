import 'package:flutter/material.dart';

class Receipt {
  late String _referenceNumber;
  late String _accountNumber;
  late double _amount;
  late double _cashIn;
  late double _fee;
  
  String get getReferenceNumber => _referenceNumber;
  set setReferenceNumber(String value) {
    _referenceNumber = value;
  }

  String get getAccountNumber => _accountNumber;
  set setAccountNumber(String value){
    _accountNumber = value;
  }

  double get getAmount => _amount;
  set setAmount(double value){
    _amount = value;
  }

  double get getCashIn => _cashIn;
  set setCashIn(double value){
    _cashIn = value;
  }

  double get getFee => _fee;
  set setFee(double value){
    _fee = value;
  }
}