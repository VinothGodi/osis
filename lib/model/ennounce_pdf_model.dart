class EAnnouncePdfModel {
  List<EAnnouncePDFData> ?data;
  int ?responseCode;
  String ?responseMessage;

  EAnnouncePdfModel({this.data, this.responseCode, this.responseMessage});

  EAnnouncePdfModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data =  <EAnnouncePDFData>[];
      json['data'].forEach((v) {
        data?.add( EAnnouncePDFData.fromJson(v));
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

class EAnnouncePDFData {
  String ?fileName;
  String ?aImage;
  String ?orderno;

  EAnnouncePDFData({this.fileName, this.aImage, this.orderno});

  EAnnouncePDFData.fromJson(Map<String, dynamic> json) {
    fileName = json['FileName'];
    aImage = json['aImage'];
    orderno = json['Orderno'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['FileName'] = this.fileName;
    data['aImage'] = this.aImage;
    data['Orderno'] = this.orderno;
    return data;
  }
}

