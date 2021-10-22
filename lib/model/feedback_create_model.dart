class FeedBackCreateModel {
  int ?responseCode;
  String ?responseMessage;

  FeedBackCreateModel({this.responseCode, this.responseMessage});

  FeedBackCreateModel.fromJson(Map<String, dynamic> json) {
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