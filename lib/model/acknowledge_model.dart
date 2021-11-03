class AcknownledeModel {
  int ?responseCode;
  String ?responseMessage;

  AcknownledeModel({this.responseCode, this.responseMessage});

  AcknownledeModel.fromJson(Map<String, dynamic> json) {
    responseCode = json['ResponseCode'];
    responseMessage = json['ResponseMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ResponseCode'] = this.responseCode;
    data['ResponseMessage'] = this.responseMessage;
    return data;
  }
}