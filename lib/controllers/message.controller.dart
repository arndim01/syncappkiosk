import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_socket_channel/web_socket_channel.dart';



class MessageController extends GetxController{
  final GlobalKey scaffoldKey = GlobalKey<ScaffoldState>();

  late final WebSocketChannel? channel;
  late final List<double> _amount;
  TextEditingController? textController = TextEditingController();

  void setAmountValue(String value){
    if( _isNumeric(value)  ) {
      _amount.add(double.parse(value));
    }
  }
  bool _isNumeric(String str) {
    if(str.isEmpty) {
      return false;
    }
    return double.tryParse(str) != null;
  }
  double getTotalAmount(){
    return _amount.fold(0, (previousValue, element) => previousValue + element);
  } 

  void sendMessage(){
    if( textController!.text.isNotEmpty ){
      channel!.sink.add(textController!.text);
    }
  }

  @override
  void onInit(){
    super.onInit();
    _amount = List.empty(growable: true);
    channel = WebSocketChannel.connect(
      Uri.parse('ws://localhost:1337')
    );
  }

  @override
  void dispose() {
    channel!.sink.close();
    super.dispose();
  }

}