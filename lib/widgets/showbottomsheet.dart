// ignore_for_file: camel_case_types, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:noteapp/cubits/AddNote_cubit/add_note_cubit.dart';
import 'package:noteapp/cubits/Notecubit/cubit/note_cubit_cubit.dart';
import 'package:noteapp/models/notemodel.dart';

class showbottomsheet extends StatelessWidget {
  const showbottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: BlocConsumer<AddNoteCubit, AddNoteState>(
          listener: (context, state) {
            if (state is AddNoteSuccess) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text("Done")));
              BlocProvider.of<NoteCubitCubit>(context).fetchNotes();
            } else if (state is AddNoteFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Error: ${state.errmessage}")),
              );
            }
          },
          builder: (context, state) {
            return ModalProgressHUD(
              inAsyncCall: state is AddNoteLoading ? true : false,
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: SingleChildScrollView(child: Addnewnote()),
              ),
            );
          },
        ),
      ),
    );
  }
}

class Addnewnote extends StatefulWidget {
  const Addnewnote({super.key}); //, this.onsaved});

  //final void Function(String?)? onsaved;

  @override
  State<Addnewnote> createState() => _AddnewnoteState();
}

class _AddnewnoteState extends State<Addnewnote> {
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: globalKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          const SizedBox(height: 16),
          const Text(
            "Add a new note",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              onSaved: (value) {
                title = value;
              },
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return "Title cannot be empty";
                } else {
                  return null;
                }
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: "Note title",
              ),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              onSaved: (value) {
                subtitle = value;
              },
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return "Title cannot be empty";
                } else {
                  return null;
                }
              },
              maxLines: 8,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: "content",
              ),
            ),
          ),
          const SizedBox(height: 16),
          GestureDetector(
            onTap: () {
              if (globalKey.currentState!.validate()) {
                globalKey.currentState!.save();
                var note = Notemodel(
                  title: title!,
                  subtitle: subtitle!,
                  date: DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now()),
                  color: Colors.blue.value,
                );
                BlocProvider.of<AddNoteCubit>(context).addNote(note);
                Navigator.pop(context);
                // Here you can add the logic to save the note
                // For example, you can call a function to save the note to a database
              } else {
                setState(() {
                  autovalidateMode = AutovalidateMode.always;
                });
              }
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              height: 35,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(12),
              ),

              child: Center(
                child: Text(
                  'Add',
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
              ),
            ),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
