import 'package:flutter/material.dart';

class WallpaperBgWidget extends StatelessWidget {
  final double mWidth;
  final double mHeight;
  final String imgUrl;

  WallpaperBgWidget({
    super.key,
    required this.imgUrl,
    this.mWidth = 150,
    this.mHeight = 200,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: mWidth,
      height: mHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(21),
        image: DecorationImage(
          image: NetworkImage(imgUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(21),
        child: FadeInImage(
          placeholder: AssetImage(
              'assets/images/placeholder.png'), // Use a placeholder image
          image: NetworkImage(imgUrl),
          fit: BoxFit.cover,
          imageErrorBuilder: (context, error, stackTrace) {
            return Center(child: Icon(Icons.error, color: Colors.red));
          },
        ),
      ),
    );
  }
}
