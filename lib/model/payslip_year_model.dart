class PaySlipYearModel {
  List<Data> ?data;
  int ?responseCode;
  String ?responseMessage;
  String ?error;
  

  PaySlipYearModel({this.data, this.error, this.responseCode, this.responseMessage});

  PaySlipYearModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data?.add(new Data.fromJson(v));
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

class Data {
  String ?rowno;
  String ?year;

  Data({this.rowno, this.year});

  Data.fromJson(Map<String, dynamic> json) {
    rowno = json['rowno'];
    year = json['year'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rowno'] = this.rowno;
    data['year'] = this.year;
    return data;
  }
}