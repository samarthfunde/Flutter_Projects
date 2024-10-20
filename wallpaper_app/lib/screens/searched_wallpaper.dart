import 'package:flutter/material.dart';

class SearchedWallpaper extends StatelessWidget {
  const SearchedWallpaper({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wallpaper'),
        centerTitle: true,
        backgroundColor: Colors.pink,
      ),
    );
  }
}
