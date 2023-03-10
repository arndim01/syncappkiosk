import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class MessageController extends GetxController {
  final GlobalKey scaffoldKey = GlobalKey<ScaffoldState>();

  late WebSocketChannel? channel;
  late List<double> amount;
  TextEditingController? textController = TextEditingController();

  void setAmountValue(String value) {
    if (_isNumeric(value)) {
      amount.add(double.parse(value));
    }
  }

  void setNewValue() {
    channel!.sink.close();
  }

  bool _isNumeric(String str) {
    if (str.isEmpty) {
      return false;
    }
    return double.tryParse(str) != null;
  }

  double getTotalAmount() {
    print(amount);
    if (amount.isEmpty) {
      return 0;
    }

    return amount.fold(0, (previousValue, element) => previousValue + element);
  }

  void sendMessage(String value) {
    if (value.isNotEmpty) {
      channel!.sink.add(value);
    }
  }

  @override
  void onInit() {
    super.onInit();
    amount = List.empty(growable: true);
  }

  @override
  void dispose() {
    print('dispose mee!!!!');
    channel!.sink.close();
    super.dispose();
  }
}
