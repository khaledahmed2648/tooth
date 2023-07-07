import 'package:flutter/material.dart';
import 'package:tooth/core/myservices.dart';
import 'package:tooth/view/widgets/auth/custom_login_botton.dart';

class PatientHomeProfile extends StatelessWidget {
  const PatientHomeProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
        gradient: SweepGradient(
          colors: [Colors.red, Colors.black],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .15,
          ),
          Expanded( // Add Expanded widget to make the second Center expand
            child: Stack(
              alignment: AlignmentDirectional.topCenter,
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height*.12,),
                  padding:EdgeInsets.symmetric(
                    horizontal: 15,) ,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30),
                      )
                  ),
                  child: ListView(

                    children: [
                      SizedBox(height: 20,),
                      Text('الاسم',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 23),),
                      SizedBox(height: 10,),
                      Container(
                        color: Color(0xffF9FAFB),
                        child: TextFormField(
                          controller: TextEditingController(text: MyServices.sharedPreferences.getString('name')),
                          style: TextStyle(
                              fontSize: 18
                          ),

                          decoration:InputDecoration(
                            border: InputBorder.none,
                            hintText: 'الاسم',

                          ),
                        ),
                      ),
                      Text('رقم الهاتف',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 23),),
                      SizedBox(height: 10,),
                      Container(
                        color: Color(0xffF9FAFB),
                        child: TextFormField(
                          textDirection: TextDirection.ltr,
                          controller: TextEditingController(text: MyServices.sharedPreferences.getString('phone')),

                          style: TextStyle(
                              fontSize: 18
                          ),

                          decoration:InputDecoration(

                            border: InputBorder.none,
                            hintText: 'البريد الالكتروني',

                          ),
                        ),
                      ),
                      Text('السن',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 23),),
                      SizedBox(height: 10,),
                      Container(
                        color: Color(0xffF9FAFB),
                        child: TextFormField(
                          controller: TextEditingController(text: MyServices.sharedPreferences.getString('age')),
                          style: TextStyle(
                              fontSize: 18
                          ),

                          decoration:InputDecoration(

                            border: InputBorder.none,
                            hintText: 'السن',

                          ),
                        ),
                      ),
                      CustomLoginBotton(onPressed: (){}, text: 'حفظ التغييرات')

                    ],
                  ),

                ),
                Positioned(
                  bottom: MediaQuery.of(context).size.height*.512,
                  child: Center(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      height: MediaQuery.of(context).size.height * .2,
                      width: MediaQuery.of(context).size.width * .4,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white,width: 15),
                          color: Color(0xffA8B1CE)
                        // image: DecorationImage(image: AssetImage('assets/images/logo-2-1.png',),fit: BoxFit.fill)
                      ),
                      child: Image.asset('assets/images/logo-2-1.png'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
