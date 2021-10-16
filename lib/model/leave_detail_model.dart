class LeaveDetailModel {
  List<Data> ?data;
  int ?responseCode;
  String ?responseMessage;

  LeaveDetailModel({this.data, this.responseCode, this.responseMessage});

  LeaveDetailModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data?.add(new Data.fromJson(v));
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

class Data {
  String ?rowno;
  String ?leavetype;
  String ?totalleave;
  String ?leavetaken;
  String ?pendingleave;
  String ?requestleave;

  Data(
      {this.rowno,
        this.leavetype,
        this.totalleave,
        this.leavetaken,
        this.pendingleave,
        this.requestleave});

  Data.fromJson(Map<String, dynamic> json) {
    rowno = json['rowno'];
    leavetype = json['leavetype'];
    totalleave = json['totalleave'];
    leavetaken = json['leavetaken'];
    pendingleave = json['pendingleave'];
    requestleave = json['requestleave'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rowno'] = this.rowno;
    data['leavetype'] = this.leavetype;
    data['totalleave'] = this.totalleave;
    data['leavetaken'] = this.leavetaken;
    data['pendingleave'] = this.pendingleave;
    data['requestleave'] = this.requestleave;
    return data;
  }
}