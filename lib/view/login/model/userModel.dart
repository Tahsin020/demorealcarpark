class UserModel {
  String? email;
  String? firstName;
  int? id;
  String? lastName;
  String? operationName;

  UserModel({this.email, this.firstName, this.id, this.lastName, this.operationName});

  UserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    firstName = json['firstName'];
    id = json['id'];
    lastName = json['lastName'];
    operationName = json['operationName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['firstName'] = firstName;
    data['id'] = id;
    data['lastName'] = lastName;
    data['operationName'] = operationName;
    return data;
  }
}
