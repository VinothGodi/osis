class FeedBackModel {
  List<Data> ?data;
  int ?responseCode;
  String ?responseMessage;
  String ?error;

  FeedBackModel({this.data, this.error,this.responseCode, this.responseMessage});

  FeedBackModel.fromJson(Map<String, dynamic> json) {
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
  String ?feedbackid;
  String ?feedbackdate;
  String ?feedbackimage;
  String ?feedbacktype;
  String ?description;
  String ?employeename;
  String ?deploymentname;

  Data(
      {this.rowno,
        this.feedbackid,
        this.feedbackdate,
        this.feedbackimage,
        this.feedbacktype,
        this.description,
        this.employeename,
        this.deploymentname});

  Data.fromJson(Map<String, dynamic> json) {
    rowno = json['rowno'];
    feedbackid = json['feedbackid'];
    feedbackdate = json['feedbackdate'];
    feedbackimage = json['feedbackimage'];
    feedbacktype = json['feedbacktype'];
    description = json['Description']==null||json['Description']==""?"-----":json['Description'];
    employeename = json['employeename'];
    deploymentname = json['deploymentname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rowno'] = this.rowno;
    data['feedbackid'] = this.feedbackid;
    data['feedbackdate'] = this.feedbackdate;
    data['feedbackimage'] = this.feedbackimage;
    data['feedbacktype'] = this.feedbacktype;
    data['Description'] = this.description;
    data['employeename'] = this.employeename;
    data['deploymentname'] = this.deploymentname;
    return data;
  }
}


