class ParkingAreasModel {
  String? description;
  Location? location;
  bool? status;
  int? id;

  ParkingAreasModel({this.description, this.location, this.status, this.id});

  ParkingAreasModel.fromJson(Map<String, dynamic> json) {
    description = json['Description'];
    location = json['Location'] != null
        ? Location.fromJson(json['Location'])
        : null;
    status = json['Status'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Description'] = description;
    if (location != null) {
      data['Location'] = location!.toJson();
    }
    data['Status'] = status;
    data['id'] = id;
    return data;
  }
}

class Location {
  double? lang;
  double? lung;

  Location({this.lang, this.lung});

  Location.fromJson(Map<String, dynamic> json) {
    lang = json['Lang'];
    lung = json['Lung'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Lang'] = lang;
    data['Lung'] = lung;
    return data;
  }
}
