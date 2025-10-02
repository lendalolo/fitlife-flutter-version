class MealCategories {
  List<CategorieData>? data;

  MealCategories({this.data});

  MealCategories.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <CategorieData>[];
      json['data'].forEach((v) {
        data!.add(new CategorieData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CategorieData {
  int? id;
  String? title;
  String? titleAr;
  String? createdAt;
  String? updatedAt;

  CategorieData({this.id, this.title, this.titleAr, this.createdAt, this.updatedAt});

  CategorieData.fromJson(Map<String, dynamic> json) {
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