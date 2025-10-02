// class SortedPlans {
//   Data? data;
//   String? type;
//   String? message;
//
//   SortedPlans({this.data, this.type, this.message});
//
//   SortedPlans.fromJson(Map<String, dynamic> json) {
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
//   List<ThighExercises>? thighExercises;
//   List<AbdominalExercises>? abdominalExercises;
//   List<StretchingExercises>? stretchingExercises;
//
//   Data(
//       {this.thighExercises, this.abdominalExercises, this.stretchingExercises});
//
//   Data.fromJson(Map<String, dynamic> json) {
//     if (json['thigh_exercises'] != null) {
//       thighExercises = <ThighExercises>[];
//       json['thigh_exercises'].forEach((v) {
//         thighExercises!.add(new ThighExercises.fromJson(v));
//       });
//     }
//     if (json['abdominal_exercises'] != null) {
//       abdominalExercises = <AbdominalExercises>[];
//       json['abdominal_exercises'].forEach((v) {
//         abdominalExercises!.add(new AbdominalExercises.fromJson(v));
//       });
//     }
//     if (json['stretching_exercises'] != null) {
//       stretchingExercises = <StretchingExercises>[];
//       json['stretching_exercises'].forEach((v) {
//         stretchingExercises!.add(new StretchingExercises.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.thighExercises != null) {
//       data['thigh_exercises'] =
//           this.thighExercises!.map((v) => v.toJson()).toList();
//     }
//     if (this.abdominalExercises != null) {
//       data['abdominal_exercises'] =
//           this.abdominalExercises!.map((v) => v.toJson()).toList();
//     }
//     if (this.stretchingExercises != null) {
//       data['stretching_exercises'] =
//           this.stretchingExercises!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class ThighExercises {
//   int? id;
//   int? goalId;
//   int? planId;
//   String? createdAt;
//   String? updatedAt;
//   Plan? plan;
//   Goals? goals;
//
//   ThighExercises(
//       {this.id,
//         this.goalId,
//         this.planId,
//         this.createdAt,
//         this.updatedAt,
//         this.plan,
//         this.goals});
//
//   ThighExercises.fromJson(Map<String, dynamic> json) {
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
//
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
//     if (this.manipulations != null) {
//       data['manipulations'] =
//           this.manipulations!.map((v) => v.toJson()).toList();
//     }
//     if (this.customProperties != null) {
//       data['custom_properties'] =
//           this.customProperties!.map((v) => v.toJson()).toList();
//     }
//     if (this.generatedConversions != null) {
//       data['generated_conversions'] =
//           this.generatedConversions!.map((v) => v.toJson()).toList();
//     }
//     if (this.responsiveImages != null) {
//       data['responsive_images'] =
//           this.responsiveImages!.map((v) => v.toJson()).toList();
//     }
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