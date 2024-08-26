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
    Paint paint = Paint();
    paint.color = Colors.blue;
    paint.strokeWidth = 1.5;

    canvas.translate(size.width / 2, size.height / 2);

    Rect outRect =
        Rect.fromCenter(center: const Offset(0, 0), width: 160, height: 160);
    Rect inRect =
        Rect.fromCenter(center: const Offset(0, 0), width: 100, height: 100);
    canvas.drawDRRect(RRect.fromRectXY(outRect, 20, 20),
        RRect.fromRectXY(inRect, 20, 20), paint);

    Rect outRect2 =
        Rect.fromCenter(center: const Offset(0, 0), width: 60, height: 60);
    Rect inRect2 =
        Rect.fromCenter(center: const Offset(0, 0), width: 40, height: 40);
    canvas.drawDRRect(RRect.fromRectXY(outRect2, 15, 15),
        RRect.fromRectXY(inRect2, 10, 10), paint..color = Colors.green);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
