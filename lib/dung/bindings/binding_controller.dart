import 'package:get/get.dart';
import 'package:newlogin/dung/controller/member_controller.dart';



class ControllerDetail extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MemberService());
  }
}