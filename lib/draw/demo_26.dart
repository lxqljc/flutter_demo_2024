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

  double step = 30;

  @override
  void paint(Canvas canvas, Size size) {

    canvas.translate(size.width/2, size.height/2);

    Paint paint = Paint();
    paint
      ..style = PaintingStyle.stroke
      ..strokeWidth = .5
      ..color = Colors.grey;

    Path path = Path();

    for (int i = 0; i < size.width / 2 / step; i++) {
      path.moveTo(step * i, -size.height / 2);
      path.relativeLineTo(0, size.height);
      path.moveTo(-step * i, -size.height / 2);
      path.relativeLineTo(0, size.height);
    }


    for (int i = 0; i < size.height / 2 / step; i++) {
      path.moveTo(-size.width / 2, step * i);
      path.relativeLineTo(size.width, 0);
      path.moveTo(
        -size.width / 2,
        -step * i,
      );
      path.relativeLineTo(size.width, 0);
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
