import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:noteapp/utils/constants.dart';
import 'package:noteapp/views/notesview.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox(kNotesBox);

  runApp(const Notesapp());
}

class Notesapp extends StatelessWidget {
  const Notesapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Notesview(),
    );
  }
}
