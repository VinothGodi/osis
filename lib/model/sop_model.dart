class SopModel {
  List<Data> ?data;
  int ?responseCode;
  String ?error;
  String ?responseMessage;

  SopModel({this.data, this.error, this.responseCode, this.responseMessage});

  SopModel.fromJson(Map<String, dynamic> json) {
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
    data['error'] = this.error;
    data['ResponseMessage'] = this.responseMessage;
    return data;
  }
}

class Data {
  String ?rowno;
  String ?documentdate;
  String ?documentname;
  String ?flowchartpath;
  String ?documentpath;

  Data(
      {this.rowno,
        this.documentdate,
        this.documentname,
        this.flowchartpath,
        this.documentpath});

  Data.fromJson(Map<String, dynamic> json) {
    rowno = json['rowno'];
    documentdate = json['documentdate']==null?"--":json['documentdate'];
    documentname = json['documentname']==null?"--":json['documentname'];
    flowchartpath = json['flowchartpath'];
    documentpath = json['documentpath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rowno'] = this.rowno;
    data['documentdate'] = this.documentdate;
    data['documentname'] = this.documentname;
    data['flowchartpath'] = this.flowchartpath;
    data['documentpath'] = this.documentpath;
    return data;
  }
}


