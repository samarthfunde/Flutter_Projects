import 'dart:convert';

import 'package:api_integratin/model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DataModel? mQuotes; // global
  @override
  void initState() {
    super.initState();
    getQuotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Quotes')),
      body: mQuotes != null
          ? mQuotes!.quotes!.isNotEmpty
              ? ListView.builder(
                  itemCount: mQuotes!.quotes!.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('${mQuotes!.quotes![index].quote}'),
                      subtitle: Text('${mQuotes!.quotes![index].author}'),
                    );
                  })
              : Center(
                  child: Text('No Quotes found!!'),
                )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  // lets create api logic

  getQuotes() async {
    String url = "https://dummyjson.com/quotes";

    var response = await http.get(Uri.parse(url));
    // uniform resource identifier... Uri is a subtype of Url
    if (response.statusCode == 200) {
      var mData = response.body;
      print(mData);

      var rawData = jsonDecode(mData);
      mQuotes = DataModel.fromJson(rawData);
      setState(() {});
    }
  }
}
