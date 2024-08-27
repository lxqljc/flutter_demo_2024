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
    canvas.translate(size.width / 2, size.height / 2);

    Paint paint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.relativeMoveTo(0, 0);
    path.relativeLineTo(100, 120);
    path.relativeLineTo(-10, -60);
    path.relativeLineTo(60, -10);
    path.close();

    canvas.drawPath(path, paint);

    path.reset();

    paint
      ..style = PaintingStyle.stroke
      ..color = Colors.green
      ..strokeWidth = 2;

    path.relativeMoveTo(-150, 0);
    path.relativeLineTo(100, 120);
    path.relativeLineTo(-10, -60);
    path.relativeLineTo(60, -10);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
