import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newlogin/dung/controller/add_controller_member.dart';
import 'package:newlogin/screen.dart';
import 'package:newlogin/userview.dart';



import 'dung/bindings/binding_controller.dart';
import 'dung/controller/member_controller.dart';
import 'signin.dart';
// import 'signup.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
    const MyApp({super.key});

    @override
    Widget build(BuildContext context) {

      Get.lazyPut(()=>MemberService());
      Get.lazyPut(()=>SignUpController());
      WidgetsFlutterBinding.ensureInitialized();
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialBinding: ControllerDetail(),
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Screen(),
      );
    }
}