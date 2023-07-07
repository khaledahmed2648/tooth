import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tooth/controller/auth_controller/register_controller.dart';
import 'package:tooth/controller/patient_controller/patient_first_details_controller.dart';
import 'package:tooth/main_variables.dart';

class PatientFirstDetailsScreen extends StatelessWidget {
  final String caseType;
  const PatientFirstDetailsScreen({Key? key, required this.caseType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    PatientFirstDetailsController controller = Get.put(
      PatientFirstDetailsController(),
    );
    return SafeArea(
        child: Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      resizeToAvoidBottomInset: true,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.goToNextPage(caseType);
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
                'الاسم ثلاثي',
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
                    if (value!.length < 6)
                      return 'الاسم قصير للغاية';
                    else
                      return null;
                  },
                  controller: controller.nameController,
                  style: TextStyle(fontSize: 18),
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                    border: InputBorder.none,
                    hintText: 'الاسم',
                  ),
                ),
              ),
              Text(
                'رقم الهاتف',
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
                  textDirection: TextDirection.ltr,
                  validator: (value) {
                    if (!GetUtils.isPhoneNumber(value!))
                      return 'رقم هاتف غير صالح';
                    else
                      return null;
                  },
                  controller: controller.phoneController,
                  style: TextStyle(fontSize: 18),
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                    border: InputBorder.none,
                    hintText: 'رقم الهاتف',
                  ),
                ),
              ),
              Text(
                'المحافظة',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 23),
              ),
              SizedBox(
                height: 10,
              ),
              GetBuilder<PatientFirstDetailsController>(builder: (controller) => Container(
                padding: EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xffe7e1e1),
                ),
                child: Center(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: controller.selectedGovernorate,
                    hint: Text('اختر المحافظة'),
                    onChanged: (String? newValue) {
                      controller.selectedGovernorate = newValue!;
                      controller.update();
                    },
                    items: egyptianGovernorates.map((String governorate) {
                      return DropdownMenuItem<String>(
                        value: governorate,
                        child: Text(governorate),
                      );
                    }).toList(),
                  ),
                ),
              ),),
              Text(
                'السن',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 23),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsetsDirectional.only(
                    end: MediaQuery.of(context).size.width * .6),
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
                  controller: controller.ageController,
                  style: TextStyle(fontSize: 18),
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * .25,
                child: GetBuilder<PatientFirstDetailsController>(
                  builder: (controller) => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          controller.changeCaseType(0);
                        },
                        child: Container(
                            alignment: AlignmentDirectional.center,
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 15),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                    width: 1.5, color: Color(0xffA8B1CE)),
                                color: controller.caseType == 0
                                    ? Color(0xffD9D9D9)
                                    : null),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/male_logo.png',
                                  width: MediaQuery.of(context).size.width * .1,
                                  height:
                                      MediaQuery.of(context).size.width * .1,
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  'ذكر',
                                  style: TextStyle(
                                      color: Color(0xff4BB2E3), fontSize: 15),
                                )
                              ],
                            )),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      InkWell(
                        onTap: () {
                          controller.changeCaseType(1);
                        },
                        child: Container(
                            alignment: AlignmentDirectional.center,
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 15),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                    width: 1.5, color: Color(0xffA8B1CE)),
                                color: controller.caseType == 1
                                    ? Color(0xffD9D9D9)
                                    : null),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/female_logo.png',
                                  width: MediaQuery.of(context).size.width * .1,
                                  height:
                                      MediaQuery.of(context).size.width * .1,
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  'أنثى',
                                  style: TextStyle(
                                      color: Color(0xff4BB2E3), fontSize: 15),
                                )
                              ],
                            )),
                      ),
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
