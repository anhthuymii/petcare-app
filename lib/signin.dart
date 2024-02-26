import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;

import 'homepage.dart';
import 'signup.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  Future<void> signin() async {
    final response = await http.post(
      Uri.parse("http://192.168.234.56/login/signin.php"),
      body: {
        "username": username.text,
        "password": password.text,
      },
    );

    try {
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        if (data == "Success") {
          Fluttertoast.showToast(
            msg: "Đăng nhập thành công",
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.blue[400],
            textColor: Colors.white,
            fontSize: 16,
          );
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
        } else {
          Fluttertoast.showToast(
            msg: "Tên đăng nhập hoặc mật khẩu sai",
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red[400],
            textColor: Colors.white,
            fontSize: 16,
          );
        }
      } else {
        Fluttertoast.showToast(
          msg: "Đã xảy ra lỗi. Vui lòng thử lại sau.",
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red[400],
          textColor: Colors.white,
          fontSize: 16,
        );
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Đã xảy ra lỗi không xác định. Vui lòng thử lại sau.",
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red[400],
        textColor: Colors.white,
        fontSize: 16,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF90CAF9),
      body: Stack(
        children: [
          Positioned(
            top: -MediaQuery.of(context).size.width / 1.4,
            child: Transform.scale(
              scale: 2,
              child: Container(
                height: MediaQuery.of(context).size.width,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                    MediaQuery.of(context).size.width,
                  ),
                ),
              ),
            ),
          ),
          Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  Center(
                    child: Image.asset(
                      "assets/anhthuy/images/pet.jpg",
                      width: 350,
                      height: 240,
                    ),
                  ),
                  const SizedBox(height: 50),
                  const Center(
                    child: Text(
                      "Đăng nhập",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextField(
                      controller: username,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Nhập tên đăng nhập',
                        prefixIcon: const Icon(
                          Icons.account_circle_rounded,
                          color: Color(0xFF64B5F6),
                          size: 30.0,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextField(
                      obscureText: true,
                      controller: password,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Nhập mật khẩu',
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: Color(0xFF64B5F6),
                          size: 30.0,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 50.0),
                  ElevatedButton(
                    onPressed: () {
                      signin();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 16),
                    ),
                    child: const Text(
                      'Đăng nhập',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Bạn không có tài khoản? ",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[50],
                          ),
                        ),
                        GestureDetector(
                          child: const Text(
                            "Đăng ký",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          onTap: () {
                            Get.to(SignUp());
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}