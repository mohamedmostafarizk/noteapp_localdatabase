// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:noteapp/views/NotesListview.dart';
import 'package:noteapp/widgets/CustomAppBar.dart';

class Notesview extends StatelessWidget {
  const Notesview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            SizedBox(height: 50),
            CustomAppBar(),
            SizedBox(height: 25),
            Expanded(child: NotesListview()),
          ],
        ),
      ),
    );
  }
}

