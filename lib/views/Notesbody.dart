// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:noteapp/views/NotesListview.dart';
import 'package:noteapp/widgets/CustomAppBar.dart';

class Notesbody extends StatelessWidget {
  const Notesbody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          SizedBox(height: 50),
          CustomAppBar(text: 'Notes', icon: Icons.search),
          SizedBox(height: 25),
          Expanded(child: NotesListview()),
        ],
      ),
    );
  }
}
