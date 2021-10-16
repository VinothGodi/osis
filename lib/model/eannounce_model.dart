class EAnnounceModel {
  List<Data> ?data;
  int ?responseCode;
  String ?responseMessage;

  EAnnounceModel({this.data, this.responseCode, this.responseMessage});

  EAnnounceModel.fromJson(Map<String, dynamic> json) {
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
  String ?ancecode;
  String ?ancetitle;
  String ?description;
  String ?priority;
  String ?acknowledgement;
  String ?day;
  String ?date;
  String ?year;
  String ?acknowledgementDate;
  String ?newstatus;
  String ?empack;
  String ?imageCount;
  String ?pdfCount;

  Data(
      {this.ancecode,
        this.ancetitle,
        this.description,
        this.priority,
        this.acknowledgement,
        this.day,
        this.date,
        this.year,
        this.acknowledgementDate,
        this.newstatus,
        this.empack,
        this.imageCount,
        this.pdfCount});

  Data.fromJson(Map<String, dynamic> json) {
    ancecode = json['ancecode'];
    ancetitle = json['ancetitle'];
    description = json['description'];
    priority = json['priority'];
    acknowledgement = json['acknowledgement'];
    day = json['day'];
    date = json['date'];
    year = json['year'];
    acknowledgementDate = json['acknowledgementDate'];
    newstatus = json['newstatus'];
    empack = json['empack'];
    imageCount = json['ImageCount'];
    pdfCount = json['PdfCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ancecode'] = this.ancecode;
    data['ancetitle'] = this.ancetitle;
    data['description'] = this.description;
    data['priority'] = this.priority;
    data['acknowledgement'] = this.acknowledgement;
    data['day'] = this.day;
    data['date'] = this.date;
    data['year'] = this.year;
    data['acknowledgementDate'] = this.acknowledgementDate;
    data['newstatus'] = this.newstatus;
    data['empack'] = this.empack;
    data['ImageCount'] = this.imageCount;
    data['PdfCount'] = this.pdfCount;
    return data;
  }
}