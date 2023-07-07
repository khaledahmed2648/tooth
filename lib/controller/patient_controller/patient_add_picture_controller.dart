import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../view/widgets/auth/custom_login_botton.dart';

class PatientAddPictureController extends GetxController{
  List<File> PickedImages=[];
   getImageFromGallery() async {
    final picker = ImagePicker();
    XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery, // Change to ImageSource.camera for capturing an image
    );

    if (pickedFile != null) {
      PickedImages.add(File(pickedFile.path));
      update();
    }

    return null;
  }
   getImageFromCamera() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
      source: ImageSource.camera, // Change to ImageSource.camera for capturing an image
    );

    if (pickedFile != null) {
      PickedImages.add(File(pickedFile.path)) ;
      update();
    }

    return null;
  }
  getImage(){
    Get.defaultDialog(
        title: '',
        middleText: 'اختر صورة من:',
        middleTextStyle: TextStyle(fontSize: 23),
        actions: [
          CustomLoginBotton(onPressed: (){
          getImageFromCamera();
          }, text: 'الكاميرا'),
          CustomLoginBotton(onPressed: (){
            getImageFromCamera();
          }, text: 'الهاتف'),
        ]
    );
  }
}