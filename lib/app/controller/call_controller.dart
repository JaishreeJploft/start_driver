import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CallController extends GetxController{

  final isAudioCallMuted = false.obs;
  final isAudioCallOnSpeaker = false.obs;


  final isVideoCallMuted = false.obs;
  final isVideoCallOnSpeaker = false.obs;
  final isVideoEnabled = true.obs;
  var buttonWidth = 15.w;

}