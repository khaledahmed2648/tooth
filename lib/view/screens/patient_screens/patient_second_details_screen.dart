import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tooth/controller/patient_controller/patient_second_details_controller.dart';
import 'package:tooth/model/user_model.dart';

class PatientSecondDetailsScreen extends StatelessWidget {
  final String caseType;
  final UserModel userModel;
  const PatientSecondDetailsScreen(
      {Key? key, required this.caseType, required this.userModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    PatientSecondDetailsController controller =
        Get.put(PatientSecondDetailsController(), permanent: true);
    controller.caseType = caseType;
    controller.userModel = userModel;
    return SafeArea(
        child: Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      resizeToAvoidBottomInset: true,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.confirmTheRecord(context);
        },
        backgroundColor: Colors.blue,
        child: Icon(
          Icons.arrow_forward_ios_outlined,
          color: Colors.white,
        ),
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Form(
          key: controller.formKey,
          child: ListView(
            children: [
              SizedBox(
                height: 60,
              ),
              Text(
                'هل تعاني من أي أمراض أخرى ؟',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 23),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xffe7e1e1),
                ),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty)
                      return 'برجاء ملء هذا الحقل';
                    else
                      return null;
                  },
                  controller: controller.anotherDeceases,
                  style: TextStyle(fontSize: 18),
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                    border: InputBorder.none,
                  ),
                ),
              ),
              Text(
                'هل قمت بإجراء عمليات سابقا ؟',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 23),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xffe7e1e1),
                ),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty)
                      return 'برجاء ملء هذا الحقل';
                    else
                      return null;
                  },
                  controller: controller.previousOperations,
                  style: TextStyle(fontSize: 18),
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                    border: InputBorder.none,
                  ),
                ),
              ),
              Text(
                'هل تتناول أي أدوية ؟',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 23),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xffe7e1e1),
                ),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty)
                      return 'برجاء ملء هذا الحقل';
                    else
                      return null;
                  },
                  controller: controller.anyMedications,
                  style: TextStyle(fontSize: 18),
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                    border: InputBorder.none,
                  ),
                ),
              ),
              Text(
                'ملاحظات',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 23),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xffe7e1e1),
                ),
                child: TextFormField(
                  controller: controller.notes,
                  style: TextStyle(fontSize: 18),
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                    border: InputBorder.none,
                  ),
                ),
              ),
              Text(
                'يرجى إضافة صور لحالة الأسنان',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 23),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * .25,
                child: GetBuilder<PatientSecondDetailsController>(
                  builder: (controller) => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (controller.PickedImages.isEmpty)
                        InkWell(
                          onTap: () {
                            controller.getImage();
                          },
                          child: Container(
                            alignment: AlignmentDirectional.center,
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                  width: 1.5, color: Color(0xffA8B1CE)),
                            ),
                            child: Image.asset(
                              'assets/images/add_image.png',
                              width: MediaQuery.of(context).size.width * .15,
                              height: MediaQuery.of(context).size.width * .15,
                            ),
                          ),
                        ),
                      if (controller.PickedImages.isNotEmpty)
                        Container(
                          width: MediaQuery.of(context).size.width * .2,
                          clipBehavior: Clip.antiAlias,
                          alignment: AlignmentDirectional.center,
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: FileImage(
                                controller.PickedImages[0],
                              ),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                                width: 1.5, color: Color(0xffA8B1CE)),
                          ),
                        ),
                      SizedBox(
                        width: 15,
                      ),
                      if (controller.PickedImages.length < 2)
                        InkWell(
                          onTap: () {
                            if (controller.PickedImages.isNotEmpty)
                              controller.getImage();
                          },
                          child: Container(
                            alignment: AlignmentDirectional.center,
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                  width: 1.5, color: Color(0xffA8B1CE)),
                            ),
                            child: Image.asset(
                              'assets/images/add_image.png',
                              width: MediaQuery.of(context).size.width * .15,
                              height: MediaQuery.of(context).size.width * .15,
                            ),
                          ),
                        ),
                      if (controller.PickedImages.length >= 2)
                        Container(
                          width: MediaQuery.of(context).size.width * .2,
                          clipBehavior: Clip.antiAlias,
                          alignment: AlignmentDirectional.center,
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: FileImage(
                                controller.PickedImages[1],
                              ),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                                width: 1.5, color: Color(0xffA8B1CE)),
                          ),
                        )
                    ],
                  ),
                ),
              ).marginSymmetric(vertical: 13)
            ],
          ),
        ),
      ),
    ));
  }
}
