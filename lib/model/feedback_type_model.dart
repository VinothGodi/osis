class FeedBackTypeModel {
  List<FeedBackType> ?data;
  int ?responseCode;
  String ?responseMessage;

  FeedBackTypeModel({this.data, this.responseCode, this.responseMessage});

  FeedBackTypeModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data =  <FeedBackType>[];
      json['data'].forEach((v) {
        data?.add(new FeedBackType.fromJson(v));
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

class FeedBackType {
  String ?rowno;
  String ?feedbacktype;

  FeedBackType({this.rowno, this.feedbacktype});

  FeedBackType.fromJson(Map<String, dynamic> json) {
    rowno = json['rowno'];
    feedbacktype = json['feedbacktype'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rowno'] = this.rowno;
    data['feedbacktype'] = this.feedbacktype;
    return data;
  }
}