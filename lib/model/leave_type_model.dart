class LeaveTypeModel {
  List<LeaveTypeData> ?data;
  int ?responseCode;
  String ?responseMessage;

  LeaveTypeModel({this.data, this.responseCode, this.responseMessage});

  LeaveTypeModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data =  <LeaveTypeData>[];
      json['data'].forEach((v) {
        data?.add(new LeaveTypeData.fromJson(v));
      });
    }
    responseCode = json['ResponseCode'];
    responseMessage = json['ResponseMessage'];
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

class LeaveTypeData {
  String ?leavetype;
  String ?category;

  LeaveTypeData({
        this.leavetype,
        this.category});

  LeaveTypeData.fromJson(Map<String, dynamic> json) {
    leavetype = json['leavetype'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['leavetype'] = this.leavetype;
    data['category'] = this.category;
    return data;
  }
}