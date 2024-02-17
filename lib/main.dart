import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker_using_bloc/bloc/image_picker_bloc.dart';
import 'package:image_picker_using_bloc/ui/image_picker_screen.dart';
import 'package:image_picker_using_bloc/utiles/image_picker_utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
        providers: [
          BlocProvider(create: (_)=>ImagePickerBloc(ImagePickerUtils()))
        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: ImagePicker(),
        )
    );
  }
}
