import 'package:flutter/material.dart';
import 'package:jufe_thesis/UI/pages/MainPages/profile/services/report.dart';
import 'package:jufe_thesis/utils/common_utils.dart';

class ServicesPage extends StatefulWidget {
  const ServicesPage({Key? key}) : super(key: key);

  @override
  _ServicesPageState createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  late Size size;
  static const String report = "ROOM REPORT";
  static const String suggestion = "SUGGESTION";
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        key: UniqueKey(),
        backgroundColor: Theme.of(context).backgroundColor,
        title: const Text("SERVICES"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          showServices(report, Icons.report_problem),
          const Divider(),
          showServices(suggestion, Icons.alternate_email),
          const Divider(),
        ],
      ),
    );
  }

  Widget showServices(String title, IconData icon) {
    return InkWell(
      child: SizedBox(
        height: size.height * 0.07,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(
                icon,
                color: Theme.of(context).backgroundColor,
                size: 30,
              ),
              SizedBox(
                width: size.width / 4,
              ),
              Expanded(
                  child: Text(
                title,
                style: const TextStyle(fontSize: 25),
              ))
            ],
          ),
        ),
      ),
      onTap: () {
        switch (title) {
          case report:
            CommonUtils.navigationBarToNextPage(context, Report(title))
                .then((value) => CommonUtils.printShowNavigator(title, false));
            CommonUtils.printShowNavigator(title, true);
            break;
          case suggestion:
            CommonUtils.navigationBarToNextPage(context, Report(title))
                .then((value) => CommonUtils.printShowNavigator(title, false));
            CommonUtils.printShowNavigator(title, true);
            break;
          default:
        }
      },
    );
  }
}
