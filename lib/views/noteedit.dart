import 'package:flutter/material.dart';
import 'package:noteapp/widgets/CustomAppBar.dart';

class Noteeditbody extends StatelessWidget {
  const Noteeditbody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          children: [
            SizedBox(height: 50),
            CustomAppBar(text: 'Edit', icon: Icons.check),
            SizedBox(height: 20),
            TextField(
              maxLines: 1,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: "Note title",
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              maxLines: 12,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: "content",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
