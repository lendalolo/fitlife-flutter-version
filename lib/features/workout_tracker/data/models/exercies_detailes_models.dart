class ExerciesDetailes {
  int? id;
  String? title;
  String? titleAr;
  String? description;
  String? descriptionAr;
  int? duration;
  int? calories;
  int? counter;
  String? createdAt;
  String? updatedAt;
  List<Media>? media;
  List<Steps>? steps;
  String ImageUrl='';
  String SvgUrl='';
  String VedioUrl='';
  ExerciesDetailes(
      {this.id,
        this.title,
        this.titleAr,
        this.description,
        this.descriptionAr,
        this.duration,
        this.calories,
        this.counter,
        this.createdAt,
        this.updatedAt,
        this.media,
        this.steps});

  ExerciesDetailes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    titleAr = json['title_ar'];
    description = json['description'];
    descriptionAr = json['description_ar'];
    duration = json['duration'];
    calories = json['calories'];
    counter = json['counter'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['media'] != null) {
      media = <Media>[];
      json['media'].forEach((v) {
        media!.add(new Media.fromJson(v));
        if(Media.fromJson(v).collectionName == "exercise_videos")
        {
          VedioUrl = Media.fromJson(v).originalUrl??"";
          print(VedioUrl);
        }
        if(Media.fromJson(v).collectionName == "exercise_svgs")
        {
          SvgUrl = Media.fromJson(v).originalUrl??"";
          print(SvgUrl);
          print("svg url");
        }
        if(Media.fromJson(v).collectionName == "exercise_images")
        {
          ImageUrl = Media.fromJson(v).originalUrl??"";
        }
      });
    }
    if (json['steps'] != null) {
      steps = <Steps>[];
      json['steps'].forEach((v) {
        steps!.add(new Steps.fromJson(v));
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
    data['counter'] = this.counter;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.media != null) {
      data['media'] = this.media!.map((v) => v.toJson()).toList();
    }
    if (this.steps != null) {
      data['steps'] = this.steps!.map((v) => v.toJson()).toList();
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


class Steps {
  int? id;
  String? content;
  String? contentAr;
  int? exerciseId;
  String? createdAt;
  String? updatedAt;
  List<Media>? media;

  Steps(
      {this.id,
        this.content,
        this.contentAr,
        this.exerciseId,
        this.createdAt,
        this.updatedAt,
        this.media});

  Steps.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    content = json['content'];
    contentAr = json['content_ar'];
    exerciseId = json['exercise_id'];
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
    data['content'] = this.content;
    data['content_ar'] = this.contentAr;
    data['exercise_id'] = this.exerciseId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.media != null) {
      data['media'] = this.media!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}