// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/cubits/Notecubit/cubit/note_cubit_cubit.dart';
import 'package:noteapp/views/NotesListview.dart';
import 'package:noteapp/widgets/CustomAppBar.dart';

class Notesbody extends StatefulWidget {
  const Notesbody({super.key});

  @override
  State<Notesbody> createState() => _NotesbodyState();
}

class _NotesbodyState extends State<Notesbody> {
  @override
  void initState() {
    BlocProvider.of<NoteCubitCubit>(context).fetchNotes();
    super.initState();
  }

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
