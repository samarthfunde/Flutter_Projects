import 'package:expense_app/domain/ui_helper.dart';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(mTitle: "Home"),
    );
  }
}
