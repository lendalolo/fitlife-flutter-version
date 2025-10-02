class AddGoalMoreDay {
  Data? data;
  String? message;
  String? type;

  AddGoalMoreDay({this.data, this.message, this.type});

  AddGoalMoreDay.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    data['type'] = this.type;
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? email;
  int? width;
  int? height;
  num? lat;
  num? lon;
  String? illness;
  int? age;
  String? analysis;
  String? description;
  String? descriptionAr;
  String? communication;
  String? education;
  String? development;
  String? whyAdmin;
  String? address;
  Null? emailVerifiedAt;
  Null? googleId;
  String? googleToken;
  String? gender;
  int? isRequest;
  String? days;
  String? specialization;
  String? lastLoginAt;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
        this.name,
        this.email,
        this.width,
        this.height,
        this.lat,
        this.lon,
        this.illness,
        this.age,
        this.analysis,
        this.description,
        this.descriptionAr,
        this.communication,
        this.education,
        this.development,
        this.whyAdmin,
        this.address,
        this.emailVerifiedAt,
        this.googleId,
        this.googleToken,
        this.gender,
        this.isRequest,
        this.days,
        this.specialization,
        this.lastLoginAt,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    width = json['width'];
    height = json['height'];
    lat = json['lat'];
    lon = json['lon'];
    illness = json['illness'];
    age = json['age'];
    analysis = json['analysis'];
    description = json['description'];
    descriptionAr = json['description_ar'];
    communication = json['communication'];
    education = json['education'];
    development = json['development'];
    whyAdmin = json['why_admin'];
    address = json['address'];
    emailVerifiedAt = json['email_verified_at'];
    googleId = json['google_id'];
    googleToken = json['google_token'];
    gender = json['gender'];
    isRequest = json['is_request'];
    days = json['days'];
    specialization = json['specialization'];
    lastLoginAt = json['last_login_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['width'] = this.width;
    data['height'] = this.height;
    data['lat'] = this.lat;
    data['lon'] = this.lon;
    data['illness'] = this.illness;
    data['age'] = this.age;
    data['analysis'] = this.analysis;
    data['description'] = this.description;
    data['description_ar'] = this.descriptionAr;
    data['communication'] = this.communication;
    data['education'] = this.education;
    data['development'] = this.development;
    data['why_admin'] = this.whyAdmin;
    data['address'] = this.address;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['google_id'] = this.googleId;
    data['google_token'] = this.googleToken;
    data['gender'] = this.gender;
    data['is_request'] = this.isRequest;
    data['days'] = this.days;
    data['specialization'] = this.specialization;
    data['last_login_at'] = this.lastLoginAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}