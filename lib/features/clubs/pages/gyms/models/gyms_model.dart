class GymModel {
  final int id;
  final String name;
  final String description;
  final String descriptionAr;
  final String address;
  final String open;
  final String close;
  final String type;
  final String price;
  final int distance;
  final List<Media> media;

  GymModel({
    required this.id,
    required this.name,
    required this.description,
    required this.descriptionAr,
    required this.address,
    required this.open,
    required this.close,
    required this.type,
    required this.price,
    required this.distance,
    required this.media,
  });

  factory GymModel.fromJson(Map<String, dynamic> json) {
    var mediaList = <Media>[];
    if (json['media'] != null) {
      mediaList = List<Media>.from(json['media'].map((x) => Media.fromJson(x)));
    }

    return GymModel(
      id: json['id'],
      name: json['name'],
      description: json['description'] ?? '',
      descriptionAr: json['description_ar'] ?? '',
      address: json['address'] ?? '',
      open: json['open'] ?? '',
      close: json['close'] ?? '',
      type: json['type'] ?? '',
      price: json['price'] ?? '',
      distance: json['distance'] ?? 0,
      media: mediaList,
    );
  }
}

class Media {
  final int id;
  final String fileName;
  final String originalUrl;
  final String description;

  Media({
    required this.id,
    required this.fileName,
    required this.originalUrl,
    this.description = '',
  });

  factory Media.fromJson(Map<String, dynamic> json) {
    return Media(
      id: json['id'],
      fileName: json['file_name'] ?? '',
      originalUrl: json['original_url'] ?? '',
      description: json['description'] ?? '',
    );
  }
}
