class plans {
  List<PlanData>? data;
  List<Date>? date;
  String? message;
  String? type;
  List<String>? dateList;
  List<int>? isHoleday;

  plans({this.data, this.date, this.message, this.type});

  plans.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <PlanData>[];
      json['data'].forEach((v) {
        data!.add(new PlanData.fromJson(v));
      });
    }
    if (json['date'] != null) {
      date = <Date>[];
      dateList =<String>[];
      isHoleday =<int>[];
      json['date'].forEach((v) {
        date!.add( Date.fromJson(v));
        dateList!.add(Date.fromJson(v).date!);
        isHoleday!.add(Date.fromJson(v).isHoliday!);
      });
      print (dateList);
    }
    message = json['message'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.date != null) {
      data['date'] = this.date!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['type'] = this.type;
    return data;
  }
}

class PlanData {
  int? id;
  int? goalId;
  int? planId;
  String? createdAt;
  String? updatedAt;
  Plan? plan;
  Goals? goals;

  PlanData(
      {this.id,
        this.goalId,
        this.planId,
        this.createdAt,
        this.updatedAt,
        this.plan,
        this.goals});

  PlanData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    goalId = json['goal_id'];
    planId = json['plan_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    plan = json['plan'] != null ? new Plan.fromJson(json['plan']) : null;
    goals = json['goals'] != null ? new Goals.fromJson(json['goals']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['goal_id'] = this.goalId;
    data['plan_id'] = this.planId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.plan != null) {
      data['plan'] = this.plan!.toJson();
    }
    if (this.goals != null) {
      data['goals'] = this.goals!.toJson();
    }
    return data;
  }
}

class Plan {
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
  List<Media>? media;

  Plan(
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
        this.media});

  Plan.fromJson(Map<String, dynamic> json) {
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
    if (this.media != null) {
      data['media'] = this.media!.map((v) => v.toJson()).toList();
    }
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

class Goals {
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

  Goals(
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

  Goals.fromJson(Map<String, dynamic> json) {
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

// class plans {
//   List<PlanPlanData>? data;
//   List<Date>? date;
//   String? message;
//   List<String>? dateList;
//
//   plans({this.data, this.date, this.message});
//
//   plans.fromJson(Map<String, dynamic> json) {
//     if (json['data'] != null) {
//       data = <PlanPlanData>[];
//       json['data'].forEach((v) {
//         data!.add(new PlanPlanData.fromJson(v));
//       });
//     }
//     if (json['date'] != null) {
//       date = <Date>[];
//       dateList =<String>[];
//       json['date'].forEach((v) {
//         date!.add( Date.fromJson(v));
//         dateList!.add(Date.fromJson(v).date!);
//       });
//       print (dateList);
//     }
//     message = json['message'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.data != null) {
//       data['data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     if (this.date != null) {
//       data['date'] = this.date!.map((v) => v.toJson()).toList();
//     }
//     data['message'] = this.message;
//     return data;
//   }
// }
//
// class PlanPlanData {
//   int? id;
//   int? goalId;
//   int? planId;
//   String? createdAt;
//   String? updatedAt;
//   Plan? plan;
//   Goals? goals;
//
//   PlanPlanData(
//       {this.id,
//         this.goalId,
//         this.planId,
//         this.createdAt,
//         this.updatedAt,
//         this.plan,
//         this.goals});
//
//   PlanPlanData.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     goalId = json['goal_id'];
//     planId = json['plan_id'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     plan = json['plan'] != null ? new Plan.fromJson(json['plan']) : null;
//     goals = json['goals'] != null ? new Goals.fromJson(json['goals']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['goal_id'] = this.goalId;
//     data['plan_id'] = this.planId;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     if (this.plan != null) {
//       data['plan'] = this.plan!.toJson();
//     }
//     if (this.goals != null) {
//       data['goals'] = this.goals!.toJson();
//     }
//     return data;
//   }
// }
//
// class Plan {
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
//   List<Media>? media;
//
//   Plan(
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
//         this.media});
//
//   Plan.fromJson(Map<String, dynamic> json) {
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
//     if (this.media != null) {
//       data['media'] = this.media!.map((v) => v.toJson()).toList();
//     }
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
// class Goals {
//   int? id;
//   String? title;
//   String? titleAr;
//   String? description;
//   String? descriptionAr;
//   int? caloriesMax;
//   int? caloriesMin;
//   int? duration;
//   String? createdAt;
//   String? updatedAt;
//
//   Goals(
//       {this.id,
//         this.title,
//         this.titleAr,
//         this.description,
//         this.descriptionAr,
//         this.caloriesMax,
//         this.caloriesMin,
//         this.duration,
//         this.createdAt,
//         this.updatedAt});
//
//   Goals.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     title = json['title'];
//     titleAr = json['title_ar'];
//     description = json['description'];
//     descriptionAr = json['description_ar'];
//     caloriesMax = json['calories_max'];
//     caloriesMin = json['calories_min'];
//     duration = json['duration'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['title'] = this.title;
//     data['title_ar'] = this.titleAr;
//     data['description'] = this.description;
//     data['description_ar'] = this.descriptionAr;
//     data['calories_max'] = this.caloriesMax;
//     data['calories_min'] = this.caloriesMin;
//     data['duration'] = this.duration;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
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
//
// //
// // class plans {
// //   List<PlanPlanPlanData>? data;
// //   List<Date>? date;
// //   List<String>? dateList;
// //   String? message;
// //
// //   plans({this.data, this.date, this.message, this.dateList});
// //
// //   plans.fromJson(Map<String, dynamic> json) {
// //     if (json['data'] != null) {
// //       data = <PlanPlanPlanData>[];
// //       json['data'].forEach((v) {
// //         data!.add(new PlanPlanPlanData.fromJson(v));
// //       });
// //     }
// //     if (json['date'] != null) {
// //       date = <Date>[];
// //       dateList =<String>[];
// //       json['date'].forEach((v) {
// //         date!.add( Date.fromJson(v));
// //         dateList!.add(Date.fromJson(v).date!);
// //       });
// //       print (dateList);
// //     }
// //     message = json['message'];
// //   }
// //
// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = new Map<String, dynamic>();
// //     if (this.data != null) {
// //       data['data'] = this.data!.map((v) => v.toJson()).toList();
// //     }
// //     if (this.date != null) {
// //       data['date'] = this.date!.map((v) => v.toJson()).toList();
// //     }
// //     data['message'] = this.message;
// //     return data;
// //   }
// // }
// //
// // class PlanPlanPlanData {
// //   int? id;
// //   int? goalId;
// //   int? planLevelId;
// //   String? createdAt;
// //   String? updatedAt;
// //   PlanLevels? planLevels;
// //   Goals? goals;
// //
// //   PlanPlanPlanData(
// //       {this.id,
// //         this.goalId,
// //         this.planLevelId,
// //         this.createdAt,
// //         this.updatedAt,
// //         this.planLevels,
// //         this.goals});
// //
// //   PlanPlanPlanData.fromJson(Map<String, dynamic> json) {
// //     id = json['id'];
// //     goalId = json['goal_id'];
// //     planLevelId = json['plan_level_id'];
// //     createdAt = json['created_at'];
// //     updatedAt = json['updated_at'];
// //     planLevels = json['plan_levels'] != null
// //         ? new PlanLevels.fromJson(json['plan_levels'])
// //         : null;
// //     goals = json['goals'] != null ? new Goals.fromJson(json['goals']) : null;
// //   }
// //
// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = new Map<String, dynamic>();
// //     data['id'] = this.id;
// //     data['goal_id'] = this.goalId;
// //     data['plan_level_id'] = this.planLevelId;
// //     data['created_at'] = this.createdAt;
// //     data['updated_at'] = this.updatedAt;
// //     if (this.planLevels != null) {
// //       data['plan_levels'] = this.planLevels!.toJson();
// //     }
// //     if (this.goals != null) {
// //       data['goals'] = this.goals!.toJson();
// //     }
// //     return data;
// //   }
// // }
// //
// // class PlanLevels {
// //   int? id;
// //   int? planId;
// //   int? levelId;
// //   String? createdAt;
// //   String? updatedAt;
// //   Plan? plan;
// //   Level? level;
// //
// //   PlanLevels(
// //       {this.id,
// //         this.planId,
// //         this.levelId,
// //         this.createdAt,
// //         this.updatedAt,
// //         this.plan,
// //         this.level});
// //
// //   PlanLevels.fromJson(Map<String, dynamic> json) {
// //     id = json['id'];
// //     planId = json['plan_id'];
// //     levelId = json['level_id'];
// //     createdAt = json['created_at'];
// //     updatedAt = json['updated_at'];
// //     plan = json['plan'] != null ? new Plan.fromJson(json['plan']) : null;
// //     level = json['level'] != null ? new Level.fromJson(json['level']) : null;
// //   }
// //
// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = new Map<String, dynamic>();
// //     data['id'] = this.id;
// //     data['plan_id'] = this.planId;
// //     data['level_id'] = this.levelId;
// //     data['created_at'] = this.createdAt;
// //     data['updated_at'] = this.updatedAt;
// //     if (this.plan != null) {
// //       data['plan'] = this.plan!.toJson();
// //     }
// //     if (this.level != null) {
// //       data['level'] = this.level!.toJson();
// //     }
// //     return data;
// //   }
// // }
// //
// // class Plan {
// //   int? id;
// //   String? title;
// //   String? titleAr;
// //   String? description;
// //   String? descriptionAr;
// //   int? duration;
// //   String? muscle;
// //   String? muscleAr;
// //   String? type;
// //   String? typeAr;
// //   String? createdAt;
// //   String? updatedAt;
// //   List<Media>? media;
// //
// //   Plan(
// //       {this.id,
// //         this.title,
// //         this.titleAr,
// //         this.description,
// //         this.descriptionAr,
// //         this.duration,
// //         this.muscle,
// //         this.muscleAr,
// //         this.type,
// //         this.typeAr,
// //         this.createdAt,
// //         this.updatedAt,
// //         this.media});
// //
// //   Plan.fromJson(Map<String, dynamic> json) {
// //     id = json['id'];
// //     title = json['title'];
// //     titleAr = json['title_ar'];
// //     description = json['description'];
// //     descriptionAr = json['description_ar'];
// //     duration = json['duration'];
// //     muscle = json['muscle'];
// //     muscleAr = json['muscle_ar'];
// //     type = json['type'];
// //     typeAr = json['type_ar'];
// //     createdAt = json['created_at'];
// //     updatedAt = json['updated_at'];
// //     if (json['media'] != null) {
// //       media = <Media>[];
// //       json['media'].forEach((v) {
// //         media!.add(new Media.fromJson(v));
// //       });
// //     }
// //   }
// //
// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = new Map<String, dynamic>();
// //     data['id'] = this.id;
// //     data['title'] = this.title;
// //     data['title_ar'] = this.titleAr;
// //     data['description'] = this.description;
// //     data['description_ar'] = this.descriptionAr;
// //     data['duration'] = this.duration;
// //     data['muscle'] = this.muscle;
// //     data['muscle_ar'] = this.muscleAr;
// //     data['type'] = this.type;
// //     data['type_ar'] = this.typeAr;
// //     data['created_at'] = this.createdAt;
// //     data['updated_at'] = this.updatedAt;
// //     if (this.media != null) {
// //       data['media'] = this.media!.map((v) => v.toJson()).toList();
// //     }
// //     return data;
// //   }
// // }
// //
// // class Media {
// //   int? id;
// //   String? modelType;
// //   int? modelId;
// //   String? uuid;
// //   String? collectionName;
// //   String? name;
// //   String? fileName;
// //   String? mimeType;
// //   String? disk;
// //   String? conversionsDisk;
// //   int? size;
// //   List<Null>? manipulations;
// //   List<Null>? customProperties;
// //   List<Null>? generatedConversions;
// //   List<Null>? responsiveImages;
// //   int? orderColumn;
// //   String? createdAt;
// //   String? updatedAt;
// //   String? originalUrl;
// //   String? previewUrl;
// //
// //   Media(
// //       {this.id,
// //         this.modelType,
// //         this.modelId,
// //         this.uuid,
// //         this.collectionName,
// //         this.name,
// //         this.fileName,
// //         this.mimeType,
// //         this.disk,
// //         this.conversionsDisk,
// //         this.size,
// //         this.manipulations,
// //         this.customProperties,
// //         this.generatedConversions,
// //         this.responsiveImages,
// //         this.orderColumn,
// //         this.createdAt,
// //         this.updatedAt,
// //         this.originalUrl,
// //         this.previewUrl});
// //
// //   Media.fromJson(Map<String, dynamic> json) {
// //     id = json['id'];
// //     modelType = json['model_type'];
// //     modelId = json['model_id'];
// //     uuid = json['uuid'];
// //     collectionName = json['collection_name'];
// //     name = json['name'];
// //     fileName = json['file_name'];
// //     mimeType = json['mime_type'];
// //     disk = json['disk'];
// //     conversionsDisk = json['conversions_disk'];
// //     size = json['size'];
// //
// //     orderColumn = json['order_column'];
// //     createdAt = json['created_at'];
// //     updatedAt = json['updated_at'];
// //     originalUrl = json['original_url'];
// //     previewUrl = json['preview_url'];
// //   }
// //
// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = new Map<String, dynamic>();
// //     data['id'] = this.id;
// //     data['model_type'] = this.modelType;
// //     data['model_id'] = this.modelId;
// //     data['uuid'] = this.uuid;
// //     data['collection_name'] = this.collectionName;
// //     data['name'] = this.name;
// //     data['file_name'] = this.fileName;
// //     data['mime_type'] = this.mimeType;
// //     data['disk'] = this.disk;
// //     data['conversions_disk'] = this.conversionsDisk;
// //     data['size'] = this.size;
// //     data['order_column'] = this.orderColumn;
// //     data['created_at'] = this.createdAt;
// //     data['updated_at'] = this.updatedAt;
// //     data['original_url'] = this.originalUrl;
// //     data['preview_url'] = this.previewUrl;
// //     return data;
// //   }
// // }
// //
// // class Level {
// //   int? id;
// //   String? title;
// //   String? createdAt;
// //   String? updatedAt;
// //
// //   Level({this.id, this.title, this.createdAt, this.updatedAt});
// //
// //   Level.fromJson(Map<String, dynamic> json) {
// //     id = json['id'];
// //     title = json['title'];
// //     createdAt = json['created_at'];
// //     updatedAt = json['updated_at'];
// //   }
// //
// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = new Map<String, dynamic>();
// //     data['id'] = this.id;
// //     data['title'] = this.title;
// //     data['created_at'] = this.createdAt;
// //     data['updated_at'] = this.updatedAt;
// //     return data;
// //   }
// // }
// //
// // class Goals {
// //   int? id;
// //   String? title;
// //   String? titleAr;
// //   String? description;
// //   String? descriptionAr;
// //   int? caloriesMax;
// //   int? caloriesMin;
// //   int? duration;
// //   String? createdAt;
// //   String? updatedAt;
// //
// //   Goals(
// //       {this.id,
// //         this.title,
// //         this.titleAr,
// //         this.description,
// //         this.descriptionAr,
// //         this.caloriesMax,
// //         this.caloriesMin,
// //         this.duration,
// //         this.createdAt,
// //         this.updatedAt});
// //
// //   Goals.fromJson(Map<String, dynamic> json) {
// //     id = json['id'];
// //     title = json['title'];
// //     titleAr = json['title_ar'];
// //     description = json['description'];
// //     descriptionAr = json['description_ar'];
// //     caloriesMax = json['calories_max'];
// //     caloriesMin = json['calories_min'];
// //     duration = json['duration'];
// //     createdAt = json['created_at'];
// //     updatedAt = json['updated_at'];
// //   }
// //
// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = new Map<String, dynamic>();
// //     data['id'] = this.id;
// //     data['title'] = this.title;
// //     data['title_ar'] = this.titleAr;
// //     data['description'] = this.description;
// //     data['description_ar'] = this.descriptionAr;
// //     data['calories_max'] = this.caloriesMax;
// //     data['calories_min'] = this.caloriesMin;
// //     data['duration'] = this.duration;
// //     data['created_at'] = this.createdAt;
// //     data['updated_at'] = this.updatedAt;
// //     return data;
// //   }
// // }
// //
// // class Date {
// //   int? id;
// //   int? userId;
// //   String? date;
// //   String? createdAt;
// //   String? updatedAt;
// //
// //   Date({this.id, this.userId, this.date, this.createdAt, this.updatedAt});
// //
// //   Date.fromJson(Map<String, dynamic> json) {
// //     id = json['id'];
// //     userId = json['user_id'];
// //     date = json['date'];
// //     createdAt = json['created_at'];
// //     updatedAt = json['updated_at'];
// //   }
// //
// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = new Map<String, dynamic>();
// //     data['id'] = this.id;
// //     data['user_id'] = this.userId;
// //     data['date'] = this.date;
// //     data['created_at'] = this.createdAt;
// //     data['updated_at'] = this.updatedAt;
// //     return data;
// //   }
// // }
