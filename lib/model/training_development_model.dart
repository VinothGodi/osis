class TrainingDevelopmentModel {
  List<Data> ?data;
  int ?responseCode;
  String ?responseMessage;
  String ?error;

  TrainingDevelopmentModel(
      {this.data, this.responseCode, this.error, this.responseMessage});

  TrainingDevelopmentModel.fromJson(Map<String, dynamic> json) {
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
  String ?housecode;
  String ?title;
  String ?date;
  String ?terrorgroup;
  String ?placeofincident;
  String ?terrortype;
  String ?description;
  String ?fromdate;
  String ?todate;
  String ?fromtime;
  String ?totime;
  String ?trainingtime;
  String ?breaktime;
  String ?isimage;
  String ?isvideo;
  String ?ismaterial;
  String ?isaar;
  String ?ishtml;
  String ?isquiz;
  String ?iscompleted;

  Data(
      {this.rowno,
        this.housecode,
        this.title,
        this.date,
        this.terrorgroup,
        this.placeofincident,
        this.terrortype,
        this.description,
        this.fromdate,
        this.todate,
        this.fromtime,
        this.totime,
        this.trainingtime,
        this.breaktime,
        this.isimage,
        this.isvideo,
        this.ismaterial,
        this.isaar,
        this.ishtml,
        this.isquiz,
        this.iscompleted});

  Data.fromJson(Map<String, dynamic> json) {
    rowno = json['rowno'];
    housecode = json['housecode'];
    title = json['title'];
    date = json['date'];
    terrorgroup = json['terrorgroup'];
    placeofincident = json['placeofincident'];
    terrortype = json['terrortype'];
    description = json['description'];
    fromdate = json['fromdate'];
    todate = json['todate'];
    fromtime = json['fromtime'];
    totime = json['totime'];
    trainingtime = json['trainingtime'];
    breaktime = json['breaktime'];
    isimage = json['isimage'];
    isvideo = json['isvideo'];
    ismaterial = json['ismaterial'];
    isaar = json['isaar'];
    ishtml = json['ishtml'];
    isquiz = json['isquiz'];
    iscompleted = json['iscompleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rowno'] = this.rowno;
    data['housecode'] = this.housecode;
    data['title'] = this.title;
    data['date'] = this.date;
    data['terrorgroup'] = this.terrorgroup;
    data['placeofincident'] = this.placeofincident;
    data['terrortype'] = this.terrortype;
    data['description'] = this.description;
    data['fromdate'] = this.fromdate;
    data['todate'] = this.todate;
    data['fromtime'] = this.fromtime;
    data['totime'] = this.totime;
    data['trainingtime'] = this.trainingtime;
    data['breaktime'] = this.breaktime;
    data['isimage'] = this.isimage;
    data['isvideo'] = this.isvideo;
    data['ismaterial'] = this.ismaterial;
    data['isaar'] = this.isaar;
    data['ishtml'] = this.ishtml;
    data['isquiz'] = this.isquiz;
    data['iscompleted'] = this.iscompleted;
    return data;
  }
}


