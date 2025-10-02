class TodayTargetModel {
  List<Data>? data;
  String? type;
  String? message;
  List<List<bool>> isChecked=[];

  TodayTargetModel({this.data, this.type, this.message});

  TodayTargetModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add( Data.fromJson(v));
      });
      for(int planId =0; planId< data![0].plans!.length ; planId++)
     {
       while (isChecked.length <= planId) {
       isChecked.add([]);
     }
       int i=0;
       if(data![0].plans![planId].targets !=null)
       {
         for (var exer in data![0].plans![planId].exercise!) {
           i++;
           for (var target in data![0].plans![planId].targets!) {
             if(target.check == exer.id ) {
               isChecked[planId].add(true);
             }
           }
           if( isChecked[planId].isEmpty || isChecked[planId].length != i) isChecked[planId].add(false);
         }
       }else{
         for(int i =0 ;i< data![0].plans![planId].exercise!.length;i++) {
           isChecked[planId].add(false);
         }
       }
     }
    }
    type = json['type'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['type'] = this.type;
    data['message'] = this.message;
    return data;
  }
}

class Data {
  MyGoal? myGoal;
  List<Plans>? plans;
  List<Meals>? meals;
  List<Water>? water;
  List<Sleep>? sleep;
  List<Date>? date;

  Data(
      {this.myGoal, this.plans, this.meals, this.water, this.sleep, this.date});

  Data.fromJson(Map<String, dynamic> json) {
    myGoal =
    json['myGoal'] != null ? new MyGoal.fromJson(json['myGoal']) : null;
    if (json['plans'] != null) {
      plans = <Plans>[];
      json['plans'].forEach((v) {
        plans!.add(new Plans.fromJson(v));
      });
    }
    if (json['meals'] != null) {
      meals = <Meals>[];
      json['meals'].forEach((v) {
        meals!.add(new Meals.fromJson(v));
      });
    }
    if (json['water'] != null) {
      water = <Water>[];
      json['water'].forEach((v) {
        water!.add(new Water.fromJson(v));
      });
    }
    if (json['sleep'] != null) {
      sleep = <Sleep>[];
      json['sleep'].forEach((v) {
        sleep!.add(new Sleep.fromJson(v));
      });
    }
    if (json['date'] != null) {
      date = <Date>[];
      json['date'].forEach((v) {
        date!.add(new Date.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.myGoal != null) {
      data['myGoal'] = this.myGoal!.toJson();
    }
    if (this.plans != null) {
      data['plans'] = this.plans!.map((v) => v.toJson()).toList();
    }
    if (this.meals != null) {
      data['meals'] = this.meals!.map((v) => v.toJson()).toList();
    }
    if (this.water != null) {
      data['water'] = this.water!.map((v) => v.toJson()).toList();
    }
    if (this.sleep != null) {
      data['sleep'] = this.sleep!.map((v) => v.toJson()).toList();
    }
    if (this.date != null) {
      data['date'] = this.date!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MyGoal {
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
  int? totalRate;
  int? exercise;
  List<Media>? media;

  MyGoal(
      {this.id,
        this.title,
        this.titleAr,
        this.description,
        this.descriptionAr,
        this.caloriesMax,
        this.caloriesMin,
        this.duration,
        this.createdAt,
        this.updatedAt,
        this.totalRate,
        this.exercise,
        this.media});

  MyGoal.fromJson(Map<String, dynamic> json) {
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
    totalRate = json['totalRate'];
    exercise = json['exercise'];
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
    data['calories_max'] = this.caloriesMax;
    data['calories_min'] = this.caloriesMin;
    data['duration'] = this.duration;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['totalRate'] = this.totalRate;
    data['exercise'] = this.exercise;
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

class Plans {
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
  List<Targets>? targets;
  List<Media>? media;
  List<Exercise>? exercise;
  List<bool> isCheck=[];

  Plans(
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
        this.targets,
        this.media,
        this.exercise});

  Plans.fromJson(Map<String, dynamic> json) {
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
    if (json['exercise'] != null) {
      exercise = <Exercise>[];
      json['exercise'].forEach((v) {
        exercise!.add(new Exercise.fromJson(v));
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
    if (this.targets != null) {
      data['targets'] = this.targets!.map((v) => v.toJson()).toList();
    }
    if (this.media != null) {
      data['media'] = this.media!.map((v) => v.toJson()).toList();
    }
    if (this.exercise != null) {
      data['exercise'] = this.exercise!.map((v) => v.toJson()).toList();
    }
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
  GoalPlan? goalPlan;

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
        this.goalPlan});

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
    goalPlan = json['goal_plan'] != null
        ? new GoalPlan.fromJson(json['goal_plan'])
        : null;
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
    if (this.goalPlan != null) {
      data['goal_plan'] = this.goalPlan!.toJson();
    }
    return data;
  }
}

class GoalPlan {
  int? id;
  int? goalId;
  int? planId;
  String? createdAt;
  String? updatedAt;

  GoalPlan({this.id, this.goalId, this.planId, this.createdAt, this.updatedAt});

  GoalPlan.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    goalId = json['goal_id'];
    planId = json['plan_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['goal_id'] = this.goalId;
    data['plan_id'] = this.planId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
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

class Meals {
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
  List<Targets>? targets;
  List< Media>? media;
  List<Meal>? meal;
  List<Meal>? mybasckt;

  Meals(
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
        this.targets,
        this.media,
        this.meal});

  Meals.fromJson(Map<String, dynamic> json) {
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
    if (json['targets'] != null) {
      targets = <Targets>[];
      mybasckt =<Meal>[];
      json['targets'].forEach((v) {
        targets!.add( Targets.fromJson(v));
        json['meal'].forEach((element) {
          if(Targets.fromJson(v).check == Meal.fromJson(element).id)
          {
            mybasckt!.add(Meal.fromJson(element));
          }
        });

      });
    }
    if (json['media'] != null) {
      media = < Media>[];
      json['media'].forEach((v) {
        media!.add(new  Media.fromJson(v));
      });
    }
    if (json['meal'] != null) {
      meal = <Meal>[];
      json['meal'].forEach((v) {
        meal!.add( Meal.fromJson(v));
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
    if (this.targets != null) {
      data['targets'] = this.targets!.map((v) => v.toJson()).toList();
    }
    if (this.media != null) {
      data['media'] = this.media!.map((v) => v.toJson()).toList();
    }
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

class Water {
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
  List<Targets>? targets;
  List< Media>? media;

  Water(
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
        this.targets,
        this.media});

  Water.fromJson(Map<String, dynamic> json) {
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
    if (json['targets'] != null) {
      targets = <Targets>[];
      json['targets'].forEach((v) {
        targets!.add(new Targets.fromJson(v));
      });
    }
    if (json['media'] != null) {
      media = <Media>[];
      json['media'].forEach((v) {
        media!.add(new  Media.fromJson(v));
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
class Sleep {
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
  List<Targets>? targets;
  List< Media>? media;

  Sleep(
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
        this.targets,
        this.media});

  Sleep.fromJson(Map<String, dynamic> json) {
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
    if (json['targets'] != null) {
      targets = <Targets>[];
      json['targets'].forEach((v) {
        targets!.add(new Targets.fromJson(v));
      });
    }
    if (json['media'] != null) {
      media = < Media>[];
      json['media'].forEach((v) {
        media!.add(new  Media.fromJson(v));
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
    if (this.targets != null) {
      data['targets'] = this.targets!.map((v) => v.toJson()).toList();
    }
    if (this.media != null) {
      data['media'] = this.media!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}



// class TodayTargetModel {
//   List<Data>? data;
//   String? type;
//   String? message;
//
//   TodayTargetModel({this.data, this.type, this.message});
//
//   TodayTargetModel.fromJson(Map<String, dynamic> json) {
//     if (json['data'] != null) {
//       data = <Data>[];
//       json['data'].forEach((v) {
//         data!.add(new Data.fromJson(v));
//       });
//     }
//     type = json['type'];
//     message = json['message'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.data != null) {
//       data['data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     data['type'] = this.type;
//     data['message'] = this.message;
//     return data;
//   }
// }
//
// class Data {
//   MyGoal? myGoal;
//   List<Plans>? plans;
//   List<Meals>? meals;
//   List<Water>? water;
//   List<Sleep>? sleep;
//   List<Date>? date;
//
//   Data(
//       {this.myGoal, this.plans, this.meals, this.water, this.sleep, this.date});
//
//   Data.fromJson(Map<String, dynamic> json) {
//     myGoal =
//     json['myGoal'] != null ? new MyGoal.fromJson(json['myGoal']) : null;
//     if (json['plans'] != null) {
//       plans = <Plans>[];
//       json['plans'].forEach((v) {
//         plans!.add(new Plans.fromJson(v));
//       });
//     }
//     if (json['meals'] != null) {
//       meals = <Meals>[];
//       json['meals'].forEach((v) {
//         meals!.add(new Meals.fromJson(v));
//       });
//     }
//     if (json['water'] != null) {
//       water = <Water>[];
//       json['water'].forEach((v) {
//         water!.add(new Water.fromJson(v));
//       });
//     }
//     if (json['sleep'] != null) {
//       sleep = <Sleep>[];
//       json['sleep'].forEach((v) {
//         sleep!.add(new Sleep.fromJson(v));
//       });
//     }
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
//     if (this.myGoal != null) {
//       data['myGoal'] = this.myGoal!.toJson();
//     }
//     if (this.plans != null) {
//       data['plans'] = this.plans!.map((v) => v.toJson()).toList();
//     }
//     if (this.meals != null) {
//       data['meals'] = this.meals!.map((v) => v.toJson()).toList();
//     }
//     if (this.water != null) {
//       data['water'] = this.water!.map((v) => v.toJson()).toList();
//     }
//     if (this.sleep != null) {
//       data['sleep'] = this.sleep!.map((v) => v.toJson()).toList();
//     }
//     if (this.date != null) {
//       data['date'] = this.date!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class MyGoal {
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
//   int? totalRate;
//   int? exercise;
//   List<Media>? media;
//
//   MyGoal(
//       {this.id,
//         this.title,
//         this.titleAr,
//         this.description,
//         this.descriptionAr,
//         this.caloriesMax,
//         this.caloriesMin,
//         this.duration,
//         this.createdAt,
//         this.updatedAt,
//         this.totalRate,
//         this.exercise,
//         this.media});
//
//   MyGoal.fromJson(Map<String, dynamic> json) {
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
//     totalRate = json['totalRate'];
//     exercise = json['exercise'];
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
//     data['calories_max'] = this.caloriesMax;
//     data['calories_min'] = this.caloriesMin;
//     data['duration'] = this.duration;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     data['totalRate'] = this.totalRate;
//     data['exercise'] = this.exercise;
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
// class Plans {
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
//   List<Targets>? targets;
//   List<Media>? media;
//   List<Exercise>? exercise;
//
//   Plans(
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
//         this.targets,
//         this.media,
//         this.exercise});
//
//   Plans.fromJson(Map<String, dynamic> json) {
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
//     if (json['targets'] != null) {
//       targets = <Targets>[];
//       json['targets'].forEach((v) {
//         targets!.add(new Targets.fromJson(v));
//       });
//     }
//     if (json['media'] != null) {
//       media = <Media>[];
//       json['media'].forEach((v) {
//         media!.add(new Media.fromJson(v));
//       });
//     }
//     if (json['exercise'] != null) {
//       exercise = <Exercise>[];
//       json['exercise'].forEach((v) {
//         exercise!.add(new Exercise.fromJson(v));
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
//     if (this.targets != null) {
//       data['targets'] = this.targets!.map((v) => v.toJson()).toList();
//     }
//     if (this.media != null) {
//       data['media'] = this.media!.map((v) => v.toJson()).toList();
//     }
//     if (this.exercise != null) {
//       data['exercise'] = this.exercise!.map((v) => v.toJson()).toList();
//     }
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
//   GoalPlan? goalPlan;
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
//         this.goalPlan});
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
//     goalPlan = json['goal_plan'] != null
//         ? new GoalPlan.fromJson(json['goal_plan'])
//         : null;
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
//     if (this.goalPlan != null) {
//       data['goal_plan'] = this.goalPlan!.toJson();
//     }
//     return data;
//   }
// }
//
// class GoalPlan {
//   int? id;
//   int? goalId;
//   int? planId;
//   String? createdAt;
//   String? updatedAt;
//
//   GoalPlan({this.id, this.goalId, this.planId, this.createdAt, this.updatedAt});
//
//   GoalPlan.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     goalId = json['goal_id'];
//     planId = json['plan_id'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['goal_id'] = this.goalId;
//     data['plan_id'] = this.planId;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
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
//   String? type;
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
//         this.type,
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
//     type = json['type'];
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
//     data['type'] = this.type;
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
//   int? day;
//   int? week;
//
//   Pivot({this.planId, this.exerciseId, this.day, this.week});
//
//   Pivot.fromJson(Map<String, dynamic> json) {
//     planId = json['plan_id'];
//     exerciseId = json['exercise_id'];
//     day = json['day'];
//     week = json['week'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['plan_id'] = this.planId;
//     data['exercise_id'] = this.exerciseId;
//     data['day'] = this.day;
//     data['week'] = this.week;
//     return data;
//   }
// }
//
// class Meals {
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
//   List<Null>? targets;
//   List<Null>? media;
//   List<Meal>? meal;
//
//   Meals(
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
//         this.targets,
//         this.media,
//         this.meal});
//
//   Meals.fromJson(Map<String, dynamic> json) {
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
//     if (json['targets'] != null) {
//       targets = <Null>[];
//       json['targets'].forEach((v) {
//         targets!.add(new Null.fromJson(v));
//       });
//     }
//     if (json['media'] != null) {
//       media = <Null>[];
//       json['media'].forEach((v) {
//         media!.add(new Null.fromJson(v));
//       });
//     }
//     if (json['meal'] != null) {
//       meal = <Meal>[];
//       json['meal'].forEach((v) {
//         meal!.add(new Meal.fromJson(v));
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
//     if (this.targets != null) {
//       data['targets'] = this.targets!.map((v) => v.toJson()).toList();
//     }
//     if (this.media != null) {
//       data['media'] = this.media!.map((v) => v.toJson()).toList();
//     }
//     if (this.meal != null) {
//       data['meal'] = this.meal!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class Meal {
//   int? id;
//   String? title;
//   String? titleAr;
//   String? description;
//   String? descriptionAr;
//   int? calories;
//   int? carbohydrates;
//   int? fats;
//   int? proteins;
//   String? prepare;
//   String? prepareAr;
//   int? categoryId;
//   String? createdAt;
//   String? updatedAt;
//   Pivot? pivot;
//   List<Media>? media;
//
//   Meal(
//       {this.id,
//         this.title,
//         this.titleAr,
//         this.description,
//         this.descriptionAr,
//         this.calories,
//         this.carbohydrates,
//         this.fats,
//         this.proteins,
//         this.prepare,
//         this.prepareAr,
//         this.categoryId,
//         this.createdAt,
//         this.updatedAt,
//         this.pivot,
//         this.media});
//
//   Meal.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     title = json['title'];
//     titleAr = json['title_ar'];
//     description = json['description'];
//     descriptionAr = json['description_ar'];
//     calories = json['calories'];
//     carbohydrates = json['carbohydrates'];
//     fats = json['fats'];
//     proteins = json['proteins'];
//     prepare = json['prepare'];
//     prepareAr = json['prepare_ar'];
//     categoryId = json['category_id'];
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
//     data['calories'] = this.calories;
//     data['carbohydrates'] = this.carbohydrates;
//     data['fats'] = this.fats;
//     data['proteins'] = this.proteins;
//     data['prepare'] = this.prepare;
//     data['prepare_ar'] = this.prepareAr;
//     data['category_id'] = this.categoryId;
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
//
//
// class Water {
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
//   List<Null>? targets;
//   List<Null>? media;
//
//   Water(
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
//         this.targets,
//         this.media});
//
//   Water.fromJson(Map<String, dynamic> json) {
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
//     if (json['targets'] != null) {
//       targets = <Null>[];
//       json['targets'].forEach((v) {
//         targets!.add(new Null.fromJson(v));
//       });
//     }
//     if (json['media'] != null) {
//       media = <Null>[];
//       json['media'].forEach((v) {
//         media!.add(new Null.fromJson(v));
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
//     if (this.targets != null) {
//       data['targets'] = this.targets!.map((v) => v.toJson()).toList();
//     }
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
//
// }
//
// class MySleep {
//   List<Sleep>? sleep;
//
//   MySleep({this.sleep});
//
//   MySleep.fromJson(Map<String, dynamic> json) {
//     if (json['sleep'] != null) {
//       sleep = <Sleep>[];
//       json['sleep'].forEach((v) {
//         sleep!.add(new Sleep.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.sleep != null) {
//       data['sleep'] = this.sleep!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class Sleep {
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
//   List<Null>? targets;
//   List<Null>? media;
//
//   Sleep(
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
//         this.targets,
//         this.media});
//
//   Sleep.fromJson(Map<String, dynamic> json) {
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
//     if (json['targets'] != null) {
//       targets = <Null>[];
//       json['targets'].forEach((v) {
//         targets!.add(new Null.fromJson(v));
//       });
//     }
//     if (json['media'] != null) {
//       media = <Null>[];
//       json['media'].forEach((v) {
//         media!.add(new Null.fromJson(v));
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
//     if (this.targets != null) {
//       data['targets'] = this.targets!.map((v) => v.toJson()).toList();
//     }
//     if (this.media != null) {
//       data['media'] = this.media!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }