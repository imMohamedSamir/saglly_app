import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../register_view/Register Screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String id = 'LoginPage';

  var emailcontroller = TextEditingController();

  var formKey = GlobalKey<FormState>();

  var emailKey = GlobalKey<FormState>();

  var passKey = GlobalKey<FormState>();

  var passcontroller = TextEditingController();

  bool showpass = true;

  //bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'تسجيل الدخول',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 50.0,
                      ),
                    ),
                    const Text(
                      'سجل الدخول الان لتبدا معنا رحلة التعلم الشيقة!',
                      style: TextStyle(
                        color: Colors.black45,
                        fontWeight: FontWeight.w500,
                        fontSize: 18.0,
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                     TextFormField(
                        key: emailKey,
                        controller: emailcontroller,
                        onTap: () {},
                        onChanged: (value) {

                        },
                        onFieldSubmitted: (value) {},
                        decoration: InputDecoration(
                          label: const Text('سجل بريدك الاكتروني'),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(35)),
                          prefixIcon: const Icon(Icons.email_outlined),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return (' يجب ادخال البريد الالكتروني  ');
                          }
                          return null;
                        },
                      ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: passcontroller,
                      keyboardType: TextInputType.visiblePassword,
                      onFieldSubmitted: (value) {
                        if (kDebugMode) {
                          print(value);
                        }
                      },
                      onChanged: (value) {
                        if (kDebugMode) {
                          print(value);
                        }
                      },
                      obscureText: showpass,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return (' يجب كتابة كلمة السر');
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        focusColor: Colors.orange,
                        labelText: 'كلمة السر',
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.orange,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(35)),
                        prefixIcon: const Icon(Icons.lock_outline),
                        suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                showpass = !showpass;
                              });
                            },
                            child: const Icon(Icons.remove_red_eye_outlined),),
                      ),
                    ),
                    const SizedBox(height: 10,),

                    Container(
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      width: double.infinity,
                      height: 55.0,
                      child: MaterialButton(
                        onPressed: (){},
                        child: const Text(
                          'تسجيل الدخول',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'ليس لديك حساب',
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                        TextButton(
                           onPressed: () {
                            Navigator.push(context,MaterialPageRoute(builder: (context)=>RegisterScreen()));
                          },
                          child: const Text(
                            'انضم الينا الاّن',
                            style:
                                TextStyle(fontSize: 18, color: Colors.orange),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}




//
// else{
//   showDialog(context: context, builder: (context){
//     return AlertDialog(
//       content: Column(
//         children: [
//           Text('لدواعي الامان ',style: TextStyle(fontSize: 15,color: Colors.black),),
//           Text('غير مسموع تسجيل الدخول الا من خلال الهاتف نفسه الذي قمت بالتسجيل عليه اول مرة',style: TextStyle(fontSize: 15,color: Colors.black),),
//           Text('اذا كنت تعتقد ان ذلك حدث بالخطأ, برجاء التوجه لأكاديمية الامير لحل المشكلة',style: TextStyle(fontSize: 15,color: Colors.black),),
//         ],
//       ),
//       actions: [
//         TextButton(onPressed: (){
//           Navigator.pop(context);
//         }, child: Text('تمام', style: TextStyle(fontSize: 15,color: Colors.black),),),
//       ],
//     );
//   });
//
// }