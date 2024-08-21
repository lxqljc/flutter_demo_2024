/// 作者: xiaoquanluo
/// 日期: 2024/8/13
/// 描述: 绘制圆形

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
    paint
      ..color = Colors.blue
      ..strokeWidth = 1.5;

    canvas.translate(size.width / 2, size.height / 2);

    //【1】.圆角矩形fromRectXY构造
    Rect rectFromCenter =
        Rect.fromCenter(center: const Offset(0, 0), width: 160, height: 160);
    canvas.drawRRect(RRect.fromRectXY(rectFromCenter, 40, 20), paint);

    //【2】.圆角矩形fromRectXY构造
    Rect rectFromLTRB = const Rect.fromLTRB(-120, -120, -80, -80);
    canvas.drawRRect(
        RRect.fromRectXY(rectFromLTRB, 40, 20), paint..color = Colors.red);

    //【3】.圆角矩形fromRectXY构造
    Rect rectFromLTRB2 = const Rect.fromLTRB(120, -120, 80, -80);
    canvas.drawRRect(
        RRect.fromRectXY(rectFromLTRB2, 40, 20), paint..color = Colors.orange);

    //【4】.圆角矩形fromRectXY构造
    canvas.drawRRect(
        RRect.fromLTRBAndCorners(
          120,
          120,
          80,
          80,
          bottomRight: const Radius.elliptical(10, 10),
        ),
        paint..color = Colors.green);

    //【5】.圆角矩形fromRectXY构造
    canvas.drawRRect(
        RRect.fromLTRBAndCorners(
          -120,
          120,
          -80,
          80,
          bottomLeft: const Radius.elliptical(10, 10),
        ),
        paint..color = Colors.yellow);

    //【5】. 矩形两点构造
    Rect rectFromPoints =
        Rect.fromPoints(const Offset(120, 80), const Offset(80, 120));
    canvas.drawRRect(
        RRect.fromRectAndCorners(rectFromPoints,
            bottomLeft: const Radius.elliptical(10, 10)),
        paint..color = Colors.purple);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
