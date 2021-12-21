import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jufe_thesis/UI/pages/MainPages/Moment/addImage.dart';
import 'package:jufe_thesis/UI/pages/MainPages/Moment/utils.dart';
import 'package:jufe_thesis/utils/common_utils.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MomentsPage extends StatefulWidget {
  const MomentsPage({Key? key}) : super(key: key);

  @override
  _MomentsPageState createState() => _MomentsPageState();
}

class _MomentsPageState extends State<MomentsPage> {
  //--------------Controller------------------------
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  final ImagePicker _picker = ImagePicker();

  List<Image> images = [];
  //List<Image> images = imagesHolder;
  late Size size;
  late XFile imagePicked;

  @override
  void initState() {
    images.addAll({
      Image.asset("images/j1.jpg"),
      Image.asset(
        "images/j3.jpg",
      ),
      Image.asset(
        "images/j2.jpg",
      ),
      Image.asset(
        "images/j4.jpg",
      ),
      Image.asset(
        "images/j5.jpeg",
      ),
      Image.asset(
        "images/j5.jpeg",
      ),
      Image.asset(
        "images/j5.jpeg",
      ),
      Image.asset(
        "images/j5.jpeg",
      ),
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        key: UniqueKey(),
        backgroundColor: Theme.of(context).backgroundColor,
        title: const Text("DISCOVER"),
        centerTitle: true,
        leading: const SizedBox(),
        actions: [
          IconButton(
              onPressed: () {
                getImage();
              },
              icon: const Icon(
                Icons.add_a_photo,
              ))
        ],
      ),
      body: SmartRefresher(
        key: UniqueKey(),
        controller: _refreshController,
        // enablePullDown: true,
        enablePullUp: true,
        physics: const AlwaysScrollableScrollPhysics(),
        header: WaterDropHeader(
          waterDropColor: Theme.of(context).backgroundColor,
          refresh: CircularProgressIndicator(
            color: Theme.of(context).backgroundColor,
          ),
          // complete: Text(""),
          key: UniqueKey(),
        ),
        footer: CustomFooter(
          builder: (context, mode) {
            Widget body;
            if (mode == LoadStatus.idle) {
              body = const Text("pull up load");
            } else if (mode == LoadStatus.loading) {
              body = const CupertinoActivityIndicator();
            } else if (mode == LoadStatus.failed) {
              body = const Text("Load Failed!Click retry!");
            } else if (mode == LoadStatus.canLoading) {
              body = const Text("release to load more");
            } else {
              body = const Text("No more Data");
            }
            return SizedBox(
              height: 55.0,
              child: Center(child: body),
            );
          },
        ),
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        child: gridView(images),
      ),
    );
  }

  void getImage() async {
    try {
      await MomentUtils().getImage().then((image) {
        if (image.path.isNotEmpty) {
          CommonUtils.navigationBarToNextPage(
                  context, AddImage(Image.file(File(image.path))), false)
              .then(
                  (value) => CommonUtils.printShowNavigator("AddImage", false));
          CommonUtils.printShowNavigator("AddImage", true);
        }
      });
    } catch (e) {}
  }

  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(const Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(const Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    // images.add(
    //   Image.asset(
    //     "images/ma5.jpg",
    //   ),
    // );
    // if (mounted) setState(() {});
    //_refreshController.loadComplete();
    // _refreshController.loadFailed();
  }

  Widget gridView(List<Image> imagesList) {
    return GridView.count(
      crossAxisCount: 2,
      // scrollDirection: Axis.horizontal,
      childAspectRatio: 1.0,
      mainAxisSpacing: 15.0,
      crossAxisSpacing: 15.0,
      children: imagesList.map((image) {
        return InkWell(
          child: FittedBox(
            child: Material(
                color: Colors.white,
                elevation: 15,
                borderRadius: BorderRadius.circular(25),
                shadowColor: Colors.red,
                child: image),
          ),
        );
      }).toList(),
    );
  }
}
