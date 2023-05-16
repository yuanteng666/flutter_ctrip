import 'package:flutter/material.dart';

class PhotoPage extends StatelessWidget{
  const PhotoPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: const BoxDecoration(
        color: Colors.blue,
      ),
      child: const Center(
        child: Text("wosh photo"),
      ),
    );
  }
}