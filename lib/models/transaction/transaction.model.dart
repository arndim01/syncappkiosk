class Transaction {
  String? number;
  String? referenceNumber;

  Transaction({this.number});
  Transaction.fromJson(Map<String, dynamic> json) {
    referenceNumber = json['referenceNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['number'] = number;
    return data;
  }
}
