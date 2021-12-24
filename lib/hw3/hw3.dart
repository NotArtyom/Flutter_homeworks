import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flut_homework/hw3/store/image_store.dart';
import 'package:flut_homework/hw3/image_screen.dart';


class HW3 extends StatefulObserverWidget {
  HW3({Key? key}) : super(key: key);

  final String title = "Homework 3";

  @override
  _HW3State createState() => _HW3State();
}

class _HW3State extends State<HW3> {
  final ImageStore _imageStore = Modular.get<ImageStore>();
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();

  double scale = 1;

  _renderImage(File img) {
    Widget? image = Container();
    image = FileImage(img) as Widget?;
    return image;
  }

  @override
  Widget build(BuildContext context) {
    print(_imageStore.images);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                _imageStore.pickImage(ImageSource.camera);
              },
              icon: Icon(Icons.add_a_photo)),
          IconButton(
              onPressed: () {
                _imageStore.pickImage(ImageSource.gallery);
              },
              icon: Icon(Icons.add_photo_alternate_sharp))
        ],
        title: Center(
          child: Text(
            widget.title,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 30,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return RawMaterialButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ImageScreen(image: _imageStore.images[index])));
                      },
                      child: Hero(
                        tag: 'logo$index',
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image: FileImage(_imageStore.images[index]),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: _imageStore.images.length,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}