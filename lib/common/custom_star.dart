import 'dart:ui' as ui;

import 'package:flutter/material.dart';



//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter extends CustomPainter {

  final Color? bgColor;

  // RPSCustomPainter({this.color});
  const RPSCustomPainter({this.bgColor});

@override
void paint(Canvas canvas, Size size) {

Path path_0 = Path();
path_0.moveTo(size.width*0.5329833,size.height*0.03852375);
path_0.lineTo(size.width*0.6531833,size.height*0.2936575);
path_0.cubicTo(size.width*0.6557858,size.height*0.2992800,size.width*0.6597308,size.height*0.3041758,size.width*0.6646725,size.height*0.3079133);
path_0.cubicTo(size.width*0.6696133,size.height*0.3116508,size.width*0.6753983,size.height*0.3141158,size.width*0.6815167,size.height*0.3150908);
path_0.lineTo(size.width*0.9511667,size.height*0.3561408);
path_0.cubicTo(size.width*0.9581833,size.height*0.3574117,size.width*0.9647167,size.height*0.3605717,size.width*0.9700667,size.height*0.3652800);
path_0.cubicTo(size.width*0.9754167,size.height*0.3699892,size.width*0.9793917,size.height*0.3760675,size.width*0.9815417,size.height*0.3828633);
path_0.cubicTo(size.width*0.9837000,size.height*0.3896583,size.width*0.9839583,size.height*0.3969125,size.width*0.9823000,size.height*0.4038450);
path_0.cubicTo(size.width*0.9806333,size.height*0.4107775,size.width*0.9771167,size.height*0.4171258,size.width*0.9721167,size.height*0.4222075);
path_0.lineTo(size.width*0.7763500,size.height*0.6221075);
path_0.cubicTo(size.width*0.7720308,size.height*0.6265658,size.width*0.7688183,size.height*0.6319742,size.width*0.7669683,size.height*0.6378992);
path_0.cubicTo(size.width*0.7651192,size.height*0.6438242,size.width*0.7646842,size.height*0.6501008,size.width*0.7657000,size.height*0.6562242);
path_0.lineTo(size.width*0.8118333,size.height*0.9378917);
path_0.cubicTo(size.width*0.8131925,size.height*0.9448917,size.width*0.8125458,size.height*0.9521417,size.width*0.8099675,size.height*0.9587917);
path_0.cubicTo(size.width*0.8073892,size.height*0.9654500,size.width*0.8029842,size.height*0.9712417,size.width*0.7972592,size.height*0.9755000);
path_0.cubicTo(size.width*0.7915350,size.height*0.9797583,size.width*0.7847233,size.height*0.9823167,size.width*0.7776100,size.height*0.9828750);
path_0.cubicTo(size.width*0.7704958,size.height*0.9834333,size.width*0.7633692,size.height*0.9819750,size.width*0.7570500,size.height*0.9786583);
path_0.lineTo(size.width*0.5168667,size.height*0.8464083);
path_0.cubicTo(size.width*0.5114500,size.height*0.8434167,size.width*0.5053633,size.height*0.8418417,size.width*0.4991750,size.height*0.8418417);
path_0.cubicTo(size.width*0.4929867,size.height*0.8418417,size.width*0.4868992,size.height*0.8434167,size.width*0.4814833,size.height*0.8464083);
path_0.lineTo(size.width*0.2412833,size.height*0.9786917);
path_0.cubicTo(size.width*0.2349633,size.height*0.9820083,size.width*0.2278367,size.height*0.9834667,size.width*0.2207233,size.height*0.9829083);
path_0.cubicTo(size.width*0.2136092,size.height*0.9823500,size.width*0.2067983,size.height*0.9797917,size.width*0.2010733,size.height*0.9755333);
path_0.cubicTo(size.width*0.1953492,size.height*0.9712750,size.width*0.1909442,size.height*0.9654833,size.width*0.1883658,size.height*0.9588250);
path_0.cubicTo(size.width*0.1857875,size.height*0.9521750,size.width*0.1851408,size.height*0.9449250,size.width*0.1865000,size.height*0.9379250);
path_0.lineTo(size.width*0.2326333,size.height*0.6562575);
path_0.cubicTo(size.width*0.2336483,size.height*0.6501342,size.width*0.2332142,size.height*0.6438575,size.width*0.2313642,size.height*0.6379325);
path_0.cubicTo(size.width*0.2295150,size.height*0.6320075,size.width*0.2263017,size.height*0.6265992,size.width*0.2219833,size.height*0.6221408);
path_0.lineTo(size.width*0.02621642,size.height*0.4222075);
path_0.cubicTo(size.width*0.02121633,size.height*0.4171258,size.width*0.01769642,size.height*0.4107775,size.width*0.01603558,size.height*0.4038450);
path_0.cubicTo(size.width*0.01437467,size.height*0.3969125,size.width*0.01463567,size.height*0.3896583,size.width*0.01679050,size.height*0.3828633);
path_0.cubicTo(size.width*0.01894525,size.height*0.3760675,size.width*0.02291233,size.height*0.3699892,size.width*0.02826458,size.height*0.3652800);
path_0.cubicTo(size.width*0.03361692,size.height*0.3605717,size.width*0.04015192,size.height*0.3574117,size.width*0.04716642,size.height*0.3561408);
path_0.lineTo(size.width*0.3168167,size.height*0.3150908);
path_0.cubicTo(size.width*0.3229350,size.height*0.3141158,size.width*0.3287200,size.height*0.3116508,size.width*0.3336608,size.height*0.3079133);
path_0.cubicTo(size.width*0.3386017,size.height*0.3041758,size.width*0.3425475,size.height*0.2992800,size.width*0.3451500,size.height*0.2936575);
path_0.lineTo(size.width*0.4653500,size.height*0.03852375);
path_0.cubicTo(size.width*0.4682867,size.height*0.03201492,size.width*0.4730400,size.height*0.02649200,size.width*0.4790383,size.height*0.02261783);
path_0.cubicTo(size.width*0.4850367,size.height*0.01874367,size.width*0.4920258,size.height*0.01668292,size.width*0.4991667,size.height*0.01668292);
path_0.cubicTo(size.width*0.5063075,size.height*0.01668292,size.width*0.5132958,size.height*0.01874367,size.width*0.5192950,size.height*0.02261783);
path_0.cubicTo(size.width*0.5252933,size.height*0.02649200,size.width*0.5300458,size.height*0.03201492,size.width*0.5329833,size.height*0.03852375);
path_0.close();

Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
paint_0_fill.color = bgColor ?? Color(0xffC19444).withOpacity(1.0);
canvas.drawPath(path_0,paint_0_fill);

}

@override
bool shouldRepaint(covariant CustomPainter oldDelegate) {
return true;
}
}