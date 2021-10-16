class LoginModel {
  String ?accessToken;
  String ?tokenType;
  String ?refreshToken;
  int ?expiresIn;
  String ?scope;
  String ?empcode;
  String ?yOUTUBEAPIKEY;
  List<Data> ?data;
  int ?responseCode;
  String ?error;
  String ?responseMessage;

  LoginModel(
      {this.accessToken,
        this.tokenType,
        this.refreshToken,
        this.expiresIn,
        this.scope,
        this.empcode,
        this.yOUTUBEAPIKEY,
        this.data,
        this.responseCode,
        this.error,
        this.responseMessage});

  LoginModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    refreshToken = json['refresh_token'];
    expiresIn = json['expires_in'];
    scope = json['scope'];
    error = json['error'];
    empcode = json['empcode'];
    yOUTUBEAPIKEY = json['YOUTUBE_API_KEY'];
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
    data['access_token'] = this.accessToken;
    data['token_type'] = this.tokenType;
    data['refresh_token'] = this.refreshToken;
    data['expires_in'] = this.expiresIn;
    data['scope'] = this.scope;
    data['error'] = this.error;
    data['empcode'] = this.empcode;
    data['YOUTUBE_API_KEY'] = this.yOUTUBEAPIKEY;
    if (this.data != null) {
      data['data'] = this.data?.map((v) => v.toJson()).toList();
    }
    data['ResponseCode'] = this.responseCode;
    data['ResponseMessage'] = this.responseMessage;
    return data;
  }
}

class Data {
  String ?empcode;
  String ?empname;
  String ?username;
  String ?image;

  Data({this.empcode, this.empname, this.username, this.image});

  Data.fromJson(Map<String, dynamic> json) {
    empcode = json['empcode'];
    empname = json['empname'];
    username = json['username'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['empcode'] = this.empcode;
    data['empname'] = this.empname;
    data['username'] = this.username;
    data['image'] = this.image;
    return data;
  }
}