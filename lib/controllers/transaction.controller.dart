import 'package:get/get.dart';
import 'package:syncappkiosk/models/transaction/transaction.model.dart';
import 'package:syncappkiosk/services/transaction.service.dart';

class TransactionController extends GetxController {

  late final TransactionService _transactionService;
  var isLoading = true.obs;
  @override
  void onInit() {
    super.onInit();
    _transactionService = Get.put(TransactionService());
  }

  Future<String?> create(String number) async {
    try{
      isLoading(true);

      var details = await _transactionService.create(Transaction(number: number));
      if(details != null){
        return details.referenceNumber.toString();
      }
    }
    catch (e){
      print(e);
    }
    finally{
      isLoading(false);
    }
    return null;
  }
}