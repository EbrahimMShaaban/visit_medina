class UserModel {
  String? name;
  String? email;
  String? type;
  String? uId;


  UserModel({
    this.name,
    this.email,
    this.type,
    this.uId,

  });

  UserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    name = json['name'];
    type = json['type'];
    uId = json['uId'];

  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'type': type,
      'uId': uId,

    };
  }
}
