import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:noteapp/cubits/cubit/add_note_cubit.dart';
import 'package:noteapp/models/notemodel.dart';
import 'package:noteapp/utils/constants.dart';
import 'package:noteapp/views/notesview.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox<Notemodel>(kNotesBox);
  Hive.registerAdapter(NotemodelAdapter());

  runApp(const Notesapp());
}

class Notesapp extends StatelessWidget {
  const Notesapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => AddNoteCubit())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: Notesview(),
      ),
    );
  }
}
