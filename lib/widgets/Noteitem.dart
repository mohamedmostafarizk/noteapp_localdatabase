// ignore_for_file: file_names, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:noteapp/views/noteedit.dart';

class Noteitem extends StatelessWidget {
  const Noteitem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Noteeditbody()),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.orange[200],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            ListTile(
              title: Text(
                'Flutter Tips',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 32),
                child: Text(
                  'Learn how to build beautiful apps with Flutter',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black.withOpacity(0.6),
                  ),
                ),
              ),
              trailing: Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.delete, color: Colors.black, size: 28),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 200, top: 10),
              child: Text(
                'may 10, 2023',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black.withOpacity(0.6),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
