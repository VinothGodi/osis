class PaySlipModel {
  List<Data> ?data;
  int ?responseCode;
  String ?responseMessage;
  String ?error;

  PaySlipModel({this.data,this.error, this.responseCode, this.responseMessage});

  PaySlipModel.fromJson(Map<String, dynamic> json) {
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
  String ?rowno;
  String ?month;
  String ?documentdate;
  String ?documentpath;

  Data({this.rowno, this.month, this.documentdate, this.documentpath});

  Data.fromJson(Map<String, dynamic> json) {
    rowno = json['rowno'];
    month = json['month'];
    documentdate = json['documentdate'];
    documentpath = json['documentpath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rowno'] = this.rowno;
    data['month'] = this.month;
    data['documentdate'] = this.documentdate;
    data['documentpath'] = this.documentpath;
    return data;
  }
}


