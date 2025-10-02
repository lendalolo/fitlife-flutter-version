
import 'package:dartz/dartz_unsafe.dart';

import '../../../../common/function/date_to_name_function.dart';

class AllMyMeals {
  List<MealData>? data;
  List<Date>? date;
  int? id;
  String? type;
  String? message;

  AllMyMeals({this.data, this.date, this.id, this.type, this.message});

  AllMyMeals.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <MealData>[];
      json['data'].forEach((v) {
        data!.add(new MealData.fromJson(v));
      });
    }
    if (json['date'] != null) {
      date = <Date>[];
      json['date'].forEach((v) {
        date!.add(new Date.fromJson(v));
      });
    }
    id = json['id'];
    type = json['type'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.date != null) {
      data['date'] = this.date!.map((v) => v.toJson()).toList();
    }
    data['id'] = this.id;
    data['type'] = this.type;
    data['message'] = this.message;
    return data;
  }
}

class MealData {
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
  List<AllMeals>? allMeals;
  List<ArrDay>? arrDay;
  List<Targets>? targets;
  List<Meal>? meal;
  List<String> x=[];
  List<int> y=[];
  List<int> targetIds=[];
  List<Meal> pascketList=[];
  List<Meal>lastedMeal=[];
  int lenghtOfY =0;
  MealData(
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
        this.allMeals,
        this.arrDay,
        this.targets,
        this.meal});

  MealData.fromJson(Map<String, dynamic> json) {
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
    if (json['allMeals'] != null) {
      allMeals = <AllMeals>[];
      json['allMeals'].forEach((v) {
        allMeals!.add(new AllMeals.fromJson(v));
      });
    }
    if (json['arrDay'] != null) {
      arrDay = <ArrDay>[];
      List<T> getLastItems<T>(List<T> items, int count) {
        if (items.length <= count) {
          return items; // Return all items if length is less than or equal to count
        } else {
          return items.sublist(items.length - count); // Get the last 'count' items
        }
      }
      json['arrDay'].forEach((v) {
        arrDay!.add(new ArrDay.fromJson(v));
        x.add(getDayNameFromString(ArrDay.fromJson(v).x!));
        x = getLastItems(x, 7);
        y.add(ArrDay.fromJson(v).y!);
        y = getLastItems(y, 7);
        lenghtOfY=y.first;
        for(int i =0;i<y.length-1;i++){
          if(y[i]<y[i+1]) {
            lenghtOfY = y[i+1];
          }

        }
      });
    }
    if (json['targets'] != null) {
      targets = <Targets>[];
      // json['targets'].forEach((v) {
      //   targets!.add(new Targets.fromJson(v));
      //
      //   // targetIds.add(Targets.fromJson(v).check!);
      //   // for (var id in targetIds) {
      //   //   for (var allelement in allMeals![0].meal!) {
      //   //    // pascketList.add(allelement);
      //   //     if (id == allelement.id) {
      //   //       pascketList.add(allelement);
      //   //       print('${pascketList} moedl');
      //   //     }
      //   //   }
      //   // }
      // });
      json['targets'].forEach((v) {
        final target = Targets.fromJson(v);
        targets!.add(target);
        targetIds.add(target.check!);
      });

      for (var id in targetIds) {
        final matchedMeals = allMeals?[0].meal?.where((meal) => meal.id == id).toList() ?? [];
        pascketList.addAll(matchedMeals);
        print('$pascketList model');
      }
    }
    if (json['meal'] != null) {
      meal = <Meal>[];
      lastedMeal= <Meal>[];
      json['meal'].forEach((v) {
        meal!.add(new Meal.fromJson(v));
        lastedMeal!.add(new Meal.fromJson(v));
        lastedMeal!.sort((a, b) => b.updatedAt!.compareTo(a.updatedAt!)); // Sort in descending order
        lastedMeal= lastedMeal!.take(4).toList();
        List<Map<String, dynamic>> dateTimeMaps = meal!.map((data) {
          return {
            "date": DateTime.parse(data.updatedAt!), // Parses the string to DateTime
            // "name": data["name"],
            // "description": data["description"]
          };
        }).toList();

        // Step 2: Sort the list of maps in descending order by date
        dateTimeMaps.sort((a, b) => b["date"].compareTo(a["date"])); // Sorts from latest to oldest

        // Step 3: Get the latest three entries
        List<Map<String, dynamic>> latestEntries = dateTimeMaps.take(3).toList(); // Takes the first three items

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
    if (this.allMeals != null) {
      data['allMeals'] = this.allMeals!.map((v) => v.toJson()).toList();
    }
    if (this.arrDay != null) {
      data['arrDay'] = this.arrDay!.map((v) => v.toJson()).toList();
    }
    if (this.targets != null) {
      data['targets'] = this.targets!.map((v) => v.toJson()).toList();
    }
    if (this.meal != null) {
      data['meal'] = this.meal!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AllMeals {
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
  List<Meal>? meal;
  List<Meal>? lastedMeal;

  AllMeals(
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
        this.meal});

  AllMeals.fromJson(Map<String, dynamic> json) {
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
    if (json['meal'] != null) {
      meal = <Meal>[];
      lastedMeal= <Meal>[];
      json['meal'].forEach((v) {
        meal!.add(new Meal.fromJson(v));
        lastedMeal!.add(new Meal.fromJson(v));
        lastedMeal!.sort((a, b) => b.updatedAt!.compareTo(a.updatedAt!)); // Sort in descending order
        lastedMeal= lastedMeal!.take(4).toList();
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
    if (this.meal != null) {
      data['meal'] = this.meal!.map((v) => v.toJson()).toList();

    }
    return data;
  }
}

class Meal {
  int? id;
  String? title;
  String? titleAr;
  String? description;
  String? descriptionAr;
  int? calories;
  int? carbohydrates;
  int? fats;
  int? proteins;
  String? prepare;
  String? prepareAr;
  int? categoryId;
  String? createdAt;
  String? updatedAt;
  Pivot? pivot;
  List<Media>? media;

  Meal(
      {this.id,
        this.title,
        this.titleAr,
        this.description,
        this.descriptionAr,
        this.calories,
        this.carbohydrates,
        this.fats,
        this.proteins,
        this.prepare,
        this.prepareAr,
        this.categoryId,
        this.createdAt,
        this.updatedAt,
        this.pivot,
        this.media});

  Meal.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    titleAr = json['title_ar'];
    description = json['description'];
    descriptionAr = json['description_ar'];
    calories = json['calories'];
    carbohydrates = json['carbohydrates'];
    fats = json['fats'];
    proteins = json['proteins'];
    prepare = json['prepare'];
    prepareAr = json['prepare_ar'];
    categoryId = json['category_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
    if (json['media'] != null) {
      media = <Media>[];
      json['media'].forEach((v) {
        media!.add(new Media.fromJson(v));
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
    data['calories'] = this.calories;
    data['carbohydrates'] = this.carbohydrates;
    data['fats'] = this.fats;
    data['proteins'] = this.proteins;
    data['prepare'] = this.prepare;
    data['prepare_ar'] = this.prepareAr;
    data['category_id'] = this.categoryId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
    }
    if (this.media != null) {
      data['media'] = this.media!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Pivot {
  int? planId;
  int? mealId;
  int? breakfast;
  int? lunch;
  int? dinner;
  int? snacks;

  Pivot(
      {this.planId,
        this.mealId,
        this.breakfast,
        this.lunch,
        this.dinner,
        this.snacks});

  Pivot.fromJson(Map<String, dynamic> json) {
    planId = json['plan_id'];
    mealId = json['meal_id'];
    breakfast = json['breakfast'];
    lunch = json['lunch'];
    dinner = json['dinner'];
    snacks = json['snacks'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['plan_id'] = this.planId;
    data['meal_id'] = this.mealId;
    data['breakfast'] = this.breakfast;
    data['lunch'] = this.lunch;
    data['dinner'] = this.dinner;
    data['snacks'] = this.snacks;
    return data;
  }
}

class Media {
  int? id;
  String? modelType;
  int? modelId;
  String? uuid;
  String? collectionName;
  String? name;
  String? fileName;
  String? mimeType;
  String? disk;
  String? conversionsDisk;
  int? size;
  List<Null>? manipulations;
  List<Null>? customProperties;
  List<Null>? generatedConversions;
  List<Null>? responsiveImages;
  int? orderColumn;
  String? createdAt;
  String? updatedAt;
  String? originalUrl;
  String? previewUrl;

  Media(
      {this.id,
        this.modelType,
        this.modelId,
        this.uuid,
        this.collectionName,
        this.name,
        this.fileName,
        this.mimeType,
        this.disk,
        this.conversionsDisk,
        this.size,
        this.manipulations,
        this.customProperties,
        this.generatedConversions,
        this.responsiveImages,
        this.orderColumn,
        this.createdAt,
        this.updatedAt,
        this.originalUrl,
        this.previewUrl});

  Media.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    modelType = json['model_type'];
    modelId = json['model_id'];
    uuid = json['uuid'];
    collectionName = json['collection_name'];
    name = json['name'];
    fileName = json['file_name'];
    mimeType = json['mime_type'];
    disk = json['disk'];
    conversionsDisk = json['conversions_disk'];
    size = json['size'];
    orderColumn = json['order_column'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    originalUrl = json['original_url'];
    previewUrl = json['preview_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['model_type'] = this.modelType;
    data['model_id'] = this.modelId;
    data['uuid'] = this.uuid;
    data['collection_name'] = this.collectionName;
    data['name'] = this.name;
    data['file_name'] = this.fileName;
    data['mime_type'] = this.mimeType;
    data['disk'] = this.disk;
    data['conversions_disk'] = this.conversionsDisk;
    data['size'] = this.size;
    data['order_column'] = this.orderColumn;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['original_url'] = this.originalUrl;
    data['preview_url'] = this.previewUrl;
    return data;
  }
}

class ArrDay {
  String? x;
  int? y;

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
  int? calories;
  int? active;
  int? check;
  Null? time;
  Null? water;
  Null? sleep;
  String? createdAt;
  String? updatedAt;
  int? laravelThroughKey;
  Users? users;


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
        this.laravelThroughKey,
        this.users});

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
    users = json['users'] != null ? new Users.fromJson(json['users']) : null;
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
    if (this.users != null) {
      data['users'] = this.users!.toJson();
    }
    return data;
  }
}

class Users {
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
  Null? googleId;
  String? googleToken;
  String? gender;
  String? days;
  String? lastLoginAt;
  String? createdAt;
  String? updatedAt;

  Users(
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
        this.address,
        this.emailVerifiedAt,
        this.googleId,
        this.googleToken,
        this.gender,
        this.days,
        this.lastLoginAt,
        this.createdAt,
        this.updatedAt});

  Users.fromJson(Map<String, dynamic> json) {
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
    data['address'] = this.address;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['google_id'] = this.googleId;
    data['google_token'] = this.googleToken;
    data['gender'] = this.gender;
    data['days'] = this.days;
    data['last_login_at'] = this.lastLoginAt;
    data['created_at'] = this.createdAt;
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