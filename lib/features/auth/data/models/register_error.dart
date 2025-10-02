class RegisterErorr {
  String? message;
  Errors? errors;

  RegisterErorr({this.message, this.errors});

  RegisterErorr.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    errors =
    json['errors'] != null ? new Errors.fromJson(json['errors']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.errors != null) {
      data['errors'] = this.errors!.toJson();
    }
    return data;
  }
}

class Errors {
  List<String>? name;
  List<String>? email;
  List<String>? password;

  Errors({this.name, this.email, this.password});

  Errors.fromJson(Map<String, dynamic> json) {
    name = json['name'].cast<String>();
    email = json['email'].cast<String>();
    password = json['password'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}