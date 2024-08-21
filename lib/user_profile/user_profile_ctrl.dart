import 'package:get/get.dart';
import 'package:random_user_generator/classes/user_class.dart';
import 'package:random_user_generator/request_handler.dart';

class UserProfileCtrl extends GetxController{
  late Future<User> futureUser;
  var count = 0.obs;
  increment() => count++;


  @override
  void onInit() {
    super.onInit();
    futureUser =  fetchRandomUser();

  }

}