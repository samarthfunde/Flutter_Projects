import 'dart:convert';
import 'package:api_integration_product/model/data_model.dart';
import 'package:api_integration_product/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DataModel? productData; // global

  @override
  void initState() {
    super.initState();
    getProducts(); // Fetching the data when the page loads
  }

  void getProducts() async {
    String url = "https://dummyjson.com/products";
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var mData = response.body;
      var rawData = jsonDecode(mData);

      productData = DataModel.fromJson(rawData);
      setState(() {});
    } else {
      // Handle error
      print("Error fetching data: ${response.statusCode}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
      ),
      body: productData != null
          ? ListView.builder(
              itemCount: productData!.products!.length,
              itemBuilder: (context, index) {
                ProductModel eachProduct = productData!.products![index];

                return Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(eachProduct.thumbnail!),
                      ),
                      title: Text(eachProduct.title!),
                      subtitle: Text(eachProduct.description!),
                    ),
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: eachProduct.images!.length,
                        itemBuilder: (context, childIndex) {
                          String eachProductImgUrl =
                              eachProduct.images![childIndex];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(11),
                              child: Image.network(
                                eachProductImgUrl,
                                fit: BoxFit.fill,
                                height: 50,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getProducts(); // Refresh button to fetch products again
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
