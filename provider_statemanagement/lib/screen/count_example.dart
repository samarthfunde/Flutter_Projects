import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_statemanagement/provider/count_provider.dart';

class CountExample extends StatefulWidget {
  const CountExample({super.key});

  @override
  State<CountExample> createState() => _CountExampleState();
}

class _CountExampleState extends State<CountExample> {
  @override
  Widget build(BuildContext context) {
    //final countProvider = Provider.of<CountProvider>(context, listen: false);
    final countProvider = context.watch<CountProvider>();
    //watch is a method provided by the provider package. It listens to the CountProvider and rebuilds the widget whenever the CountProvider changes.
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider"),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Center(
        child: Consumer<CountProvider>(builder: (context, value, child) {
          return Text(value.count.toString(), style: TextStyle(fontSize: 50));
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          countProvider.setCount();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
