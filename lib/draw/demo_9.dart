/// 作者: xiaoquanluo
/// 日期: 2024/8/13
/// 描述: 绘制圆形

import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // 确定初始化
  // SystemChrome.setPreferredOrientations(// 使设备横屏显示
  //     [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);

  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive,
  //     overlays: []); // 全屏显示

  runApp(
    const MaterialApp(
      home: SafeArea(child: Paper()),
    ),
  );
}

/// 纸张
class Paper extends StatelessWidget {
  const Paper({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: CustomPaint(
        painter: PaperPainter(context),
      ),
    );
  }
}

class PaperPainter extends CustomPainter {
  PaperPainter(this.context);

  BuildContext context;

  final int rows = 50;
  final int colums = 25;

  @override
  void paint(Canvas canvas, Size size) {
    // 创建画笔
    final Paint paint = Paint();
    paint.color = Colors.grey;

    // 横线
    for (int i = 0; i < rows; i++) {
      double slice = size.height / rows;
      slice *= i;
      canvas.drawLine(Offset(0, slice), Offset(size.width, slice), paint);
    }

    // 竖线
    for (int i = 0; i < colums; i++) {
      double slice = size.width / colums;
      slice *= i;
      canvas.drawLine(Offset(slice, 0), Offset(slice, size.height), paint);
    }

    paint
      ..color = Colors.blue
      ..strokeWidth = 1.5;

    canvas.save();
    canvas.translate(size.width / 2, size.height / 2);
    // 从中心画矩形
    Rect rectFromCenter =
        Rect.fromCenter(center: const Offset(0, 0), width: 160, height: 160);
    canvas.drawRect(rectFromCenter, paint);
    //【2】.矩形左上右下构造
    // Rect rectFromLTRB = const Rect.fromLTRB(-120, -120, -80, -80);
    Rect rectFromLTRB = const Rect.fromLTRB(-80, -80, -110, -110);
    canvas.drawRect(rectFromLTRB, paint..color = Colors.red);

    //【3】.矩形左上右下构造
    Rect rectFromLTRB2 = const Rect.fromLTRB(110, -110, 80, -80);
    canvas.drawRect(rectFromLTRB2, paint..color = Colors.red);

    //【4】.矩形左上右下构造
    Rect rectFromLTRB4 = const Rect.fromLTRB(110, 110, 80, 80);
    canvas.drawRect(rectFromLTRB4, paint..color = Colors.red);

    //【5】.矩形左上右下构造
    Rect rectFromLTRB5 = const Rect.fromLTRB(-110, 110, -80, 80);
    canvas.drawRect(rectFromLTRB5, paint..color = Colors.red);

    canvas.restore();

    // 画箭头
    paint.color = Colors.black;

    // 画数轴
    canvas.drawLine(
        Offset(size.width / 2, 0), Offset(size.width / 2, size.height), paint);
    canvas.drawLine(
        Offset(0, size.height / 2), Offset(size.width, size.height / 2), paint);

    Offset point1 = Offset(size.width / 2, size.height);
    Offset point2 = Offset(size.width / 2 - 20, size.height - 20);
    canvas.drawPoints(PointMode.polygon, [point1, point2], paint);

    Offset point4 = Offset(size.width / 2 + 20, size.height - 20);
    canvas.drawPoints(PointMode.polygon, [point1, point4], paint);

    Offset point5 = Offset(size.width, size.height / 2);
    Offset point6 = Offset(size.width - 20, size.height / 2 - 20);
    canvas.drawPoints(PointMode.polygon, [point5, point6], paint);

    Offset point8 = Offset(size.width - 20, size.height / 2 + 20);
    canvas.drawPoints(PointMode.polygon, [point5, point8], paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
