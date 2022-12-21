import 'package:flutter/material.dart';

class ImageView extends StatefulWidget {
  const ImageView({super.key, required this.url});
  final url;

  @override
  State<ImageView> createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        toolbarOpacity: 1.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(10),
          height: double.infinity,
          width: double.infinity,
          child: InteractiveViewer(
            minScale: 1.0,
            maxScale: 3.0,
            panEnabled: true,
            alignPanAxis: true,
            child: Image.network(
              widget.url,
              alignment: Alignment.center,
            ),
          ),
        ),
      ),
    );
  }
}