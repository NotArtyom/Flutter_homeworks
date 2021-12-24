import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';
import 'dart:io';

// Include generated file
part 'image_store.g.dart';

// This is the class used by rest of your codebase
class ImageStore = _ImageStore with _$ImageStore;

// The store-class
abstract class _ImageStore with Store {
  @observable
  ObservableList<File> images = ObservableList.of([]);

  @action
  Future pickImage(ImageSource type) async {
    try {
      final image = await ImagePicker().pickImage(source: type);
      if (image == null) return;

      final imageTemporary = File(image.path);
      images.add(imageTemporary);
    } on PlatformException catch (e) {
      print(e);
    }
  }
}