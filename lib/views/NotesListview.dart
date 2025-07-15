import 'package:flutter/material.dart';
import 'package:noteapp/widgets/Noteitem.dart';

class NotesListview extends StatelessWidget {
  const NotesListview({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Noteitem(),
        );
      },
    );
  }
}
