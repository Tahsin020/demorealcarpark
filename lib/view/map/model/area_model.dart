class AreaModel {
  int? areaCount;
  Location? location;
  String? description;
  int? emptyAreaCount;
  int? filledAreaCount;
  int? id;

  AreaModel
(
      {this.areaCount,
      this.location,
      this.description,
      this.emptyAreaCount,
      this.filledAreaCount,
      this.id});

  AreaModel
.fromJson(Map<String, dynamic> json) {
    areaCount = json['AreaCount'];
    location = json['Location'] != null
        ? Location.fromJson(json['Location'])
        : null;
    description = json['description'];
    emptyAreaCount = json['emptyAreaCount'];
    filledAreaCount = json['filledAreaCount'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['AreaCount'] = areaCount;
    if (location != null) {
      data['Location'] = location!.toJson();
    }
    data['description'] = description;
    data['emptyAreaCount'] = emptyAreaCount;
    data['filledAreaCount'] = filledAreaCount;
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
