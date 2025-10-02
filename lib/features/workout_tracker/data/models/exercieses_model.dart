class Exercieses {
  ExerciesData? data;
  String? type;
  String? message;
  List<bool> isChecked =[];
  List<bool> isCheckedwoman =[];
  List<bool> isCheckedman =[];
  List<Exercise> womans=[];
  List<Exercise> men=[] ;
  Exercieses({this.data, this.type, this.message});

  Exercieses.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new ExerciesData.fromJson(json['data']) : null;
    message = json['message'];
         int i=0;
    if (ExerciesData.fromJson(json['data']).targets !=null) {
          for (var exer in ExerciesData.fromJson(json['data']).exercise!) {
            i++;
            for (var target in ExerciesData.fromJson(json['data']).targets!) {
              if(target.check == exer.id ) {
                isChecked.add(true);
              }
            }
         if( isChecked.isEmpty || isChecked.length != i) isChecked.add(false);
          }
    }
    else{
      for(int i =0 ;i< ExerciesData.fromJson(json['data']).exercise!.length;i++) {
        isChecked.add(false);
      }
    }

    for (var exer in ExerciesData.fromJson(json['data']).exercise!)
    {
      if(exer.type!.toLowerCase() =='male') {
        men.add(exer);
        print(exer);
      }
      else{
        womans.add(exer);
      }
    }
    int j=0;
    int k=0;
    if (ExerciesData.fromJson(json['data']).targets !=null) {
      if(womans.isEmpty)
        {
          for(int i =0 ;i< womans.length;i++) {
            isCheckedwoman.add(false);
          }
        }
      else {
        for (var exer in womans) {
          j++;
          for (var target in ExerciesData.fromJson(json['data']).targets!) {
            if (target.check == exer.id) {
              isCheckedwoman.add(true);
            }
          }
          if (isCheckedwoman.isEmpty || isCheckedwoman.length != j) isCheckedwoman.add(false);
        }
      }
    }
    else{
      for(int i =0 ;i< womans.length;i++) {
        isCheckedwoman.add(false);
      }
    }
    if (ExerciesData.fromJson(json['data']).targets !=null) {
      for (var exer in men) {
        k++;
        for (var target in ExerciesData.fromJson(json['data']).targets!) {
          if(target.check == exer.id ) {
            isCheckedman.add(true);
          }
        }
        if( isCheckedman.isEmpty || isCheckedman.length != k) isCheckedman.add(false);
      }
    }
    else{
      for(int i =0 ;i< men.length;i++) {
        isCheckedman.add(false);
      }
    }
  }




  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['type'] = this.type;
    data['message'] = this.message;
    return data;
  }
}

class ExerciesData {
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
  int? totalRate;
  int? totalRateDay;
  int? totalRateWeekOne;
  int? totalRateWeekTwo;
  List<int>? x;
  List<int>? y;
  List<Exercise>? exercise;
  List<Targets>? targets;

  ExerciesData(
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
        this.totalRate,
        this.totalRateDay,
        this.totalRateWeekOne,
        this.totalRateWeekTwo,
        this.x,
        this.y,
        this.exercise,
        this.targets});

  ExerciesData.fromJson(Map<String, dynamic> json) {
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
    totalRate = json['totalRate'];
    totalRateDay = json['totalRateDay'];
    totalRateWeekOne = json['totalRateWeekOne'];
    totalRateWeekTwo = json['totalRateWeekTwo'];
    x = json['x'].cast<int>();
    y = json['y'].cast<int>();
    if (json['exercise'] != null) {
      exercise = <Exercise>[];
      json['exercise'].forEach((v) {
        exercise!.add(new Exercise.fromJson(v));
      });
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
    data['totalRate'] = this.totalRate;
    data['totalRateDay'] = this.totalRateDay;
    data['totalRateWeekOne'] = this.totalRateWeekOne;
    data['totalRateWeekTwo'] = this.totalRateWeekTwo;
    data['x'] = this.x;
    data['y'] = this.y;
    if (this.exercise != null) {
      data['exercise'] = this.exercise!.map((v) => v.toJson()).toList();
    }
    if (this.targets != null) {
      data['targets'] = this.targets!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Exercise {
  int? id;
  String? title;
  String? titleAr;
  String? description;
  String? descriptionAr;
  int? duration;
  int? calories;
  String? type;
  int? counter;
  String? createdAt;
  String? updatedAt;
  Pivot? pivot;
  List<Media>? media;

  Exercise(
      {this.id,
        this.title,
        this.titleAr,
        this.description,
        this.descriptionAr,
        this.duration,
        this.calories,
        this.type,
        this.counter,
        this.createdAt,
        this.updatedAt,
        this.pivot,
        this.media});

  Exercise.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    titleAr = json['title_ar'];
    description = json['description'];
    descriptionAr = json['description_ar'];
    duration = json['duration'];
    calories = json['calories'];
    type = json['type'];
    counter = json['counter'];
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
    data['duration'] = this.duration;
    data['calories'] = this.calories;
    data['type'] = this.type;
    data['counter'] = this.counter;
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
  int? exerciseId;
  int? day;
  int? week;

  Pivot({this.planId, this.exerciseId, this.day, this.week});

  Pivot.fromJson(Map<String, dynamic> json) {
    planId = json['plan_id'];
    exerciseId = json['exercise_id'];
    day = json['day'];
    week = json['week'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['plan_id'] = this.planId;
    data['exercise_id'] = this.exerciseId;
    data['day'] = this.day;
    data['week'] = this.week;
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
  List<Date>? date;

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
        this.updatedAt,
        this.date});

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
    if (json['date'] != null) {
      date = <Date>[];
      json['date'].forEach((v) {
        date!.add(new Date.fromJson(v));
      });
    }
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
    if (this.date != null) {
      data['date'] = this.date!.map((v) => v.toJson()).toList();
    }
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
// class Exercieses {
//   ExerciesExerciesData? data;
//   String? message;
//   List<bool> isChecked =[];
//   Exercieses({this.data, this.message});
//
//   Exercieses.fromJson(Map<String, dynamic> json) {
//     data = json['data'] != null ? new ExerciesExerciesData.fromJson(json['data']) : null;
//     message = json['message'];
//          int i=0;
//     if (ExerciesExerciesData.fromJson(json['data']).targets !=null) {
//           for (var exer in ExerciesExerciesData.fromJson(json['data']).exercise!) {
//             i++;
//             for (var target in ExerciesExerciesData.fromJson(json['data']).targets!) {
//               if(target.check == exer.id ) {
//                 isChecked.add(true);
//               }
//             }
//          if( isChecked.isEmpty || isChecked.length != i) isChecked.add(false);
//           }
//     }else{
//       for(int i =0 ;i< ExerciesExerciesData.fromJson(json['data']).exercise!.length;i++) {
//         isChecked.add(false);
//       }
//     }
//
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     data['message'] = this.message;
//     return data;
//   }
// }
//
// class ExerciesExerciesData {
//   int? id;
//   String? title;
//   String? titleAr;
//   String? description;
//   String? descriptionAr;
//   int? duration;
//   String? muscle;
//   String? muscleAr;
//   String? sleep;
//   String? water;
//   String? type;
//   String? typeAr;
//   String? createdAt;
//   String? updatedAt;
//   int? totalRate;
//   int? totalRateDay;
//   int? totalRateWeekOne;
//   int? totalRateWeekTwo;
//   List<int>? x;
//   List<int>? y;
//   List<Exercise>? exercise;
//   List<Targets>? targets;
//
//   ExerciesExerciesData(
//       {this.id,
//         this.title,
//         this.titleAr,
//         this.description,
//         this.descriptionAr,
//         this.duration,
//         this.muscle,
//         this.muscleAr,
//         this.sleep,
//         this.water,
//         this.type,
//         this.typeAr,
//         this.createdAt,
//         this.updatedAt,
//         this.totalRate,
//         this.totalRateDay,
//         this.totalRateWeekOne,
//         this.totalRateWeekTwo,
//         this.x,
//         this.y,
//         this.exercise,
//         this.targets});
//
//   ExerciesExerciesData.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     title = json['title'];
//     titleAr = json['title_ar'];
//     description = json['description'];
//     descriptionAr = json['description_ar'];
//     duration = json['duration'];
//     muscle = json['muscle'];
//     muscleAr = json['muscle_ar'];
//     sleep = json['sleep'];
//     water = json['water'];
//     type = json['type'];
//     typeAr = json['type_ar'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     totalRate = json['totalRate'];
//     totalRateDay = json['totalRateDay'];
//     totalRateWeekOne = json['totalRateWeekOne'];
//     totalRateWeekTwo = json['totalRateWeekTwo'];
//     x = json['x'].cast<int>();
//     y = json['y'].cast<int>();
//     if (json['exercise'] != null) {
//       exercise = <Exercise>[];
//       json['exercise'].forEach((v) {
//         exercise!.add(new Exercise.fromJson(v));
//       });
//     }
//     if (json['targets'] != null) {
//       targets = <Targets>[];
//       json['targets'].forEach((v) {
//         targets!.add(new Targets.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['title'] = this.title;
//     data['title_ar'] = this.titleAr;
//     data['description'] = this.description;
//     data['description_ar'] = this.descriptionAr;
//     data['duration'] = this.duration;
//     data['muscle'] = this.muscle;
//     data['muscle_ar'] = this.muscleAr;
//     data['sleep'] = this.sleep;
//     data['water'] = this.water;
//     data['type'] = this.type;
//     data['type_ar'] = this.typeAr;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     data['totalRate'] = this.totalRate;
//     data['totalRateDay'] = this.totalRateDay;
//     data['totalRateWeekOne'] = this.totalRateWeekOne;
//     data['totalRateWeekTwo'] = this.totalRateWeekTwo;
//     data['x'] = this.x;
//     data['y'] = this.y;
//     if (this.exercise != null) {
//       data['exercise'] = this.exercise!.map((v) => v.toJson()).toList();
//     }
//     if (this.targets != null) {
//       data['targets'] = this.targets!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class Exercise {
//   int? id;
//   String? title;
//   String? titleAr;
//   String? description;
//   String? descriptionAr;
//   int? duration;
//   int? calories;
//   int? counter;
//   String? createdAt;
//   String? updatedAt;
//   Pivot? pivot;
//   List<Media>? media;
//
//   Exercise(
//       {this.id,
//         this.title,
//         this.titleAr,
//         this.description,
//         this.descriptionAr,
//         this.duration,
//         this.calories,
//         this.counter,
//         this.createdAt,
//         this.updatedAt,
//         this.pivot,
//         this.media});
//
//   Exercise.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     title = json['title'];
//     titleAr = json['title_ar'];
//     description = json['description'];
//     descriptionAr = json['description_ar'];
//     duration = json['duration'];
//     calories = json['calories'];
//     counter = json['counter'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
//     if (json['media'] != null) {
//       media = <Media>[];
//       json['media'].forEach((v) {
//         media!.add(new Media.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['title'] = this.title;
//     data['title_ar'] = this.titleAr;
//     data['description'] = this.description;
//     data['description_ar'] = this.descriptionAr;
//     data['duration'] = this.duration;
//     data['calories'] = this.calories;
//     data['counter'] = this.counter;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     if (this.pivot != null) {
//       data['pivot'] = this.pivot!.toJson();
//     }
//     if (this.media != null) {
//       data['media'] = this.media!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class Pivot {
//   int? planId;
//   int? exerciseId;
//
//   Pivot({this.planId, this.exerciseId});
//
//   Pivot.fromJson(Map<String, dynamic> json) {
//     planId = json['plan_id'];
//     exerciseId = json['exercise_id'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['plan_id'] = this.planId;
//     data['exercise_id'] = this.exerciseId;
//     return data;
//   }
// }
//
// class Media {
//   int? id;
//   String? modelType;
//   int? modelId;
//   String? uuid;
//   String? collectionName;
//   String? name;
//   String? fileName;
//   String? mimeType;
//   String? disk;
//   String? conversionsDisk;
//   int? size;
//   List<Null>? manipulations;
//   List<Null>? customProperties;
//   List<Null>? generatedConversions;
//   List<Null>? responsiveImages;
//   int? orderColumn;
//   String? createdAt;
//   String? updatedAt;
//   String? originalUrl;
//   String? previewUrl;
//
//   Media(
//       {this.id,
//         this.modelType,
//         this.modelId,
//         this.uuid,
//         this.collectionName,
//         this.name,
//         this.fileName,
//         this.mimeType,
//         this.disk,
//         this.conversionsDisk,
//         this.size,
//         this.manipulations,
//         this.customProperties,
//         this.generatedConversions,
//         this.responsiveImages,
//         this.orderColumn,
//         this.createdAt,
//         this.updatedAt,
//         this.originalUrl,
//         this.previewUrl});
//
//   Media.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     modelType = json['model_type'];
//     modelId = json['model_id'];
//     uuid = json['uuid'];
//     collectionName = json['collection_name'];
//     name = json['name'];
//     fileName = json['file_name'];
//     mimeType = json['mime_type'];
//     disk = json['disk'];
//     conversionsDisk = json['conversions_disk'];
//     size = json['size'];
//     orderColumn = json['order_column'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     originalUrl = json['original_url'];
//     previewUrl = json['preview_url'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['model_type'] = this.modelType;
//     data['model_id'] = this.modelId;
//     data['uuid'] = this.uuid;
//     data['collection_name'] = this.collectionName;
//     data['name'] = this.name;
//     data['file_name'] = this.fileName;
//     data['mime_type'] = this.mimeType;
//     data['disk'] = this.disk;
//     data['conversions_disk'] = this.conversionsDisk;
//     data['size'] = this.size;
//     data['order_column'] = this.orderColumn;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     data['original_url'] = this.originalUrl;
//     data['preview_url'] = this.previewUrl;
//     return data;
//   }
// }
//
// class Targets {
//   int? id;
//   int? userId;
//   int? goalPlanId;
//   int? calories;
//   int? active;
//   int? check;
//   Null? time;
//   Null? water;
//   Null? sleep;
//   String? createdAt;
//   String? updatedAt;
//   int? laravelThroughKey;
//   Users? users;
//
//   Targets(
//       {this.id,
//         this.userId,
//         this.goalPlanId,
//         this.calories,
//         this.active,
//         this.check,
//         this.time,
//         this.water,
//         this.sleep,
//         this.createdAt,
//         this.updatedAt,
//         this.laravelThroughKey,
//         this.users});
//
//   Targets.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     userId = json['user_id'];
//     goalPlanId = json['goal_plan_id'];
//     calories = json['calories'];
//     active = json['active'];
//     check = json['check'];
//     time = json['time'];
//     water = json['water'];
//     sleep = json['sleep'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     laravelThroughKey = json['laravel_through_key'];
//     users = json['users'] != null ? new Users.fromJson(json['users']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['user_id'] = this.userId;
//     data['goal_plan_id'] = this.goalPlanId;
//     data['calories'] = this.calories;
//     data['active'] = this.active;
//     data['check'] = this.check;
//     data['time'] = this.time;
//     data['water'] = this.water;
//     data['sleep'] = this.sleep;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     data['laravel_through_key'] = this.laravelThroughKey;
//     if (this.users != null) {
//       data['users'] = this.users!.toJson();
//     }
//     return data;
//   }
// }
//
// class Users {
//   int? id;
//   String? name;
//   String? email;
//   Null? width;
//   Null? height;
//   Null? lat;
//   Null? lon;
//   Null? illness;
//   Null? age;
//   Null? analysis;
//   Null? description;
//   Null? descriptionAr;
//   Null? communication;
//   Null? education;
//   Null? development;
//   Null? address;
//   Null? emailVerifiedAt;
//   Null? googleId;
//   Null? googleToken;
//   Null? gender;
//   String? createdAt;
//   String? updatedAt;
//   List<Date>? date;
//
//   Users(
//       {this.id,
//         this.name,
//         this.email,
//         this.width,
//         this.height,
//         this.lat,
//         this.lon,
//         this.illness,
//         this.age,
//         this.analysis,
//         this.description,
//         this.descriptionAr,
//         this.communication,
//         this.education,
//         this.development,
//         this.address,
//         this.emailVerifiedAt,
//         this.googleId,
//         this.googleToken,
//         this.gender,
//         this.createdAt,
//         this.updatedAt,
//         this.date});
//
//   Users.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     email = json['email'];
//     width = json['width'];
//     height = json['height'];
//     lat = json['lat'];
//     lon = json['lon'];
//     illness = json['illness'];
//     age = json['age'];
//     analysis = json['analysis'];
//     description = json['description'];
//     descriptionAr = json['description_ar'];
//     communication = json['communication'];
//     education = json['education'];
//     development = json['development'];
//     address = json['address'];
//     emailVerifiedAt = json['email_verified_at'];
//     googleId = json['google_id'];
//     googleToken = json['google_token'];
//     gender = json['gender'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     if (json['date'] != null) {
//       date = <Date>[];
//       json['date'].forEach((v) {
//         date!.add(new Date.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['email'] = this.email;
//     data['width'] = this.width;
//     data['height'] = this.height;
//     data['lat'] = this.lat;
//     data['lon'] = this.lon;
//     data['illness'] = this.illness;
//     data['age'] = this.age;
//     data['analysis'] = this.analysis;
//     data['description'] = this.description;
//     data['description_ar'] = this.descriptionAr;
//     data['communication'] = this.communication;
//     data['education'] = this.education;
//     data['development'] = this.development;
//     data['address'] = this.address;
//     data['email_verified_at'] = this.emailVerifiedAt;
//     data['google_id'] = this.googleId;
//     data['google_token'] = this.googleToken;
//     data['gender'] = this.gender;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     if (this.date != null) {
//       data['date'] = this.date!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class Date {
//   int? id;
//   int? userId;
//   String? date;
//   String? createdAt;
//   String? updatedAt;
//
//   Date({this.id, this.userId, this.date, this.createdAt, this.updatedAt});
//
//   Date.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     userId = json['user_id'];
//     date = json['date'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['user_id'] = this.userId;
//     data['date'] = this.date;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }
//
