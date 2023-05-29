class ModelLogin {
  dynamic statusCode;
  dynamic message;
  Data? data;

  ModelLogin({this.statusCode, this.message, this.data});

  ModelLogin.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  dynamic message;
  dynamic token;
  User? user;

  Data({this.message, this.token, this.user});

  Data.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    token = json['token'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['token'] = this.token;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  dynamic gender;
  dynamic idDocument;
  dynamic isDeleted;
  dynamic sId;
  dynamic name;
  dynamic mobile;
  dynamic dob;
  dynamic nationality;
  dynamic emirateId;
  dynamic emirateIdExpire;
  dynamic profilePic;
  dynamic role;
  dynamic otp;
  dynamic address;
  dynamic email;

  User({this.gender, this.idDocument, this.isDeleted, this.sId, this.name, this.mobile, this.dob, this.nationality, this.emirateId, this.emirateIdExpire, this.profilePic, this.role, this.otp, this.address, this.email});

  User.fromJson(Map<String, dynamic> json) {
    gender = json['gender'];
    idDocument = json['idDocument'];
    isDeleted = json['isDeleted'];
    sId = json['_id'];
    name = json['name'];
    mobile = json['mobile'];
    dob = json['dob'];
    nationality = json['nationality'];
    emirateId = json['emirateId'];
    emirateIdExpire = json['emirateIdExpire'];
    profilePic = json['profilePic'];
    role = json['role'];
    otp = json['otp'];
    address = json['address'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['gender'] = this.gender;
    data['idDocument'] = this.idDocument;
    data['isDeleted'] = this.isDeleted;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['mobile'] = this.mobile;
    data['dob'] = this.dob;
    data['nationality'] = this.nationality;
    data['emirateId'] = this.emirateId;
    data['emirateIdExpire'] = this.emirateIdExpire;
    data['profilePic'] = this.profilePic;
    data['role'] = this.role;
    data['otp'] = this.otp;
    data['address'] = this.address;
    data['email'] = this.email;
    return data;
  }
}


