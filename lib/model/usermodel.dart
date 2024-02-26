
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'user.dart';



class UserModel extends GetxController {
  static const UPDATE_URL = "http://192.168.234.56/login/update.php";
  static const ADD_URL = "http://192.168.234.56/login/signup.php";

  Future<String> addUser(User userModel) async {
    final response =
        await http.post(Uri.parse(ADD_URL), body: userModel.toJsonAdd());
    if (response.statusCode == 200) {
      print("Add Response : " + response.body);
      return response.body;
    } else {
      return "Error";
    }
  }

  Future<String> updateMember(User user) async {
    final respones =
        await http.post(Uri.parse(UPDATE_URL), body: user.toJsonUpdate());
    if (respones.statusCode == 200) {
      print("Update thành công :" + respones.body);
      return respones.body;
    } else {
      return "Error";
    }
  }
}
