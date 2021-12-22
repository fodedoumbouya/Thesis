// ignore_for_file: non_constant_identifier_names

class UserData {
  UserData({
    required this.ID,
    required this.name,
    required this.email,
    required this.password,
    required this.studentID,
    required this.image,
  });
  late final int ID;
  late final String name;
  late final String email;
  late final String password;
  late final String studentID;
  late final String image;

  UserData.fromJson(Map<String, dynamic> json) {
    ID = json['ID'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    studentID = json['studentID'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['ID'] = ID;
    _data['name'] = name;
    _data['email'] = email;
    _data['password'] = password;
    _data['studentID'] = studentID;
    _data['image'] = image;
    return _data;
  }
}

class UserResponse {
  UserResponse({
    required this.UserDb,
    required this.Response,
  });
  late final UserData UserDb;
  late final String Response;

  UserResponse.fromJson(Map<String, dynamic> json) {
    UserDb = UserData.fromJson(json['UserData']);
    Response = json['Response'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['UserData'] = UserDb.toJson();
    _data['Response'] = Response;
    return _data;
  }
}

class UserLoginRequest {
  UserLoginRequest({
    required this.email,
    required this.password,
  });
  late final String email;
  late final String password;

  UserLoginRequest.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['email'] = email;
    _data['password'] = password;
    return _data;
  }
}

class UserRegisterRequest {
  UserRegisterRequest({
    required this.Resp,
    required this.Error,
  });
  late final String Resp;
  late final bool Error;

  UserRegisterRequest.fromJson(Map<dynamic, dynamic> json) {
    Resp = json['Resp'];
    Error = json['Error'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['Resp'] = Resp;
    _data['Error'] = Error;
    return _data;
  }
}
