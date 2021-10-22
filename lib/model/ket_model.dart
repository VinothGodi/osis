class KetModel {
  List<Data> ?data;
  int ?responseCode;
  String ?responseMessage;
  String ?error;

  KetModel({this.data, this.error, this.responseCode, this.responseMessage});

  KetModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data?.add(new Data.fromJson(v));
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

class Data {
  String ?kETID;
  String ?dateIssuedOn;
  String ?employeeNricfin;
  String ?empCode;
  String ?empName;
  String ?empImage;

  Data(
      {this.kETID,
        this.dateIssuedOn,
        this.employeeNricfin,
        this.empCode,
        this.empName,
        this.empImage});

  Data.fromJson(Map<String, dynamic> json) {
    kETID = json['KETID'];
    dateIssuedOn = json['DateIssuedOn'];
    employeeNricfin = json['EmployeeNricfin'];
    empCode = json['EmpCode'];
    empName = json['EmpName'];
    empImage = json['EmpImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['KETID'] = this.kETID;
    data['DateIssuedOn'] = this.dateIssuedOn;
    data['EmployeeNricfin'] = this.employeeNricfin;
    data['EmpCode'] = this.empCode;
    data['EmpName'] = this.empName;
    data['EmpImage'] = this.empImage;
    return data;
  }
}


