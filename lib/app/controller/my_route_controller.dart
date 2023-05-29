import 'package:get/get.dart';

class MyRouteController extends GetxController{

  final currentTab = 'Upcoming'.obs;

  final selectedSchool = 'Ignite Public School'.obs;
  final List<String> schoolItems = [
    'Ignite Public School',
    'Lucknow Public School',
    'Dubai Public School',
    'AbuDhabi Public School',
  ];


}