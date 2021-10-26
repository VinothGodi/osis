class EleaveCreateModel {
  List<LeaveCreateModel> ?data;
  int ?responseCode;
  String ?responseMessage;
  String ?error;

  EleaveCreateModel({this.data,this.error, this.responseCode, this.responseMessage});

  EleaveCreateModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data =  <LeaveCreateModel>[];
      json['data'].forEach((v) {
        data?.add( LeaveCreateModel.fromJson(v));
      });
    }
    responseCode = json['ResponseCode'];
    responseMessage = json['ResponseMessage'];
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data?.map((v) => v.toJson()).toList();
    }
    data['ResponseCode'] = this.responseCode;
    data['ResponseMessage'] = this.responseMessage;
    return data;
  }
}

class LeaveCreateModel {
  String ?message;

  LeaveCreateModel({this.message});

  LeaveCreateModel.fromJson(Map<String, dynamic> json) {
    message = json['Message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Message'] = this.message;
    return data;
  }
}