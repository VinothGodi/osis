class CodeConductModel {
  List<Data> ?data;
  int ?responseCode;
  String ?responseMessage;

  CodeConductModel({this.data, this.responseCode, this.responseMessage});

  CodeConductModel.fromJson(Map<String, dynamic> json) {
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
  String ?documentdate;
  String ?documentname;
  String ?documentpath;

  Data({this.rowno, this.documentdate, this.documentname, this.documentpath});

  Data.fromJson(Map<String, dynamic> json) {
    rowno = json['rowno'];
    documentdate = json['documentdate'];
    documentname = json['documentname'];
    documentpath = json['documentpath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rowno'] = this.rowno;
    data['documentdate'] = this.documentdate;
    data['documentname'] = this.documentname;
    data['documentpath'] = this.documentpath;
    return data;
  }
}


