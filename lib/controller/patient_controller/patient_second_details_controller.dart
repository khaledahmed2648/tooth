import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tooth/controller/auth_controller/register_controller.dart';
import 'package:tooth/core/myservices.dart';
import 'package:tooth/model/user_model.dart';
import 'package:tooth/view/screens/doctor_screens/doctor-home-screen.dart';
import 'package:tooth/view/screens/patient_screens/patient_home_screen.dart';
import '../../view/widgets/auth/custom_login_botton.dart';

class PatientSecondDetailsController extends GetxController {
  PageStatus pageStatus = PageStatus.initial;

  String? caseType;
  UserModel? userModel;
  var anotherDeceases = TextEditingController();
  var previousOperations = TextEditingController();
  var anyMedications = TextEditingController();
  var notes = TextEditingController();
  var formKey = GlobalKey<FormState>();
  List<File> PickedImages = [];
  String PickedImagesUrl0 = '';
  String PickedImagesUrl1 = '';
  getImageFromGallery() async {
    final picker = ImagePicker();
    XFile? pickedFile = await picker.pickImage(
      source: ImageSource
          .gallery, // Change to ImageSource.camera for capturing an image
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
      source: ImageSource
          .camera, // Change to ImageSource.camera for capturing an image
    );

    if (pickedFile != null) {
      PickedImages.add(File(pickedFile.path));
      update();
    }

    return null;
  }

  getImage() {
    Get.defaultDialog(
        title: '',
        middleText: 'اختر صورة من:',
        middleTextStyle: TextStyle(fontSize: 23),
        actions: [
          CustomLoginBotton(
              onPressed: () {
                getImageFromCamera();
                Get.back();
              },
              text: 'الكاميرا'),
          CustomLoginBotton(
              onPressed: () {
                getImageFromGallery();
                Get.back();
              },
              text: 'الهاتف'),
        ]);
  }

  confirmTheRecord(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('برجاء التأكد من جميع البيانات'),
        actions: [
          CustomLoginBotton(
              onPressed: () {
                uploadTheCase();
              },
              text: 'تم التأكد'),
          CustomLoginBotton(
              onPressed: () {
                Get.back();
              },
              text: 'التأكد أولا')
        ],
      ),
    );
  }

  Future uploadImages() async {
     uploadImage(PickedImages[0], 'addedCases', 0);
     uploadImage(PickedImages[1], 'addedCases', 1)
        .then((value) {})
        .catchError((error) {
      print(error);
    });
  }

  uploadTheCase() async {
    if (formKey.currentState!.validate()) {
      if (PickedImages.length == 2) {
        pageStatus = PageStatus.loading;
        Get.snackbar('شكرا لك', 'جاري رفع الحالة ');

        update();
        try {
          await uploadImages().then((value) async {
            await FirebaseFirestore.instance.collection('cases').doc('governorateCases').collection(userModel!.governorate!).add({
              'caseName': userModel!.name,
              'casePhone': userModel!.phone,
              'adderPhone': MyServices.sharedPreferences.getString('phone'),
              'caseAge': userModel!.age,
              'caseGender': userModel!.gender,
              'caseGovernorate': userModel!.governorate,
              'caseType': caseType,
              'anotherDeceases': anotherDeceases.text,
              'previousOperations': previousOperations.text,
              'anyMedications': anyMedications.text,
              'caseImage[0]': PickedImagesUrl0,
              'caseImage[1]': PickedImagesUrl1,
              'notes': notes.text,
              'constructionTime':
                  '${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}'
            }).then((value) {
              addCaseToTheAdderCases(value).then((value) {
                pageStatus = PageStatus.success;

                if (MyServices.sharedPreferences.getBool('loginAsPatient') ==
                    true) {

                  Get.offAll(PatientHomeScreen());
                } else {
                  Get.offAll(DoctorHomeScreen());
                }
                Get.snackbar('شكرا لك', 'لقد تم رفع الحالة بنجاح');
              });
            });
          });
        } catch (error) {
          pageStatus = PageStatus.error;
          print(error);
          Get.snackbar('تنبية',
              'لقد واجهنا مشكلة برفع الحالة\n برجاء تفحص الاتصال بالانترنت والبيانات المرسلة واعادة المحاولة');
        }
      } else {
        Get.defaultDialog(
            title: 'تنبية',
            middleText: 'يجب اضافة صورتين واضحتين لسنك بالاسفل');
      }
    }
  }

  addCaseToTheAdderCases(DocumentReference<Map<String, dynamic>> value) async {
    if (MyServices.sharedPreferences.getBool('loginAsPatient') == true) {
      await FirebaseFirestore.instance
          .collection('patients')
          .doc(MyServices.sharedPreferences.getString('phone'))
          .collection('addedCases')
          .doc(value.id)
          .set({
        'caseName': userModel!.name,
        'casePhone': userModel!.phone,
        'caseAge': userModel!.age,
        'caseGender': userModel!.gender,
        'caseGovernorate': userModel!.governorate,
        'caseType': caseType,
        'anotherDeceases': anotherDeceases.text,
        'previousOperations': previousOperations.text,
        'anyMedications': anyMedications.text,
        'caseImage[0]': PickedImagesUrl0,
        'caseImage[1]': PickedImagesUrl1,
        'notes': notes.text,
        'constructionTime':
        '${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}'
      });
    } else {
      await FirebaseFirestore.instance
          .collection('doctors')
          .doc(MyServices.sharedPreferences.getString('phone'))
          .collection('addedCases')
          .doc(value.id)
          .set({
        'caseName': userModel!.name,
        'casePhone': userModel!.phone,
        'caseAge': userModel!.age,
        'caseGender': userModel!.gender,
        'caseGovernorate': userModel!.governorate,
        'caseType': caseType,
        'anotherDeceases': anotherDeceases.text,
        'previousOperations': previousOperations.text,
        'anyMedications': anyMedications.text,
        'caseImage[0]': PickedImagesUrl0,
        'caseImage[1]': PickedImagesUrl1,
        'notes': notes.text,
        'constructionTime':
        '${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}'
      });
    }
  }

  Future<void> uploadImage(File image, String path, int index) async {
    try {
      final storageRef = FirebaseStorage.instance.ref(
          'users/${MyServices.sharedPreferences.getString('phone')}/$path/${Uri.file(image.path).pathSegments.last}');
      final uploadTask = storageRef.putFile(image);
      final snapshot = await uploadTask;
      final downloadUrl = await snapshot.ref.getDownloadURL();

      if (index == 0) {
        PickedImagesUrl0 = downloadUrl;
      } else {
        PickedImagesUrl1 = downloadUrl;
      }
    } catch (error) {
      print(error);
      throw error; // Rethrow the error to be caught by the caller
    }
  }
}
