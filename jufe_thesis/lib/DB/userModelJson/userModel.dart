import 'package:json_annotation/json_annotation.dart';

part 'userModel.g.dart';

@JsonSerializable()
class User {
  String? name;
  String? email;
  String? password;
  String? studentID;
  String? imageUrl;

  User({this.name, this.email, this.password, this.studentID, this.imageUrl});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
