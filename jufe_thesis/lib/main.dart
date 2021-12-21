import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:jufe_thesis/DB/db/model/userdbModel.dart';
import 'package:jufe_thesis/DB/db/userdb/userdb.dart';
import 'package:jufe_thesis/UI/pages/LaunchPage/launchPage.dart';
import 'package:jufe_thesis/utils/common_utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapterDB());
  await Hive.openBox<Userdb>('user');

  Get.put(UserDbModel());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JUFE',
      theme: ThemeData(
        backgroundColor: Colors.red[900],
        primaryColor: Colors.white,
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.inderTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: const LaunchPage(),
    );
  }
}
