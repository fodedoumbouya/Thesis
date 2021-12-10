import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:jufe_thesis/UI/pages/MainPages/Home/HomePage.dart';
import 'package:jufe_thesis/UI/pages/MainPages/Moment/moments.dart';
import 'package:jufe_thesis/UI/pages/MainPages/maps/Map.dart';
import 'package:jufe_thesis/UI/pages/MainPages/profile/profilePage.dart';
import 'package:jufe_thesis/UI/pages/MainPages/web/webPage.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _accueil = const HomePage();
  final _maps = const MapsPage();
  final _webview = const WebPage();
  final _moment = const MomentsPage();
  final _profile = const ProfilePage();
  Widget showPage = const HomePage();

  Widget _choosePage(int page) {
    switch (page) {
      case 0:
        return _accueil;
      case 1:
        return _maps;
      case 2:
        return _webview;
      case 3:
        return _moment;
      case 4:
        return _profile;
      default:
        return const Text('No page found');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          height: 50,
          color: Theme.of(context).backgroundColor,
          backgroundColor: Theme.of(context).primaryColor,
          items: const <Widget>[
            Icon(
              Icons.home,
              size: 30,
              color: Colors.white,
            ),
            Icon(
              Icons.map,
              size: 30,
              color: Colors.white,
            ),
            Icon(
              Icons.web,
              size: 30,
              color: Colors.white,
            ),
            Icon(
              Icons.image,
              size: 30,
              color: Colors.white,
            ),
            Icon(
              Icons.person_outline,
              size: 30,
              color: Colors.white,
            ),
          ],
          onTap: (index) {
            //Handle button tap
            setState(() {
              print(index);
              showPage = _choosePage(index);
            });
          },
        ),
        body: showPage);
  }
}
