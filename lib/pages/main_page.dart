import 'package:flutter/material.dart';
import 'package:flutter_project5/pages/display_page.dart';

import '../storage.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _nameController = TextEditingController();
  DateTime? date;

  void handleSave() {
    Storage.setName(_nameController.value.text);
    if (date != null) {
      Storage.setDate(date!);
    }
  }

  void moveToDisplayPage() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const DisplayPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade100,
      appBar: AppBar(
        title: const Text('Flutter Secure Storage'),
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.green.shade500,
                  borderRadius: BorderRadius.circular(8)),
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      label: const Text('User Name'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        date = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2023),
                            lastDate: DateTime(2024));
                        setState(() {});
                      },
                      child: const Text('Show Calender')),
                  Text('Date ${date?.year} - ${date?.month} - ${date?.day}'),
                  const SizedBox(
                    height: 8,
                  ),
                  ElevatedButton(
                      onPressed: handleSave, child: const Text('Save')),
                ],
              ),
            ),
            ElevatedButton(
                onPressed: moveToDisplayPage, child: const Text('Diplay'))
          ],
        ),
      ),
    );
  }
}
