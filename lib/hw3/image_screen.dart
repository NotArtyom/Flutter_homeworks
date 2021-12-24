import 'package:flutter/material.dart';
import 'dart:io';

class ImageScreen extends StatefulWidget {
  const ImageScreen({Key? key, required this.image}) : super(key: key);
  final File image;

  @override
  _ImageScreenState createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:  AppBar(
          title: const Text('Image'),
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
        body: Container(
          padding: EdgeInsets.all(16),
          child: PinchZoom(image: widget.image),
        )
    );
  }
}

class PinchZoom extends StatefulWidget {
  const PinchZoom({Key? key, required this.image}) : super(key: key);
  final File image;

  @override
  _PinchZoomState createState() => _PinchZoomState();
}

class _PinchZoomState extends State<PinchZoom> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InteractiveViewer(
        clipBehavior: Clip.none,
        panEnabled: false,
        minScale: 1,
        maxScale: 4,
        child: AspectRatio(
          aspectRatio: 1,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image(
              image: FileImage(widget.image),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}