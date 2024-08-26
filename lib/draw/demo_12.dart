/// 作者: xiaoquanluo
/// 日期: 2024/8/13
/// 描述: 绘制圆形

import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // 确定初始化
  // SystemChrome.setPreferredOrientations(// 使设备横屏显示
  //     [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);

  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive,
  //     overlays: []); // 全屏显示

  runApp(
    const MaterialApp(
      home: Paper(),
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

  @override
  void paint(Canvas canvas, Size size) {
    // 创建画笔
    final Paint paint = Paint();
    paint.color = Colors.blue;

    canvas.save();
    canvas.translate(100, 100);
    canvas.drawCircle(const Offset(0, 0), 60, paint);
    canvas.restore();

    canvas.save();
    canvas.translate(100, 230);
    var rect =
        Rect.fromCenter(center: const Offset(0, 0), height: 100, width: 120);
    canvas.drawOval(rect, paint);
    canvas.restore();

    canvas.save();
    canvas.translate(100, 350);
    //drawArc(矩形区域,起始弧度,扫描弧度,是否连中心,画笔)
    canvas.drawArc(rect, 0, pi / 2 * 3, true, paint);
    canvas.restore();

    canvas.save();
    canvas.translate(100, 500);
    //drawArc(矩形区域,起始弧度,扫描弧度,是否连中心,画笔)
    canvas.drawArc(rect, 0, pi / 2 * 3, false, paint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
