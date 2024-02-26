import 'dart:convert';


import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:newlogin/model/model_member.dart';


class MemberService extends GetxController {
  final List<ProductDataModel> productdata =[];
  static const ADD_URL = "http://192.168.234.132/login/adddata.php";
  static const UPDATE_URL = "http://192.168.234.132/login/editdata.php";

  Future<String> addMember(ProductDataModel productDataModel) async {
    final respones = await http.post(
        Uri.parse(ADD_URL), body: productDataModel.toJson());
    if (respones.statusCode == 200) {
      print("ADD thành công :" + respones.body);
      return respones.body;
    }
    else {
      return "Error";
    }
  }
  Future getContactdata()async{
    var url = 'http://192.168.234.132/login/getdata.php';
    var response = await http.get(Uri.parse(url));
    return json.decode(response.body);


  }
  Future<String> updateMember(ProductDataModel productDataModel) async {
    final respones = await http.post(
        Uri.parse(UPDATE_URL), body: productDataModel.toJsonupdate());
    if (respones.statusCode == 200) {
      print("Update thành công :" + respones.body);
      return respones.body;
    }
    else {
      return "Error";
    }
  }


}