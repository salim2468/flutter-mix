import 'package:flutter/material.dart';

import '../storage.dart';

class DisplayPage extends StatefulWidget {
  const DisplayPage({super.key});

  @override
  State<DisplayPage> createState() => _DisplayPageState();
}

class _DisplayPageState extends State<DisplayPage> {
  String? name;
  DateTime? date;

  @override
  void initState() {
    // TODO: implement initState
    getDataFromStorage();
    super.initState();
  }

  Future<void> getDataFromStorage() async {
    name = await Storage.getName();
    date = await Storage.getDate();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Secure Storage'),
      ),
      backgroundColor: Colors.green.shade100,
      body: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Text(
              'Name  $name',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              'Date  $date',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
