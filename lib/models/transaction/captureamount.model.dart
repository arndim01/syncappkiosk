class CaptureAmount{
  String? id;
  String? value;
  CaptureAmount({ this.id, this.value });
  CaptureAmount.fromJson(Map<String, dynamic> json){
    id = json['id'];
    value = json['value'];
  }
}