import 'package:hive/hive.dart';

part 'userdb.g.dart';

@HiveType(typeId: 0, adapterName: "UserAdapter")
class Name {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? email;
  @HiveField(3)
  String? password;
  @HiveField(4)
  String? studendID;
  @HiveField(5)
  bool? login;
  @HiveField(6)
  String? imageUrl;
}
