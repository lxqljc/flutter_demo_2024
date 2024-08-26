/// 作者: xiaoquanluo
/// 日期: 2024/8/13
/// 描述: 绘制圆形

import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:ui' as ui;

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
    Paint paint = Paint();
    var colors = [
      const Color(0xFFF60C0C),
      const Color(0xFFF3B913),
      const Color(0xFFE7F716),
      const Color(0xFF3DF30B),
      const Color(0xFF0DF6EF),
      const Color(0xFF0829FB),
      const Color(0xFFB709F4),
    ];
    var pos = [1.0 / 7, 2.0 / 7, 3.0 / 7, 4.0 / 7, 5.0 / 7, 6.0 / 7, 1.0];
    paint.shader = ui.Gradient.linear(
        const Offset(0, 0), Offset(size.width, 0), colors, pos, TileMode.clamp);
    paint.blendMode = BlendMode.lighten;
    canvas.drawPaint(paint);

    // var rect =
    // Rect.fromCenter(center: const Offset(0, 0), height: 100, width: 120);
    // canvas.save();
    // canvas.translate(100, 500);
    // //drawArc(矩形区域,起始弧度,扫描弧度,是否连中心,画笔)
    // canvas.drawArc(rect, 0, pi / 2 * 3, true, paint);
    // canvas.restore();

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
