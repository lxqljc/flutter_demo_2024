/// 作者: xiaoquanluo
/// 日期: 2024/8/13
/// 描述: 绘制圆形

import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:flutter/services.dart';

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
class Paper extends StatefulWidget {
  const Paper({super.key});

  @override
  State<Paper> createState() => _PaperState();
}

class _PaperState extends State<Paper> {
  ui.Image? _image;

  @override
  Widget build(BuildContext context) {
    return _image == null
        ? Container()
        : Container(
            color: Colors.white,
            child: CustomPaint(
              painter: PaperPainter(context, _image!),
            ),
          );
  }

  @override
  void initState() {
    super.initState();
    loadImageFromAssets();
  }

  Future<void> loadImageFromAssets() async {
    final ByteData data = await rootBundle.load('assets/images/animal.png');
    final Uint8List bytes = data.buffer.asUint8List();

    ui.decodeImageFromList(bytes, (ui.Image img) {
      setState(() {
        _image = img;
      });
    });
  }
}

class PaperPainter extends CustomPainter {
  PaperPainter(this.context, this.image);

  BuildContext context;

  final ui.Image image;

  Paint paint1 = Paint();

  @override
  void paint(Canvas canvas, Size size) {
    // 将图像绘制到画布上
    canvas.translate(
        (size.width - image.width) / 2, (size.height - image.height) / 2);
    canvas.drawImage(image, Offset.zero, paint1);
    _drawImageRect(canvas);
  }

  void _drawImageRect(Canvas canvas) {
    canvas.drawImageRect(
      image,
      Rect.fromCenter(
        center: Offset(image.width / 2, image.height / 2),
        width: 60,
        height: 60,
      ),
      const Rect.fromLTRB(0, 0, 100, 100).translate(100, -150),
      paint1,
    );

    canvas.drawImageRect(
        image,
        Rect.fromCenter(
            center: Offset(image.width / 2, image.height / 2 - 60),
            width: 60,
            height: 60),
        const Rect.fromLTRB(0, 0, 100, 100).translate(100, -200),
        paint1);
    //
    // canvas.drawImageRect(
    //     image,
    //     Rect.fromCenter(
    //         center: Offset(image.width / 2 + 60, image.height / 2),
    //         width: 60,
    //         height: 60),
    //     Rect.fromLTRB(0, 0, 100, 100).translate(-280, 50),
    //     paint1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
