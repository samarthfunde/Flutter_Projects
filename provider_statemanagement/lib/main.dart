import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_statemanagement/provider/count_provider.dart';
import 'package:provider_statemanagement/screen/count_example.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      // material pe use hota he to provider ko global context aa jata he
      create: (context) => CountProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const CountExample(),
      ),
    );
  }
}
