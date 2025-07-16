// ignore_for_file: deprecated_member_use, sort_child_properties_last, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/cubits/Notecubit/cubit/note_cubit_cubit.dart';
import 'package:noteapp/views/Notesbody.dart';
import 'package:noteapp/widgets/showbottomsheet.dart';

class Notesview extends StatelessWidget {
  const Notesview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NoteCubitCubit(),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              context: context,
              builder: (context) {
                return showbottomsheet();
              },
            );
          },
          child: const Icon(Icons.add),
          backgroundColor: Colors.blue,
        ),
        body: Notesbody(),
      ),
    );
  }
}
