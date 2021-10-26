class ELeaveStatusModel {
  List<StatusData> ?data;
  int ?responseCode;
  String ?responseMessage;

  ELeaveStatusModel({this.data, this.responseCode, this.responseMessage});

  ELeaveStatusModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data =  <StatusData>[];
      json['data'].forEach((v) {
        data?.add(new StatusData.fromJson(v));
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

class StatusData {
  String ?leaveID;
  String ?reason;
  String ?createdDate;
  String ?startDate;
  String ?endDate;
  String ?empname;
  String ?empImage;
  String ?category;
  String ?name;
  String ?status;
  String ?noofdays;
  String ?leavetype;

  StatusData(
      {this.leaveID,
        this.reason,
        this.createdDate,
        this.startDate,
        this.endDate,
        this.empname,
        this.empImage,
        this.category,
        this.name,
        this.status,
        this.leavetype,
        this.noofdays});

  StatusData.fromJson(Map<String, dynamic> json) {
    leaveID = json['leaveID'];
    reason = json['Reason'];
    createdDate = json['created_date'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    empname = json['empname'];
    empImage = json['EmpImage'];
    category = json['category'];
    name = json['name'];
    status = json['status'];
    noofdays = json['noofdays'];
    leavetype = json['leavetype'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['leaveID'] = this.leaveID;
    data['Reason'] = this.reason;
    data['created_date'] = this.createdDate;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['empname'] = this.empname;
    data['EmpImage'] = this.empImage;
    data['category'] = this.category;
    data['name'] = this.name;
    data['status'] = this.status;
    data['noofdays'] = this.noofdays;
    return data;
  }
}


