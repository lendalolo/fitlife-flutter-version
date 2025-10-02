import '../../../../common/function/date_to_name_function.dart';

class PlansStatesitics {
  Data? data;
  String? type;
  String? message;

  PlansStatesitics({this.data, this.type, this.message});

  PlansStatesitics.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    type = json['type'];
    message = json['message'];
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
  List<Date>? date;
  int? totalRate;
  List<ArrCal>? arrCal;
  int? totalRateDay;
  TotalRateWeekOne? totalRateWeekOne;
  List<ArrDay>? arrDay;
  int? countEWeek;
  List<Targets>? targets;
  List<Media>? media;
  List<String> calx =[];
  List<int> caly =[];
  List<String> dayx=[];
  List<int> dayy=[];
  int lenghtOfY=0;

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
        this.date,
        this.totalRate,
        this.arrCal,
        this.totalRateDay,
        this.totalRateWeekOne,
        this.arrDay,
        this.countEWeek,
        this.targets,
        this.media});

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
    if (json['date'] != null) {
      date = <Date>[];
      json['date'].forEach((v) {
        date!.add(new Date.fromJson(v));
      });
    }
    totalRate = json['totalRate'];
    if (json['arrCal'] != null && json['arrCal'].isNotEmpty) {
      arrCal = <ArrCal>[];
      json['arrCal'].forEach((v) {
        arrCal!.add( ArrCal.fromJson(v));
        calx.add(getDayNameFromString(ArrCal.fromJson(v).x.toString()));
        caly.add(ArrCal.fromJson(v).y!);
      });
      lenghtOfY=caly.first;
      for(int i =0;i<caly.length-1;i++){
        if(caly[i] <=caly[i+1]) {
          lenghtOfY = caly[i+1];
        }
      }
    }
    totalRateDay = json['totalRateDay'];
    totalRateWeekOne = json['totalRateWeekOne'] != null
        ? new TotalRateWeekOne.fromJson(json['totalRateWeekOne'])
        : null;
    if (json['arrDay'] != null) {
      arrDay = <ArrDay>[];
      json['arrDay'].forEach((v) {
        arrDay!.add( ArrDay.fromJson(v));
        dayx.add(ArrDay.fromJson(v).x.toString());
        dayy.add(ArrDay.fromJson(v).y!);
        print('sayx$dayx');
        print('sayy$dayy');
      });
    }
    if (json['targets'] != null) {
      targets = <Targets>[];
      json['targets'].forEach((v) {
        targets!.add(new Targets.fromJson(v));
      });
    }
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
    data['muscle'] = this.muscle;
    data['muscle_ar'] = this.muscleAr;
    data['sleep'] = this.sleep;
    data['water'] = this.water;
    data['type'] = this.type;
    data['type_ar'] = this.typeAr;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.date != null) {
      data['date'] = this.date!.map((v) => v.toJson()).toList();
    }
    data['totalRate'] = this.totalRate;
    if (this.arrCal != null) {
      data['arrCal'] = this.arrCal!.map((v) => v.toJson()).toList();
    }
    data['totalRateDay'] = this.totalRateDay;
    if (this.totalRateWeekOne != null) {
      data['totalRateWeekOne'] = this.totalRateWeekOne!.toJson();
    }
    if (this.arrDay != null) {
      data['arrDay'] = this.arrDay!.map((v) => v.toJson()).toList();
    }
    data['countE_week'] = this.countEWeek;
    if (this.targets != null) {
      data['targets'] = this.targets!.map((v) => v.toJson()).toList();
    }
    if (this.media != null) {
      data['media'] = this.media!.map((v) => v.toJson()).toList();
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

class ArrCal {
  String? x;
  int? y;

  ArrCal({this.x, this.y});

  ArrCal.fromJson(Map<String, dynamic> json) {
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
class TotalRateWeekOne {
  int? week;
  int? rate;

  TotalRateWeekOne({this.week, this.rate});

  TotalRateWeekOne.fromJson(Map<String, dynamic> json) {
    week = json['week'];
    rate = json['rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['week'] = this.week;
    data['rate'] = this.rate;
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
  String? time;
  String? water;
  String? sleep;
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
// class PlansStatesitics {
//   Data? data;
//   String? type;
//   String? message;
//
//   PlansStatesitics({this.data, this.type, this.message});
//
//   PlansStatesitics.fromJson(Map<String, dynamic> json) {
//     data = json['data'] != null ? new Data.fromJson(json['data']) : null;
//     type = json['type'];
//     message = json['message'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     data['type'] = this.type;
//     data['message'] = this.message;
//     return data;
//   }
// }
//
// class Data {
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
//   List<Date>? date;
//   int? totalRate;
//   List<ArrCal>? arrCal;
//   int? totalRateDay;
//   List<TotalRateWeekOne>? totalRateWeekOne;
//   List<ArrDay>? arrDay;
// //  List<Targets>? targets;
//   List<Media>? media;
//   List<String> calx =[];
//   List<int> caly =[];
//   List<String> dayx=[];
//   List<int> dayy=[];
//
//   Data(
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
//         this.date,
//         this.totalRate,
//         this.arrCal,
//         this.totalRateDay,
//         this.totalRateWeekOne,
//         this.arrDay,
//         //this.targets,
//         this.media});
//
//   Data.fromJson(Map<String, dynamic> json) {
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
//     if (json['date'] != null) {
//       date = <Date>[];
//       json['date'].forEach((v) {
//         date!.add(new Date.fromJson(v));
//       });
//     }
//     totalRate = json['totalRate'];
//     if (json['arrCal'] != null) {
//       arrCal = <ArrCal>[];
//       json['arrCal'].forEach((v) {
//         arrCal!.add( ArrCal.fromJson(v));
//         calx.add(ArrCal.fromJson(v).x.toString());
//         caly.add(ArrCal.fromJson(v).y!);
//         print('Calx$calx');
//         print('Caly$caly');
//       });
//     }
//     totalRateDay = json['totalRateDay'];
//     if (json['totalRateWeekOne'] != null) {
//       totalRateWeekOne = <TotalRateWeekOne>[];
//       json['totalRateWeekOne'].forEach((v) {
//         totalRateWeekOne!.add(new TotalRateWeekOne.fromJson(v));
//       });
//     }
//     if (json['arrDay'] != null) {
//       arrDay = <ArrDay>[];
//       json['arrDay'].forEach((v) {
//         arrDay!.add( ArrDay.fromJson(v));
//         dayx.add(ArrDay.fromJson(v).x.toString());
//         dayy.add(ArrDay.fromJson(v).y!);
//         print('sayx$dayx');
//         print('sayy$dayy');
//       });
//     }
//     if (json['targets'] != null) {
//       //targets = <Targets>[];
//       // json['targets'].forEach((v) {
//       //   targets!.add(new Targets.fromJson(v));
//       // });
//     }
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
//     data['muscle'] = this.muscle;
//     data['muscle_ar'] = this.muscleAr;
//     data['sleep'] = this.sleep;
//     data['water'] = this.water;
//     data['type'] = this.type;
//     data['type_ar'] = this.typeAr;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     if (this.date != null) {
//       data['date'] = this.date!.map((v) => v.toJson()).toList();
//     }
//     data['totalRate'] = this.totalRate;
//     if (this.arrCal != null) {
//       data['arrCal'] = this.arrCal!.map((v) => v.toJson()).toList();
//     }
//     data['totalRateDay'] = this.totalRateDay;
//     if (this.totalRateWeekOne != null) {
//       data['totalRateWeekOne'] =
//           this.totalRateWeekOne!.map((v) => v.toJson()).toList();
//     }
//     if (this.arrDay != null) {
//       data['arrDay'] = this.arrDay!.map((v) => v.toJson()).toList();
//     }
//     // if (this.targets != null) {
//     //   data['targets'] = this.targets!.map((v) => v.toJson()).toList();
//     // }
//     if (this.media != null) {
//       data['media'] = this.media!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class Date {
//   int? id;
//   int? userId;
//   String? date;
//   int? isHoliday;
//   String? createdAt;
//   String? updatedAt;
//
//   Date(
//       {this.id,
//         this.userId,
//         this.date,
//         this.isHoliday,
//         this.createdAt,
//         this.updatedAt});
//
//   Date.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     userId = json['user_id'];
//     date = json['date'];
//     isHoliday = json['is_holiday'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['user_id'] = this.userId;
//     data['date'] = this.date;
//     data['is_holiday'] = this.isHoliday;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }
//
// class ArrCal {
//   String? x;
//   int? y;
//
//   ArrCal({this.x, this.y});
//
//   ArrCal.fromJson(Map<String, dynamic> json) {
//     x = json['x'];
//     y = json['y'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['x'] = this.x;
//     data['y'] = this.y;
//     return data;
//   }
// }
// class ArrDay {
//   String? x;
//   int? y;
//
//   ArrDay({this.x, this.y});
//
//   ArrDay.fromJson(Map<String, dynamic> json) {
//     x = json['x'];
//     y = json['y'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['x'] = this.x;
//     data['y'] = this.y;
//     return data;
//   }
// }
//
// class TotalRateWeekOne {
//   int? week;
//   int? rate;
//
//   TotalRateWeekOne({this.week, this.rate});
//
//   TotalRateWeekOne.fromJson(Map<String, dynamic> json) {
//     week = json['week'];
//     rate = json['rate'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['week'] = this.week;
//     data['rate'] = this.rate;
//     return data;
//   }
// }
//
// // class Targets {
// //   int? id;
// //   int? userId;
// //   int? goalPlanId;
// //   int? calories;
// //   int? active;
// //   int? check;
// //   Null? time;
// //   Null? water;
// //   Null? sleep;
// //   String? createdAt;
// //   String? updatedAt;
// //   int? laravelThroughKey;
// //   Users? users;
// //
// //   Targets(
// //       {this.id,
// //         this.userId,
// //         this.goalPlanId,
// //         this.calories,
// //         this.active,
// //         this.check,
// //         this.time,
// //         this.water,
// //         this.sleep,
// //         this.createdAt,
// //         this.updatedAt,
// //         this.laravelThroughKey,
// //         this.users});
// //
// //   Targets.fromJson(Map<String, dynamic> json) {
// //     id = json['id'];
// //     userId = json['user_id'];
// //     goalPlanId = json['goal_plan_id'];
// //     calories = json['calories'];
// //     active = json['active'];
// //     check = json['check'];
// //     time = json['time'];
// //     water = json['water'];
// //     sleep = json['sleep'];
// //     createdAt = json['created_at'];
// //     updatedAt = json['updated_at'];
// //     laravelThroughKey = json['laravel_through_key'];
// //     users = json['users'] != null ? new Users.fromJson(json['users']) : null;
// //   }
// //
// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = new Map<String, dynamic>();
// //     data['id'] = this.id;
// //     data['user_id'] = this.userId;
// //     data['goal_plan_id'] = this.goalPlanId;
// //     data['calories'] = this.calories;
// //     data['active'] = this.active;
// //     data['check'] = this.check;
// //     data['time'] = this.time;
// //     data['water'] = this.water;
// //     data['sleep'] = this.sleep;
// //     data['created_at'] = this.createdAt;
// //     data['updated_at'] = this.updatedAt;
// //     data['laravel_through_key'] = this.laravelThroughKey;
// //     if (this.users != null) {
// //       data['users'] = this.users!.toJson();
// //     }
// //     return data;
// //   }
// // }
// //
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
  String? googleId;
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