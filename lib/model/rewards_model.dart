class RewardsModel {
  List<Data> ?data;
  int ?responseCode;
  String ?error;
  String ?responseMessage;

  RewardsModel({this.data, this.error, this.responseCode, this.responseMessage});

  RewardsModel.fromJson(Map<String, dynamic> json) {
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
  String ?rewardid;
  String ?rewarddate;
  String ?employeename;
  String ?rewardtype;
  String ?rewardimage;
  String ?rewarddocument;
  String ?remarks;
  String ?status;

  Data(
      {this.rowno,
        this.rewardid,
        this.rewarddate,
        this.employeename,
        this.rewardtype,
        this.rewardimage,
        this.rewarddocument,
        this.remarks,
        this.status});

  Data.fromJson(Map<String, dynamic> json) {
    rowno = json['rowno'];
    rewardid = json['rewardid'];
    rewarddate = json['rewarddate'];
    employeename = json['employeename'];
    rewardtype = json['rewardtype'];
    rewardimage = json['rewardimage'];
    rewarddocument = json['rewarddocument'];
    remarks = json['remarks']==""?"------":json['remarks'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rowno'] = this.rowno;
    data['rewardid'] = this.rewardid;
    data['rewarddate'] = this.rewarddate;
    data['employeename'] = this.employeename;
    data['rewardtype'] = this.rewardtype;
    data['rewardimage'] = this.rewardimage;
    data['rewarddocument'] = this.rewarddocument;
    data['remarks'] = this.remarks;
    data['status'] = this.status;
    return data;
  }
}


