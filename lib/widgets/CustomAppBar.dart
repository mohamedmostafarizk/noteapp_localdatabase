// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Notes',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),

        Spacer(),
        Container(
          width: 46,
          height: 46,
          decoration: BoxDecoration(
            color: Colors.grey[800],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(Icons.search, size: 30, color: Colors.white),
        ),
      ],
    );
  }
}
