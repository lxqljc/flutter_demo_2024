/// 作者: xiaoquanluo
/// 日期: 2024/8/13
/// 描述: 绘制圆形

import 'dart:typed_data';
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
    canvas.save();
    canvas.translate(size.width / 4, size.height / 4);
    final List<Offset> points = [
      const Offset(-120, -20),
      const Offset(-80, -80),
      const Offset(-40, -40),
      const Offset(0, -100),
      const Offset(40, -140),
      const Offset(80, -160),
      const Offset(120, -100),
    ];

    // 创建画笔
    final Paint paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round;

    // 点模式
    canvas.drawPoints(PointMode.points, points, paint);
    paint.strokeWidth = 2;
    canvas.drawPoints(PointMode.polygon, points, paint);
    canvas.restore();

    canvas.save();
    paint.strokeWidth = 1;
    canvas.translate(size.width / 2, size.height / 2);
    // 线模式（两个点连接到一起）
    canvas.drawPoints(PointMode.lines, points, paint);
    canvas.restore();

    canvas.save();
    paint.strokeWidth = 1;
    canvas.translate(size.width / 1.5, size.height / 1.5);
    // 线模式（连接所有点的线）
    canvas.drawPoints(PointMode.polygon, points, paint);
    canvas.restore();

    // 线并且保持连接点。
    canvas.save();
    canvas.translate(size.width / 1.2, size.height / 1.2);
    paint
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round;
    Float32List pos = Float32List.fromList([
      -120,
      -20,
      -80,
      -80,
      -40,
      -40,
      0,
      -100,
      40,
      -140,
      80,
      -160,
      120,
      -100
    ]);
    canvas.drawRawPoints(PointMode.points, pos, paint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
