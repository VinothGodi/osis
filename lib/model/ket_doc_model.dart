class KetDocApi {
  List<Data> ?data;
  String ?kETID;
  int ?responseCode;
  String ?responseMessage;

  KetDocApi({this.data, this.kETID, this.responseCode, this.responseMessage});

  KetDocApi.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data?.add(new Data.fromJson(v));
      });
    }
    kETID = json['KETID'];
    responseCode = json['ResponseCode'];
    responseMessage = json['ResponseMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data?.map((v) => v.toJson()).toList();
    }
    data['KETID'] = this.kETID;
    data['ResponseCode'] = this.responseCode;
    data['ResponseMessage'] = this.responseMessage;
    return data;
  }
}

class Data {
  String ?kETID;
  String ?ketfilename;

  Data({this.kETID, this.ketfilename});

  Data.fromJson(Map<String, dynamic> json) {
    kETID = json['KETID'];
    ketfilename = json['ketfilename'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['KETID'] = this.kETID;
    data['ketfilename'] = this.ketfilename;
    return data;
  }
}