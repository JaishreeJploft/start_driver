import 'dart:io';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stardriver/app/modules/wallet/sub_pages/purchase/add_money_dialogs/delete_dialog.dart';
import 'package:stardriver/common/app_header.dart';
import 'package:stardriver/common/color_constants.dart';
import 'package:stardriver/common/utils.dart';

class ScanQrCodeScreen extends StatefulWidget {
  const ScanQrCodeScreen({Key? key}) : super(key: key);

  @override
  State<ScanQrCodeScreen> createState() => _ScanQrCodeScreenState();
}

class _ScanQrCodeScreenState extends State<ScanQrCodeScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  bool? flashOn = false;
  Barcode? result;
  QRViewController? controller;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid && controller != null) {
      controller!.pauseCamera();
    } else if (Platform.isIOS && controller != null) {
      controller!.resumeCamera();
    }
  }

  _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        controller.dispose();
        Get.log("object::${result!.code}");
      });
    });
    controller.pauseCamera();
    controller.resumeCamera();
  }

  @override
  void dispose() {
    super.dispose();
    controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(7.h),
            child: AppHeader(
              showBackIcon: true,
              title: 'QR Scanner',
            )),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  height: 230,
                  width: 230,
                  margin: const EdgeInsets.all(5),
                  child: QRView(
                    key: qrKey,
                    onQRViewCreated: _onQRViewCreated,
                    overlay: QrScannerOverlayShape(
                        borderColor: ColorConstants.primaryColor,
                        borderRadius: 12,
                        borderLength: 30,
                        borderWidth: 10,
                        overlayColor: ColorConstants.white),
                  ),
                ),
                Positioned(
                    bottom: 0,
                    top: 0,
                    left: 0,
                    right: 0,
                    child: SvgPicture.asset(
                      'assets/images/sos_scan_success.svg',
                      width: 230,
                    ),
                ),
              ],
            ),
            SizedBox(
              height: 5.h,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 32),
              decoration: getEditTextDecoration(),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: getBorderRadius(),
                      border: Border.all(color: ColorConstants.primaryColor),
                    ),
                    child: SvgPicture.asset(
                      'assets/images/student.svg',
                      height: getLargeTextFontSIze() * 1.5,
                    ),
                  ),
                  SizedBox(
                    width: 1.5.h,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      addText("Saniya", getNormalTextFontSIze(),
                          ColorConstants.black, FontWeight.w700),
                      addText("#455285", getNormalTextFontSIze(),
                          ColorConstants.primaryColor, FontWeight.w700),
                    ],
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: (){
                      Get.dialog(const DeleteDialog(message: 'Are you sure you want to delete this Student?'));
                    },
                    child: SvgPicture.asset(
                      'assets/images/ic_delete.svg',
                      height: getLargeTextFontSIze(),
                    ),
                  ),
                  SizedBox(
                    width: 1.4.h,
                  ),
                ],
              ),
            )
            // SizedBox(height: 40.h,),
          ],
        ));
  }
}
