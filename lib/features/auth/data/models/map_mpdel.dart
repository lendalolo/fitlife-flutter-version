class PlaceModel {
  final int placeId;
  final String licence;
  final String osmType;
  final int osmId;
  final double lat;
  final double lon;
  final String placeClass;
  final String type;
  final int placeRank;
  final double importance;
  final String addresstype;
  final String name;
  final String displayName;
  final List<double> boundingbox;

  PlaceModel({
    required this.placeId,
    required this.licence,
    required this.osmType,
    required this.osmId,
    required this.lat,
    required this.lon,
    required this.placeClass,
    required this.type,
    required this.placeRank,
    required this.importance,
    required this.addresstype,
    required this.name,
    required this.displayName,
    required this.boundingbox,
  });

  factory PlaceModel.fromJson(Map<String, dynamic> json) {
    return PlaceModel(
      placeId: json['place_id'],
      licence: json['licence'],
      osmType: json['osm_type'],
      osmId: json['osm_id'],
      lat: double.parse(json['lat'].toString()),
      lon: double.parse(json['lon'].toString()),
      placeClass: json['class'],
      type: json['type'],
      placeRank: json['place_rank'],
      importance: double.parse(json['importance'].toString()),
      addresstype: json['addresstype'],
      name: json['name'],
      displayName: json['display_name'],
      boundingbox: (json['boundingbox'] as List)
          .map((e) => double.parse(e.toString()))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'place_id': placeId,
      'licence': licence,
      'osm_type': osmType,
      'osm_id': osmId,
      'lat': lat,
      'lon': lon,
      'class': placeClass,
      'type': type,
      'place_rank': placeRank,
      'importance': importance,
      'addresstype': addresstype,
      'name': name,
      'display_name': displayName,
      'boundingbox': boundingbox,
    };
  }
}


// class UserAddressModel {
//   List<Addressmap>? addressmap;
//
//   UserAddressModel({this.addressmap});
//
//   UserAddressModel.fromJson(List json) {
//       addressmap = <Addressmap>[];
//       for (var v in json) {
//         addressmap!.add(Addressmap.fromJson(v));
//       }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.addressmap != null) {
//       data['addressmap'] = this.addressmap!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class Addressmap {
//   int? placeId;
//   String? licence;
//   String? osmType;
//   int? osmId;
//   double? lat;
//   double? lon;
//   String? type;
//   int? placeRank;
//   double? importance;
//   String? addresstype;
//   String? name;
//   String? displayName;
//   List<double>? boundingbox;
//
//   Addressmap(
//       {this.placeId,
//         this.licence,
//         this.osmType,
//         this.osmId,
//         this.lat,
//         this.lon,
//         this.type,
//         this.placeRank,
//         this.importance,
//         this.addresstype,
//         this.name,
//         this.displayName,
//         this.boundingbox});
//
//   Addressmap.fromJson(Map<String, dynamic> json) {
//     placeId = json['place_id'];
//     licence = json['licence'];
//     osmType = json['osm_type'];
//     osmId = json['osm_id'];
//     lat = json['lat'];
//     lon = json['lon'];
//
//     type = json['type'];
//     placeRank = json['place_rank'];
//     importance = json['importance'];
//     addresstype = json['addresstype'];
//     name = json['name'];
//     displayName = json['display_name'];
//     boundingbox = json['boundingbox'].cast<double>();
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['place_id'] = this.placeId;
//     data['licence'] = this.licence;
//     data['osm_type'] = this.osmType;
//     data['osm_id'] = this.osmId;
//     data['lat'] = this.lat;
//     data['lon'] = this.lon;
//     data['type'] = this.type;
//     data['place_rank'] = this.placeRank;
//     data['importance'] = this.importance;
//     data['addresstype'] = this.addresstype;
//     data['name'] = this.name;
//     data['display_name'] = this.displayName;
//     data['boundingbox'] = this.boundingbox;
//     return data;
//   }
// }