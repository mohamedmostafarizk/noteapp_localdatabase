import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:noteapp/cubits/Notecubit/cubit/note_cubit_cubit.dart';
import 'package:noteapp/models/notemodel.dart';
import 'package:noteapp/utils/constants.dart';
import 'package:noteapp/views/notesview.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(NotemodelAdapter());
  await Hive.openBox<Notemodel>(kNotesBox);

  runApp(const Notesapp());
}

class Notesapp extends StatelessWidget {
  const Notesapp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NoteCubitCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: Notesview(),
      ),
    );
  }
}
