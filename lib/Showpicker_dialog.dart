import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/common/color_constants.dart';

Future<File?> showMediaPickerDialog(BuildContext context)async{
  File? file;
  await showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: "",
      pageBuilder: (context,a1,a2){
        return StatefulBuilder(
          builder: (context, setState) => Dialog(
            insetPadding: EdgeInsets.symmetric(horizontal: 3.w),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(14))),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 12),
                  Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(onTap: (){
                      Navigator.pop(context);
                    },
                        child: Icon(Icons.close,size: 26,)),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(child: GestureDetector(
                        onTap: () async {
                          final _choosen = await chooseCameraFile();
                          if (_choosen != null) setState(() => file = _choosen);
                          Navigator.pop(context);
                        },
                        child: Column(
                          children: [
                            Icon(Icons.camera_alt_outlined,color: ColorConstants.primaryColor,size: 60),
                            SizedBox(height: 8),
                            Text("Camera"),
                          ],
                        ),
                      )),
                      Expanded(child: GestureDetector(
                        onTap: () async {
                          final _choosen = await choosegalleryFile();
                          if (_choosen != null) setState(() => file = _choosen);
                          Navigator.pop(context);
                        },
                        child: Column(
                          children: [
                            Icon(Icons.photo_library_outlined,color: ColorConstants.primaryColor,size: 60),
                            SizedBox(height: 8),
                            Text("Gallery"),
                          ],
                        ),
                      )),
                    ],
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        );
      });
  return file;
}

Future<File?> choosegalleryFile() async {
  final imgPicker = ImagePicker();
  late XFile? _choosenFile;
  _choosenFile = await imgPicker.pickImage(source: ImageSource.gallery);
  if (_choosenFile != null) return File(_choosenFile.path);
  return null;
}
Future<File?> chooseCameraFile() async {
  final imgPicker = ImagePicker();
  late XFile? _choosenFile;
  _choosenFile =
  await imgPicker.pickImage(source: ImageSource.camera);
  if (_choosenFile != null) return File(_choosenFile.path);
  return null;
}