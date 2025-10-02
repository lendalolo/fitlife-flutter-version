class MealDetailes{
  Data? data;
  MealDetailes({this.data});

  MealDetailes.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
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
  List<Other>? other;
  List<Time>? time;
  List<Media>? media;
  Category? category;
  int? breakfast;
  int? lunch;
  int? dinner;
  int? snacks;
  List<Ingredients>? ingredients;

  Data(
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
        this.other,
        this.time,
        this.media,
        this.category,
        this.breakfast,
        this.lunch,
        this.dinner,
        this.snacks,
        this.ingredients});

  Data.fromJson(Map<String, dynamic> json) {
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
    breakfast = json['breakfast'];
    lunch = json['lunch'];
    dinner = json['dinner'];
    snacks = json['snacks'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['other'] != null) {
      other = <Other>[];
      json['other'].forEach((v) {
        other!.add(new Other.fromJson(v));
      });
    }
    if (json['time'] != null) {
      time = <Time>[];
      json['time'].forEach((v) {
        time!.add(new Time.fromJson(v));
      });
    }
    if (json['media'] != null) {
      media = <Media>[];
      json['media'].forEach((v) {
        media!.add(new Media.fromJson(v));
      });
    }
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    if (json['ingredients'] != null) {
      ingredients = <Ingredients>[];
      json['ingredients'].forEach((v) {
        ingredients!.add(new Ingredients.fromJson(v));
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
    if (this.other != null) {
      data['other'] = this.other!.map((v) => v.toJson()).toList();
    }
    if (this.time != null) {
      data['time'] = this.time!.map((v) => v.toJson()).toList();
    }
    if (this.media != null) {
      data['media'] = this.media!.map((v) => v.toJson()).toList();
    }
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.ingredients != null) {
      data['ingredients'] = this.ingredients!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Other {
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
  List<Media>? media;

  Other(
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
        this.media});

  Other.fromJson(Map<String, dynamic> json) {
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

class Time {
  int? id;
  int? planId;
  int? mealId;
  int? day;
  int? week;
  int? breakfast;
  int? lunch;
  int? dinner;
  int? snacks;
  String? createdAt;
  String? updatedAt;

  Time(
      {this.id,
        this.planId,
        this.mealId,
        this.day,
        this.week,
        this.breakfast,
        this.lunch,
        this.dinner,
        this.snacks,
        this.createdAt,
        this.updatedAt});

  Time.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    planId = json['plan_id'];
    mealId = json['meal_id'];
    day = json['day'];
    week = json['week'];
    breakfast = json['breakfast'];
    lunch = json['lunch'];
    dinner = json['dinner'];
    snacks = json['snacks'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['plan_id'] = this.planId;
    data['meal_id'] = this.mealId;
    data['day'] = this.day;
    data['week'] = this.week;
    data['breakfast'] = this.breakfast;
    data['lunch'] = this.lunch;
    data['dinner'] = this.dinner;
    data['snacks'] = this.snacks;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Category {
  int? id;
  String? title;
  String? titleAr;
  String? createdAt;
  String? updatedAt;

  Category({this.id, this.title, this.titleAr, this.createdAt, this.updatedAt});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    titleAr = json['title_ar'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['title_ar'] = this.titleAr;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Ingredients {
  int? id;
  int? mealId;
  String? name;
  String? nameAr;
  int? num;
  String? createdAt;
  String? updatedAt;
  List<Media>? media;

  Ingredients(
      {this.id,
        this.mealId,
        this.name,
        this.nameAr,
        this.num,
        this.createdAt,
        this.updatedAt,
        this.media});

  Ingredients.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mealId = json['meal_id'];
    name = json['name'];
    nameAr = json['name_ar'];
    num = json['num'];
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
    data['meal_id'] = this.mealId;
    data['name'] = this.name;
    data['name_ar'] = this.nameAr;
    data['num'] = this.num;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.media != null) {
      data['media'] = this.media!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}