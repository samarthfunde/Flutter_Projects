import 'package:flutter/material.dart';

/// textStyles

TextStyle mTextStyleBold34({
  Color mColor = Colors.black,
  FontWeight mWeight = FontWeight.normal,
}) {
  return TextStyle(
    fontSize: 34,
    fontFamily: 'fontMain',
    color: mColor,
    fontWeight: FontWeight.bold,
  );
}

TextStyle mTextStyleItalic34({
  Color mColor = Colors.black,
  FontWeight mWeight = FontWeight.normal,
}) {
  return TextStyle(
    fontSize: 34,
    fontFamily: 'fontMain',
    color: mColor,
    fontStyle: FontStyle.italic,
  );
}

TextStyle mTextStyle34({
  Color mColor = Colors.black,
  FontWeight mWeight = FontWeight.normal,
}) {
  return TextStyle(
    fontSize: 34,
    fontFamily: 'fontMain',
    color: mColor,
    fontWeight: mWeight,
  );
}

PreferredSizeWidget myAppBar({required String mTitle}) => AppBar(
      title: Text(mTitle),
    );
