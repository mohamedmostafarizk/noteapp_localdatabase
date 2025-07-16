// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:noteapp/cubits/cubit/add_note_cubit.dart';

class showbottomsheet extends StatelessWidget {
  const showbottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is AddNoteSuccess) {
            Navigator.pop(context);
          } else if (state is AddNoteFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Error: ${state.errmessage}")),
            );
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: state is AddNoteLoading ? true : false,
            child: SingleChildScrollView(child: Addnewnote()),
          );
        },
      ),
    );
  }
}

class Addnewnote extends StatefulWidget {
  const Addnewnote({super.key, this.onsaved});

  final void Function(String?)? onsaved;

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
              onSaved: widget.onsaved,
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
              onSaved: widget.onsaved,
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
