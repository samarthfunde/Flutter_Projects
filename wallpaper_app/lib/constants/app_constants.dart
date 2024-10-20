import 'package:flutter/material.dart';

class AppConstants {
  static const String PIXELS_API_KEY =
      "9A7F2WRE4kZwJy7ASusNxOEVsIhH7BRMb4VW2qeQpU0IN1ICbtmOnF8G"; //api key from pexels.com

  static const List<Color> mColors = [
    Color(0xfffdb7b9),
    Color(0xff4264e0),
    Color(0xff6141e1),
    Color(0xff60bfc1),
    Color(0xff292929),
    Color(0xff4265c2),
    Color.fromARGB(255, 167, 55, 219),
    Color(0xff5264e1),
  ];

  static const List<Map<String, dynamic>> mCategories = [
    {
      "title": "Abstract",
      "image":
          "https://t4.ftcdn.net/jpg/04/39/69/99/240_F_439699926_GkaQTcxPchsvvtdrZ98cFQh1a8HQICwP.jpg"
    },
    {
      "title": "Nature",
      "image":
          "https://t4.ftcdn.net/jpg/04/35/69/17/240_F_435691745_YxFIjJPgfz5BzY0OOOhSk2g5TUHL5zXT.jpg"
    },
    {
      "title": "Space",
      "image":
          "https://t4.ftcdn.net/jpg/03/86/82/73/240_F_386827376_uWOOhKGk6A4UVL5imUBt20Bh8cmODqzx.jpg"
    },
    {
      "title": "Animals",
      "image":
          "https://t4.ftcdn.net/jpg/02/66/31/75/240_F_266317554_kr7DPOoM5Uty0YCeFU9nDZTt4a2LeMJF.jpg"
    },
  ];
}
