
import '../../../../common/function/date_to_name_function.dart';

class ProfileModel {
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
  String? address;
  String? emailVerifiedAt;
  num? googleId;
  String? googleToken;
  String? gender;
  String? days;
  String? lastLoginAt;
  String? createdAt;
  String? updatedAt;
  int? totalRate;
  List<CaloriesForDay>? caloriesForDay;
  List<String>? x;
  List<String>? y;
  List<FoodForDay>? foodForDay;
  List<String>? xx;
  List<String>? yy;
  Goal? goal;
  String? waterForDay;
  List<WaterForEveryDay>? waterForEveryDay;
  List<SleepForEveryDay>? sleepForEveryDay;
  String? sleepForDay;
  String? bmi;
  List<GoalPlan>? goalPlan;
  List<Date>? date;
  List <int>? calorey=[];
  List <int>? foody=[];
  List <int>? watery=[];
  List <int>? sleepy=[];
  List <String>? calorex=[];
  List <String>? foodx=[];
  List <String>? waterX=[];
  List <String>? sleepX=[];
  int maxOfYFood =0;
  int maxOfYCal =0;
  ProfileModel({
    this.id,
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
    this.address,
    this.emailVerifiedAt,
    this.googleId,
    this.googleToken,
    this.gender,
    this.days,
    this.lastLoginAt,
    this.createdAt,
    this.updatedAt,
    this.totalRate,
    this.caloriesForDay,
    this.x,
    this.y,
    this.foodForDay,
    this.xx,
    this.yy,
    this.goal,
    this.waterForDay,
    this.waterForEveryDay,
    this.sleepForEveryDay,
    this.sleepForDay,
    this.bmi,
    this.goalPlan,
    this.date,
  });

  ProfileModel.fromJson(Map<String, dynamic> json) {
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
    address = json['address'];
    emailVerifiedAt = json['email_verified_at'];
    googleId = json['google_id'];
    googleToken = json['google_token'];
    gender = json['gender'];
    days = json['days'];
    lastLoginAt = json['last_login_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    totalRate = json['totalRate'];
    if( json['caloriesForDay'] != null)
      {
        caloriesForDay = List<CaloriesForDay>.from(
            json['caloriesForDay'].map((v) => CaloriesForDay.fromJson(v)));
        json['caloriesForDay'].forEach((v) {
          calorex!.add(getDayNameFromString(CaloriesForDay.fromJson(v).x!));
        });
        json['caloriesForDay'].forEach((v) {

          calorey!.add(CaloriesForDay.fromJson(v).y!);

        });
        maxOfYCal=calorey!.first;
        for(int i =0;i<calorey!.length-1;i++){
          if(calorey![i]<calorey![i+1]) {
            maxOfYCal = calorey![i+1];
            print(maxOfYCal);
          }
        }

         print(calorex);print(caloriesForDay!.length);

      }
    x = json['x'] != null ? List<String>.from(json['x']) : null;
    y = json['y'] != null ? List<String>.from(json['y']) : null;
    if(json['FoodForDay'] != null){
      foodForDay =List<FoodForDay>.from(
          json['FoodForDay'].map((v) => FoodForDay.fromJson(v)));

      json['FoodForDay'].forEach((v) {
        foodx!.add(getDayNameFromString(FoodForDay.fromJson(v).x!));
      });
      json['FoodForDay'].forEach((v) {
        foody!.add(FoodForDay.fromJson(v).y!);
      });
      maxOfYFood=foody!.first;
      for(int i =0;i<foody!.length-1;i++){
        if(foody![i]<foody![i+1]) {
          maxOfYFood = foody![i+1];
          print(maxOfYFood);
        }
      }
    }

    xx = json['xx'] != null ? List<String>.from(json['xx']) : null;
    yy = json['yy'] != null ? List<String>.from(json['yy']) : null;
    goal = json['goal'] != null ? Goal.fromJson(json['goal']) : null;
    waterForDay = json['waterForDay'] !is num?json['waterForDay'].toString():json['waterForDay'];
    waterForEveryDay = json['WaterForEveryDay'] != null
        ? List<WaterForEveryDay>.from(
        json['WaterForEveryDay'].map((v) => WaterForEveryDay.fromJson(v)))
        : null;
    sleepForEveryDay = json['SleepForEveryDay'] != null
        ? List<SleepForEveryDay>.from(
        json['SleepForEveryDay'].map((v) => SleepForEveryDay.fromJson(v)))
        : null;
    sleepForDay = json['sleepForDay'] !is int?json['sleepForDay'].toString():json['sleepForDay'];
    bmi = json['BMI'];
    goalPlan = json['goal_plan'] != null
        ? List<GoalPlan>.from(
        json['goal_plan'].map((v) => GoalPlan.fromJson(v)))
        : null;
    date = json['date'] != null
        ? List<Date>.from(json['date'].map((v) => Date.fromJson(v)))
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['width'] = width;
    data['height'] = height;
    data['lat'] = lat;
    data['lon'] = lon;
    data['illness'] = illness;
    data['age'] = age;
    data['analysis'] = analysis;
    data['description'] = description;
    data['description_ar'] = descriptionAr;
    data['communication'] = communication;
    data['education'] = education;
    data['development'] = development;
    data['address'] = address;
    data['email_verified_at'] = emailVerifiedAt;
    data['google_id'] = googleId;
    data['google_token'] = googleToken;
    data['gender'] = gender;
    data['days'] = days;
    data['last_login_at'] = lastLoginAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['totalRate'] = totalRate;
    if (caloriesForDay != null) {
      data['caloriesForDay'] = caloriesForDay!.map((v) => v.toJson()).toList();

    }
    data['x'] = x;
    data['y'] = y;
    if (foodForDay != null) {
      data['FoodForDay'] = foodForDay!.map((v) => v.toJson()).toList();
    }
    data['xx'] = xx;
    data['yy'] = yy;
    if (goal != null) {
      data['goal'] = goal!.toJson();
    }
    data['waterForDay'] = waterForDay;
    if (waterForEveryDay != null) {
      data['WaterForEveryDay'] =
          waterForEveryDay!.map((v) => v.toJson()).toList();
    }
    if (sleepForEveryDay != null) {
      data['SleepForEveryDay'] =
          sleepForEveryDay!.map((v) => v.toJson()).toList();
    }
    data['sleepForDay'] = sleepForDay;
    data['BMI'] = bmi;
    if (goalPlan != null) {
      data['goal_plan'] = goalPlan!.map((v) => v.toJson()).toList();
    }
    if (date != null) {
      data['date'] = date!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FoodForDay {
  String? x;
  int? y;

  FoodForDay({this.x, this.y});

  FoodForDay.fromJson(Map<String, dynamic> json) {
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
class WaterForEveryDay {
  String? x;
  num? y;

  WaterForEveryDay({this.x, this.y});

  WaterForEveryDay.fromJson(Map<String, dynamic> json) {
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
class SleepForEveryDay {
  String? x;
  int? y;

  SleepForEveryDay({this.x, this.y});

  SleepForEveryDay.fromJson(Map<String, dynamic> json) {
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
class CaloriesForDay {
  String? x;
  int? y;

  CaloriesForDay({this.x, this.y});

  CaloriesForDay.fromJson(Map<String, dynamic> json) {
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

class Goal {
  int? id;
  String? title;
  String? titleAr;
  String? description;
  String? descriptionAr;
  int? caloriesMax;
  int? caloriesMin;
  int? duration;
  String? createdAt;
  String? updatedAt;

  Goal(
      {this.id,
        this.title,
        this.titleAr,
        this.description,
        this.descriptionAr,
        this.caloriesMax,
        this.caloriesMin,
        this.duration,
        this.createdAt,
        this.updatedAt});

  Goal.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    titleAr = json['title_ar'];
    description = json['description'];
    descriptionAr = json['description_ar'];
    caloriesMax = json['calories_max'];
    caloriesMin = json['calories_min'];
    duration = json['duration'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['title_ar'] = this.titleAr;
    data['description'] = this.description;
    data['description_ar'] = this.descriptionAr;
    data['calories_max'] = this.caloriesMax;
    data['calories_min'] = this.caloriesMin;
    data['duration'] = this.duration;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class GoalPlan {
  int? id;
  int? goalId;
  int? planId;
  String? createdAt;
  String? updatedAt;
  Pivot? pivot;
  Goal? goals;

  GoalPlan(
      {this.id,
        this.goalId,
        this.planId,
        this.createdAt,
        this.updatedAt,
        this.pivot,
        this.goals});

  GoalPlan.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    goalId = json['goal_id'];
    planId = json['plan_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
    goals = json['goals'] != null ? new Goal.fromJson(json['goals']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['goal_id'] = this.goalId;
    data['plan_id'] = this.planId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
    }
    if (this.goals != null) {
      data['goals'] = this.goals!.toJson();
    }
    return data;
  }
}

class Pivot {
  int? userId;
  int? goalPlanId;
  int? calories;
  String? updatedAt;

  Pivot({this.userId, this.goalPlanId, this.calories, this.updatedAt});

  Pivot.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    goalPlanId = json['goal_plan_id'];
    calories = json['calories'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['goal_plan_id'] = this.goalPlanId;
    data['calories'] = this.calories;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Date {
  int? id;
  int? userId;
  String? date;
  int? isHoliday;
  String? createdAt;
  String? updatedAt;

  Date(
      {this.id,
        this.userId,
        this.date,
        this.isHoliday,
        this.createdAt,
        this.updatedAt});

  Date.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    date = json['date'];
    isHoliday = json['is_holiday'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['date'] = this.date;
    data['is_holiday'] = this.isHoliday;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
