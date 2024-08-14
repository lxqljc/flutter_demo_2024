/// 作者: xiaoquanluo
/// 日期: 2024/8/13
/// 描述: 绘制圆形

import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // 确定初始化
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
        painter: PathPainter(context),
      ),
    );
  }
}

class PathPainter extends CustomPainter {
  PathPainter(this.context);

  BuildContext context;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.red
      ..strokeWidth = 4
    ..style = PaintingStyle.stroke;
    Path path = Path();
    path.moveTo(100, 100);
    path.lineTo(200, 200);
    // path.lineTo(200, 50);
    canvas.drawPath(path, paint);

    Path path1 = Path();
    path1.moveTo(200, 200);
    path1.lineTo(320, 100);
    paint.color = Colors.blue;
    canvas.drawPath(path1, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
