import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_using_bloc/bloc/image_picker_event.dart';
import 'package:image_picker_using_bloc/bloc/image_picker_states.dart';
import '../utiles/image_picker_utils.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent,ImagePickerStates>{
  final ImagePickerUtils imagePickerUtils;
  ImagePickerBloc(this.imagePickerUtils):super(const ImagePickerStates()){
    on<CameraCapture>(cameraCapture);
    on<GalleryImagePicker>(galleryPicker);

  }
  void cameraCapture(CameraCapture event, Emitter<ImagePickerStates>emit)async{
    XFile? file= await imagePickerUtils.cameraCapture();
    emit(state.copyWith(file:file));
  }
  void galleryPicker(GalleryImagePicker event, Emitter<ImagePickerStates>emit)async{
    XFile? file= await imagePickerUtils.galleryPicker();
    emit(state.copyWith(file:file));
  }
}
