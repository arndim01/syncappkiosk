class TransactionLog {
  String? referenceNumber;
  int? amount;

  TransactionLog({this.referenceNumber, this.amount});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['referenceNumber'] = referenceNumber;
    data['amount'] = amount;
    return data;
  }

  Map<String, dynamic> updateLogToJson(){
    final Map<String, dynamic> data = <String, dynamic>{};
    data['referenceNumber'] = referenceNumber;
    return data;
  }
}
