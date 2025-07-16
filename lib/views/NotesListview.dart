// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/cubits/Notecubit/cubit/note_cubit_cubit.dart';
import 'package:noteapp/models/notemodel.dart';
import 'package:noteapp/widgets/Noteitem.dart';

class NotesListview extends StatelessWidget {
  const NotesListview({super.key});

  @override
  Widget build(BuildContext context) {
    List<Notemodel> notes = BlocProvider.of<NoteCubitCubit>(context).notes!;

    return BlocBuilder<NoteCubitCubit, NoteCubitState>(
      builder: (context, state) {
        return ListView.builder(
          itemCount: notes.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Noteitem(),
            );
          },
        );
      },
    );
  }
}
