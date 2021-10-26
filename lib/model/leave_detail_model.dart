class LeaveDetailModel {
  List<LeaveData> ?data;
  int ?responseCode;
  String ?responseMessage;
  String ?error;


  LeaveDetailModel({this.data, this.error, this.responseCode, this.responseMessage});

  LeaveDetailModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <LeaveData>[];
      json['data'].forEach((v) {
        data?.add(new LeaveData.fromJson(v));
      });
    }
    responseCode = json['ResponseCode'];
    error = json['error'];
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

class LeaveData {
  String ?rowno;
  String ?leavetype;
  String ?totalleave;
  String ?leavetaken;
  String ?pendingleave;
  String ?requestleave;
  String ?category;

  LeaveData(
      {this.rowno,
        this.leavetype,
        this.totalleave,
        this.leavetaken,
        this.pendingleave,
        this.category,
        this.requestleave});

  LeaveData.fromJson(Map<String, dynamic> json) {
    rowno = json['rowno'];
    leavetype = json['leavetype'];
    totalleave = json['totalleave'];
    leavetaken = json['leavetaken'];
    pendingleave = json['pendingleave'];
    requestleave = json['requestleave'];
    category = json['category'];
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