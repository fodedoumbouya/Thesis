import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

List<Image> imagesHolder = [];

class MomentUtils {
  final ImagePicker _picker = ImagePicker();

  Future<XFile> getImage() async {
    final image = await _picker.pickImage(source: ImageSource.gallery);
    return image!;
  }
}
