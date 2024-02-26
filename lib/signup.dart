import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'model/user.dart';
import 'model/usermodel.dart';
import 'style/button.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController date = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController hoten = TextEditingController();
  TextEditingController gioitinh = TextEditingController();

  List<String> _gioitinh = ['Nam', 'Nữ'];
  String? _selectedVal;

  @override
  void initState() {
    super.initState();
    _selectedVal = _gioitinh.first;
  }

  add(User user) async {
    await UserModel().addUser(user).then((success) {
      Fluttertoast.showToast(
          msg: "Đăng ký thành công",
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.blue[400],
          textColor: Colors.white,
          fontSize: 16);
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height,
            maxWidth: MediaQuery.of(context).size.width,
          ),
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Image.asset(
                        "assets/anhthuy/images/signup.png",
                        height: 150,
                        width: 150,
                      ),
                    ),
                    const Text(
                      "Chăm sóc thú cưng",
                      style: TextStyle(
                        color: Color(0xFF1E88E5),
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 6,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.blue[200],
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      )),
                  child: Padding(
                    padding:
                    const EdgeInsets.only(left: 20.0, right: 20.0, top: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          "Xin chào,",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        TextField(
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
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                          controller: password,
                          obscureText: true,
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
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                          controller: hoten,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Nhập họ tên',
                            prefixIcon: const Icon(
                              Icons.person,
                              color: Color(0xFF64B5F6),
                              size: 30.0,
                            ),
                          ),
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                          controller: email,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Nhập email',
                            prefixIcon: const Icon(
                              Icons.email,
                              color: Color(0xFF64B5F6),
                              size: 30.0,
                            ),
                          ),
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                          controller: date,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            prefixIcon: Icon(
                              Icons.calendar_today,
                              color: Colors.blue[300],
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Nhập ngày sinh',
                            // hintStyle: TextStyle(color: Colors.black),
                          ),
                          style: const TextStyle(
                              color: Colors.black, fontSize: 16),
                          onTap: () async {
                            DateTime? pickeddate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2101));
                            if (pickeddate != null) {
                              setState(() {
                                date.text =
                                    DateFormat('yyyy/MM/dd').format(pickeddate);
                              });
                            }
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.only(right: 20),
                          width: double.infinity,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: DropdownButtonFormField<String>(
                            value: _selectedVal,
                            items: _gioitinh
                                .map((e) => DropdownMenuItem<String>(
                              value: e,
                              child: Text(e),
                            ))
                                .toList(),
                            onChanged: (val) {
                              setState(() {
                                _selectedVal = val;
                              });
                            },
                            style: TextStyle(color: Colors.black, fontSize: 18),
                            hint: const Text(
                              'Nhập giới tính',
                              style:
                              TextStyle(color: Colors.white, fontSize: 18),
                            ),
                            icon: Icon(Icons.arrow_drop_down_circle_outlined,
                                color: Colors.blue[300]),
                            dropdownColor: Colors.white,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              prefixIcon:
                              Icon(Icons.wc, color: Colors.blue[300]),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          style: buttonPrimary,
                          onPressed: () {
                            if (username.text.isEmpty) {
                              Fluttertoast.showToast(
                                  msg: "Hãy nhập thông tin",
                                  // toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red[400],
                                  textColor: Colors.white,
                                  fontSize: 16);
                            } else {
                              User user = User(
                                  username: username.text,
                                  email: email.text,
                                  hoten: hoten.text,
                                  password: password.text,
                                  gioitinh: _selectedVal,
                                  date: date.text);
                              add(user);
                            }
                          },
                          child: const Text(
                            'Đăng ký',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Bạn đã có tài khoản ? ",
                                style: TextStyle(
                                  fontSize: 18,
                                  // fontWeight: FontWeight.bold,
                                  color: Colors.grey[50],
                                ),
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                    child: const Text(
                                      "Đăng nhập",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                    onTap: () {
                                      //Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => SignIn()));
                                      Get.back();
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}