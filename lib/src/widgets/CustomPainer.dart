import 'package:flutter/material.dart';

class CurvaCustom extends StatelessWidget {
  const CurvaCustom({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      //color: Color(0xffEF6C00), //Naranja: 0xffEF6C00; //Verde: 0xff008651
      child: CustomPaint(
      painter: _CurvaPainter(),
      ),
    );
  }
}

class _CurvaPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    
    final lapiz = Paint();

    //propiedades
    lapiz.color = Color(0xffEF6C00);
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 5.0;

    final path = new Path();

    //dibujar con el path y el lapiz
    path.moveTo(size.width, size.height * 0.5);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.moveTo(size.width, size.height * 0.5);
    path.lineTo(0, size.height);
    path.quadraticBezierTo(size.width * 0.95, size.height * 0.95, size.width, size.height * 0.5);

    canvas.drawPath(path,lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}


class CurvaCustomV extends StatelessWidget {
  const CurvaCustomV({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      //color: Color(0xffEF6C00), //Naranja: 0xffEF6C00; //Verde: 0xff008651
      child: CustomPaint(
      painter: _CurvaPainterV(),
      ),
    );
  }
}

class _CurvaPainterV extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    
    final lapiz = Paint();

    //propiedades
    lapiz.color = Color(0xff008651);
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 5.0;

    final path = new Path();

    //dibujar con el path y el lapiz
    path.moveTo(size.width, size.height * 0.7);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.moveTo(size.width, size.height * 0.7);
    path.lineTo(0, size.height);
    path.quadraticBezierTo(size.width * 0.95, size.height * 1, size.width, size.height * 0.7);

    canvas.drawPath(path,lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}