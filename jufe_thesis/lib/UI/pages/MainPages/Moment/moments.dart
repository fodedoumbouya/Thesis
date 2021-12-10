import 'package:flutter/material.dart';

class MomentsPage extends StatefulWidget {
  const MomentsPage({Key? key}) : super(key: key);

  @override
  _MomentsPageState createState() => _MomentsPageState();
}

class _MomentsPageState extends State<MomentsPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Moment Page"),
      ),
    );
  }
}
