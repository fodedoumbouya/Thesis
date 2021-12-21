import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:jufe_thesis/DB/db/userdb/userdb.dart';

class UserDbModel extends GetxController {
  late Box<Userdb> db;
  Userdb userEmpty = Userdb(0, "", "", "", "", false, "");
  static const String dbName = "user";
  @override
  void onInit() {
    db = Hive.box<Userdb>(dbName);

    super.onInit();
  }

  getUserData() {
    Userdb? res = db.get(dbName, defaultValue: userEmpty);
    return res;
  }

  bool setUser(Userdb user) {
    Userdb? res = db.get(dbName, defaultValue: userEmpty);
    try {
      if (res!.id! > 0) {
        db.put(dbName, user);
        print("user ===== Save");
      } else {
        print("user ===== Delete and Save");
        db.delete(dbName);
        db.put(dbName, user);
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> deleteUser() {
    try {
      db.delete(dbName);
      return Future.value(true);
    } catch (e) {
      return Future.value(false);
    }
  }
}
