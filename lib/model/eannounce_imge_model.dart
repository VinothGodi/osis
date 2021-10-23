class EAnnounceImageModel {
  List<EAnnounceImage> ?data;
  int ?responseCode;
  String ?responseMessage;
  String ?error;

  EAnnounceImageModel({this.data, this.error,this.responseCode, this.responseMessage});

  EAnnounceImageModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data =  <EAnnounceImage>[];
      json['data'].forEach((v) {
        data?.add( EAnnounceImage.fromJson(v));
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

class EAnnounceImage {
  String ?fileName;
  String ?aImage;
  String ?orderno;

  EAnnounceImage({this.fileName, this.aImage, this.orderno});

  EAnnounceImage.fromJson(Map<String, dynamic> json) {
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