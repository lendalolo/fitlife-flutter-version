class LastTImeDataBaseUbdate {
  String? lastTime;

  LastTImeDataBaseUbdate({this.lastTime});

  LastTImeDataBaseUbdate.fromJson(Map<String, dynamic> json) {
    lastTime = json['lastTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lastTime'] = this.lastTime;
    return data;
  }
}