/// 作者: xiaoquanluo
/// 日期: 2024/8/13
/// 描述: 绘制圆形

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

  // 创建画笔
  final Paint paint1 = Paint();

  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(size.width / 2 - 150, size.height / 2);
    _drawTextWithParagraph(canvas, TextAlign.center);
  }

  void _drawTextWithParagraph(Canvas canvas, TextAlign textAlign) {
    var builder = ui.ParagraphBuilder(ui.ParagraphStyle(
      textAlign: textAlign,
      fontSize: 40,
      textDirection: TextDirection.ltr,
      maxLines: 1,
    ));
    builder.pushStyle(
      ui.TextStyle(
          color: Colors.black87, textBaseline: ui.TextBaseline.alphabetic),
    );
    builder.addText("Hello World");
    ui.Paragraph paragraph = builder.build();
    paragraph.layout(const ui.ParagraphConstraints(width: 300));
    canvas.drawParagraph(paragraph, const Offset(0, 0));
    canvas.drawRect(
      const Rect.fromLTRB(0, 0, 300, 40),
      paint1..color = Colors.blue.withAlpha(33),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
