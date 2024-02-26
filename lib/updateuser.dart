import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../style/button.dart';
import 'model/user.dart';
import 'model/usermodel.dart';
import 'userview.dart';

class UpdateUser extends StatefulWidget {
  final List list;
  final int index;
  UpdateUser({
    Key? key,
    required this.list,
    required this.index,
  });

  @override
  State<UpdateUser> createState() => _UpdateUserState();
}

class _UpdateUserState extends State<UpdateUser> {
  String selectedGioiTinh = '';

  @override
  void initState() {
    super.initState();
    if (widget.index != null) {
      username.text = widget.list[widget.index]['username'];
      password.text = widget.list[widget.index]['password'];
      email.text = widget.list[widget.index]['email'];
      hoten.text = widget.list[widget.index]['hoten'];
      selectedGioiTinh = widget.list[widget.index]['gioitinh'];
      date.text = widget.list[widget.index]['date'];
    }
  }

  final TextEditingController username = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController hoten = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController gioitinh = TextEditingController();
  final TextEditingController date = TextEditingController();

  update(User user) async {
    await UserModel().updateMember(user).then((success) {
      Fluttertoast.showToast(
          msg: "Update thông tin thành công",
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.blue[400],
          textColor: Colors.white,
          fontSize: 16);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF90CAF9),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2196F3),
        elevation: 0,
        title: const Text(
          'Chỉnh sửa thông tin',
          style: TextStyle(
            fontSize: 30,
            fontStyle: FontStyle.italic,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Get.to(UserView());
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height,
            maxWidth: MediaQuery.of(context).size.width,
          ),
          decoration: BoxDecoration(
            color: Colors.blue[200],
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
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              // Xử lý khi người dùng nhấn vào ảnh
                            },
                            child: Stack(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 50,
                                  child: Text(
                                    widget.list[widget.index]['username'][0]
                                        .toString()
                                        .substring(0, 1)
                                        .toUpperCase(),
                                    style: TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue[800],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: GestureDetector(
                                    onTap: () {
                                      // Xử lý khi người dùng nhấn vào biểu tượng sửa ảnh
                                    },
                                    child: const CircleAvatar(
                                      backgroundColor: Colors.blue,
                                      radius: 18,
                                      child: Icon(
                                        Icons.edit,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Chỉnh sửa thông tin thành viên',
                            style: TextStyle(color: Colors.white, fontSize: 22),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 8,
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 15, bottom: 15, left: 20, right: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10.0,
                        ),
                        const Text(
                          'Họ tên:',
                          style: TextStyle(
                            fontSize: 22,
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          controller: hoten,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Colors.blue[300],
                            hintText: 'Chỉnh sửa họ tên',
                            hintStyle: const TextStyle(color: Colors.white),
                            prefixIcon: const Icon(
                              Icons.person,
                              color: Colors.white,
                              size: 30.0,
                            ),
                          ),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 24),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Email:',
                          style: TextStyle(
                            fontSize: 22,
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          controller: email,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Colors.blue[300],
                            hintText: 'Chỉnh sửa email',
                            hintStyle: const TextStyle(color: Colors.white),
                            prefixIcon: const Icon(
                              Icons.person,
                              color: Colors.white,
                              size: 32,
                            ),
                          ),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 24),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Giới tính:',
                          style: TextStyle(
                            fontSize: 22,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          padding: const EdgeInsets.only(right: 20),
                          width: double.infinity,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.blue[300],
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: DropdownButtonFormField<String>(
                            value: selectedGioiTinh,
                            items: ['Nam', 'Nữ']
                                .map((e) => DropdownMenuItem<String>(
                              value: e,
                              child: Text(e),
                            ))
                                .toList(),
                            onChanged: (String? val) {
                              setState(() {
                                selectedGioiTinh = val!;
                              });
                            },
                            style: const TextStyle(
                                color: Colors.white, fontSize: 23),
                            hint: const Text(
                              'Nhập giới tính',
                              style:
                              TextStyle(color: Colors.white, fontSize: 24),
                            ),
                            icon: const Icon(
                                Icons.arrow_drop_down_circle_outlined,
                                color: Colors.white),
                            dropdownColor: Colors.blue[300],
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              prefixIcon:
                              const Icon(Icons.wc, color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Ngày sinh:',
                          style: TextStyle(
                            fontSize: 22,
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          controller: date,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            prefixIcon: const Icon(
                              Icons.calendar_today,
                              color: Colors.white,
                            ),
                            filled: true,
                            fillColor: Colors.blue[300],
                            hintText: 'Chỉnh sửa ngày sinh',
                            hintStyle: const TextStyle(color: Colors.white),
                          ),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 24),
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
                        const SizedBox(height: 30),
                        Center(
                          child: ElevatedButton(
                            style: buttonPrimary,
                            onPressed: () {
                              if (username.text.isEmpty) {
                                Fluttertoast.showToast(
                                    msg: "Hãy nhập thông tin",
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red[400],
                                    textColor: Colors.white,
                                    fontSize: 16);
                              } else {
                                User user = User(
                                  user_id: widget.list[widget.index]['user_id'],
                                  username: username.text,
                                  email: email.text,
                                  hoten: hoten.text,
                                  gioitinh: selectedGioiTinh,
                                  password: password.text,
                                  date: date.text,
                                );
                                update(user);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => UserView()));
                              }
                            },
                            child: const Text(
                              'Cập nhật',
                              style: TextStyle(fontSize: 20),
                            ),
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