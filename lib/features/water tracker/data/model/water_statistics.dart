import '../../../../common/function/date_to_name_function.dart';

class WaterStatistics {
  Data? data;
  String? message;
  String? type;

  WaterStatistics({this.data, this.message, this.type});

  WaterStatistics.fromJson(Map<String, dynamic> json) {
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
  String? title;
  String? titleAr;
  String? description;
  String? descriptionAr;
  int? duration;
  String? muscle;
  String? muscleAr;
  String? sleep;
  String? water;
  String? type;
  String? typeAr;
  String? createdAt;
  String? updatedAt;
  List<ArrDay>? arrDay;
  List<Targets>? targets;
  List<String> x=[];
  List<double> y=[];
  double lenghtOfY =0;

  Data(
      {this.id,
        this.title,
        this.titleAr,
        this.description,
        this.descriptionAr,
        this.duration,
        this.muscle,
        this.muscleAr,
        this.sleep,
        this.water,
        this.type,
        this.typeAr,
        this.createdAt,
        this.updatedAt,
        this.arrDay,
        this.targets});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    titleAr = json['title_ar'];
    description = json['description'];
    descriptionAr = json['description_ar'];
    duration = json['duration'];
    muscle = json['muscle'];
    muscleAr = json['muscle_ar'];
    sleep = json['sleep'];
    water = json['water'];
    type = json['type'];
    typeAr = json['type_ar'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['arrDay'] != null) {
      arrDay = <ArrDay>[];
      json['arrDay'].forEach((v) {
        arrDay!.add(new ArrDay.fromJson(v));
        x.add(getDayNameFromString(ArrDay.fromJson(v).x!));
        y.add(ArrDay.fromJson(v).y!.toDouble());
      });
      lenghtOfY=y.first;
      for(int i =0;i<y.length-1;i++){
        if(y[i]<y[i+1]) {
          lenghtOfY = y[i+1];
        }
      }
    }
    if (json['targets'] != null) {
      targets = <Targets>[];
      json['targets'].forEach((v) {
        targets!.add(new Targets.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['title_ar'] = this.titleAr;
    data['description'] = this.description;
    data['description_ar'] = this.descriptionAr;
    data['duration'] = this.duration;
    data['muscle'] = this.muscle;
    data['muscle_ar'] = this.muscleAr;
    data['sleep'] = this.sleep;
    data['water'] = this.water;
    data['type'] = this.type;
    data['type_ar'] = this.typeAr;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.arrDay != null) {
      data['arrDay'] = this.arrDay!.map((v) => v.toJson()).toList();
    }
    if (this.targets != null) {
      data['targets'] = this.targets!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ArrDay {
  String? x;
  num? y;

  ArrDay({this.x, this.y});

  ArrDay.fromJson(Map<String, dynamic> json) {
    x = json['x'];
    y = json['y'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['x'] = this.x;
    data['y'] = this.y;
    return data;
  }
}

class Targets {
  int? id;
  int? userId;
  int? goalPlanId;
  Null? calories;
  int? active;
  int? check;
  Null? time;
  String? water;
  String? sleep;
  String? createdAt;
  String? updatedAt;
  int? laravelThroughKey;

  Targets(
      {this.id,
        this.userId,
        this.goalPlanId,
        this.calories,
        this.active,
        this.check,
        this.time,
        this.water,
        this.sleep,
        this.createdAt,
        this.updatedAt,
        this.laravelThroughKey});

  Targets.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    goalPlanId = json['goal_plan_id'];
    calories = json['calories'];
    active = json['active'];
    check = json['check'];
    time = json['time'];
    water = json['water'];
    sleep = json['sleep'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    laravelThroughKey = json['laravel_through_key'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['goal_plan_id'] = this.goalPlanId;
    data['calories'] = this.calories;
    data['active'] = this.active;
    data['check'] = this.check;
    data['time'] = this.time;
    data['water'] = this.water;
    data['sleep'] = this.sleep;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['laravel_through_key'] = this.laravelThroughKey;
    return data;
  }
}