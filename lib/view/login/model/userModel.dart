class UserModel {
  String? email;
  String? firstName;
  int? id;
  String? lastName;
  String? operationName;
  String? password;

  UserModel({this.email, this.firstName, this.id, this.lastName, this.operationName,this.password});

  UserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    firstName = json['firstName'];
    id = json['id'];
    lastName = json['lastName'];
    operationName = json['operationName'];
    password =json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['firstName'] = firstName;
    data['id'] = id;
    data['lastName'] = lastName;
    data['operationName'] = operationName;
    data['password'] = password;
    return data;
  }
}
