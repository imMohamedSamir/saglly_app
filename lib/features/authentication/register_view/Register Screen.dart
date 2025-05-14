
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../login_view/login_screen.dart';


class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var emailcontroller = TextEditingController();
  var namecontroller = TextEditingController();
  var passcontroller = TextEditingController();
  var phonecontroller = TextEditingController();
  var nationalIDcontroller = TextEditingController();
  var confirmpasscontroller = TextEditingController();
  var formKey = GlobalKey<FormState>();
  var nameKey = GlobalKey<FormState>();
  var emailKey = GlobalKey<FormState>();
  var passKey = GlobalKey<FormState>();
  var phoneKey = GlobalKey<FormState>();
  var nationalIDKey = GlobalKey<FormState>();
  var confirmpass = GlobalKey<FormState>();


  bool obsecure=true;
  String faculty =' ';
  String level =' ';
  List<String> allLevels = [' ', 'الفرقة الاولى', 'الفرقة الثانية', 'الفرقة الثالثة', 'الفرقة الرابعة'];
  List<String> instituteLevels = [' ', 'الفرقة الاولى', 'الفرقة الثانية'];

  List<String> levels = [' ']; // الليستة المعروضة في الواجهة

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const Text(
                    'Join us Now!',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 40.0,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  //name
                   TextFormField(
                    key: nameKey,
                    keyboardType: TextInputType.name,

                    controller: namecontroller,
                    onTap: (){},
                    onChanged: (value){},
                    onFieldSubmitted: (value){},
                    decoration: InputDecoration(label: const Text('سجل اسمك'),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(35)
                      ),
                      prefixIcon: const Icon(Icons.person),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ('ادخل اسمك');
                      }
                      return null;
                    },
                  ),

                  //email
                  TextFormField(
                    key: emailKey,
                    keyboardType: TextInputType.emailAddress,

                    controller: emailcontroller,
                    onTap: (){},
                    onChanged: (value){},
                    onFieldSubmitted: (value){},
                    decoration: InputDecoration(label: const Text('سجل بريدك الاكتروني'),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(35)
                      ),
                      prefixIcon: const Icon(Icons.email_outlined),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return (' يجب ادخال البريد الالكتروني  ');
                      }
                      return null;
                    },
                  ),
                  //phone
                   TextFormField(
                    keyboardType: TextInputType.phone,

                    key: phoneKey,
                    controller: phonecontroller,
                    onTap: (){},
                    onChanged: (value){},
                    onFieldSubmitted: (value){},
                    decoration: InputDecoration(label: const Text('سجل رقم الهاتف'),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(35)
                      ),
                      prefixIcon: const Icon(Icons.phone_android),
                    ),
                    validator: (value) {
                      if (value!.length != 11) {
                        return (' يجب ادخال رقم هاتف صحيح  ');
                      }
                      return null;
                    },
                  ),

                  //الكلية
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButtonFormField(
                      validator: (value) {
                        if (value == ' ') {
                          return ('اختار الكلية');
                        }
                        return null;
                      },
                      value: faculty,
                      items: [
                        ' ',
                        'شريعة وقانون',
                        'لغة عربية',
                        'اصول دين',
                        'شريعة اسلامية',
                        'معهد معاوني القضاء',
                      ]
                          .map((role) => DropdownMenuItem(
                        value: role,
                        child: Text(role),
                      ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          faculty = value!;
                          levels = (faculty == 'معهد معاوني القضاء') ? instituteLevels : allLevels;
                          level = ' '; // إعادة تعيين الفرقة المختارة
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'اختار الكلية',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(35),
                        ),
                        prefixIcon: const Icon(Icons.business),
                      ),
                    ),
                  ),
                  //الفرقة
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButtonFormField(
                      value: level,
                      validator: (value) {
                        if (value == ' ') {
                          return ('اختار الفرقة');
                        }
                        return null;
                      },
                      items: levels
                          .map((role) => DropdownMenuItem(
                        value: role,
                        child: Text(role),
                      ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          level = value!;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'اختار الفرقة',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(35),
                        ),
                        prefixIcon: const Icon(Icons.numbers),
                      ),
                    ),
                  ),
                  //pass
                  TextFormField(
                    key: passKey,
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
                    obscureText: obsecure,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ('يجب كتابة كلمة السر');
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'كلمة السر',
                      border:  OutlineInputBorder(
                        borderRadius: BorderRadius.circular(35),
                      ),
                      prefixIcon: const Icon(Icons.lock_outline),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            obsecure= !obsecure;
                          });
                        },
                        icon: const Icon(Icons.remove_red_eye_outlined),
                      ),
                    ),
                  ),
                  //confirm pass
                  TextFormField(
                    key: confirmpass,
                    controller: confirmpasscontroller,
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
                    obscureText: obsecure,
                    validator: (value) {
                      if (passcontroller.text !=
                          confirmpasscontroller.text) {
                        return ('كلمات المرور غير متطابقة');
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'تاكيد كلمة المرور ',
                      border:  OutlineInputBorder(
                        borderRadius: BorderRadius.circular(35),
                      ),
                      prefixIcon: const Icon(Icons.lock_outline),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              obsecure= !obsecure;
                            });
                          },
                          icon: const Icon(Icons.remove_red_eye_outlined)),
                    ),
                  ),

                  //button
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    width: double.infinity,
                    height: 55.0,
                    child: MaterialButton(
                      onPressed: () async {

                      },
                      child: const Text(
                        'انضم الينا!',
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
                        'لديك حساب بالفعل؟',
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>  LoginScreen()),
                                (route) {
                              return false;
                            },);
                        },
                        child: const Text(
                          'سجل الدخول ',
                          style: TextStyle(fontSize: 18,color: Colors.orange),
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
    );

  }
}
