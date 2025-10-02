
class UserStautsModel {
  int? day;
  int? week;
  String? status;
  String? goalName;

  UserStautsModel({this.day, this.week, this.status, this.goalName});

  UserStautsModel.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    week = json['week'];
    status = json['status'];
    goalName = json['goal_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['day'] = this.day;
    data['week'] = this.week;
    data['status'] = this.status;
    data['goal_name'] = this.goalName;
    return data;
  }
}
//"subscription"
//"non subscription"