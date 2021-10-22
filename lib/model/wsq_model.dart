class WSQModel {
  List<Data> ?data;
  int ?responseCode;
  String ?responseMessage;
  String ?error;

  WSQModel({this.data, this.error,this.responseCode, this.responseMessage});

  WSQModel.fromJson(Map<String, dynamic> json) {
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
  String ?trainingcode;
  String ?trainingname;
  String ?trainingpoint;
  String ?traininghours;
  String ?completiondate;
  String ?status;
  String ?documentpath;

  Data(
      {this.rowno,
        this.trainingcode,
        this.trainingname,
        this.trainingpoint,
        this.traininghours,
        this.completiondate,
        this.status,
        this.documentpath});

  Data.fromJson(Map<String, dynamic> json) {
    rowno = json['rowno'];
    trainingcode = json['trainingcode'];
    trainingname = json['trainingname'];
    trainingpoint = json['trainingpoint'];
    traininghours = json['traininghours'];
    completiondate = json['completiondate']==""?"----":json['completiondate'];
    status = json['status'];
    documentpath = json['documentpath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rowno'] = this.rowno;
    data['trainingcode'] = this.trainingcode;
    data['trainingname'] = this.trainingname;
    data['trainingpoint'] = this.trainingpoint;
    data['traininghours'] = this.traininghours;
    data['completiondate'] = this.completiondate;
    data['status'] = this.status;
    data['documentpath'] = this.documentpath;
    return data;
  }
}


