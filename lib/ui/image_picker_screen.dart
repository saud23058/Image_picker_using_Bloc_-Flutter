import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker_using_bloc/bloc/image_picker_bloc.dart';
import 'package:image_picker_using_bloc/bloc/image_picker_event.dart';
import 'package:image_picker_using_bloc/bloc/image_picker_states.dart';
class ImagePicker extends StatefulWidget {
  const ImagePicker({super.key});

  @override
  State<ImagePicker> createState() => _ImagePickerState();
}

class _ImagePickerState extends State<ImagePicker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Image Picker'),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Take a photo'),
          const SizedBox(height: 50,),
          Center(
            child: BlocBuilder<ImagePickerBloc,ImagePickerStates>(
              builder: (context,state){
                if(state.file==null){
                return InkWell(
                  onTap: (){
                    context.read<ImagePickerBloc>().add(CameraCapture());
                  },
                  child: const CircleAvatar(
                    child: Icon(Icons.camera),
                  ),
                );
                }else{
                  return Image.file(File(state.file!.path.toString()));
                }
              },
            ),
          ),
      const SizedBox(height: 50,),
      const Text('Select image from Gallery'),
          const SizedBox(height: 30,),
      InkWell(
        onTap: (){
          context.read<ImagePickerBloc>().add(GalleryImagePicker());
        },
        child: const CircleAvatar(
          child: Icon(Icons.browse_gallery),
        ),
      )
        ],
      )
    );
  }
}
