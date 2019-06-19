import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 130,
              decoration: BoxDecoration(color: Colors.green),
            ),
          ),
          Positioned(
            top: 40,
            left: 30,
            right: 30,
            bottom: 0,
            child: Container(
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Icon(MdiIcons.arrowLeft),
                      Text("Routes"),
                      Icon(MdiIcons.bell)
                    ],
                  ), 
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [
                    0.0,
                    0.5,
                    0.9
                  ],
                      colors: [
                    Colors.white.withOpacity(0.1),
                    Colors.white.withOpacity(0.8),
                    Colors.white,
                  ])),
            ),
          ),
          Positioned(
            bottom: 35,
            left: 0,
            right: 0,
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  iconBottomBar(
                    MdiIcons.accessPoint,
                    selected: true,
                  ),
                  iconBottomBar(
                    MdiIcons.accessPoint,
                  ),
                  Container(
                    width: 55,
                    height: 55,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            stops: [0.0, 0.7],
                            colors: [Color(0x88FF9163), Color(0xffFF6734)])),
                    child: LayoutBuilder(
                      builder: (context, constraint) {
                        return Stack(
                          children: <Widget>[
                            Positioned(
                                top: 0,
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: CustomPaint(
                                    painter: LineDashedPainter(
                                        height: constraint.maxHeight,
                                        padding: 7.0,
                                        width: constraint.maxWidth)))
                          ],
                        );
                      },
                    ),
                  ),
                  iconBottomBar(
                    MdiIcons.accessPoint,
                  ),
                  iconBottomBar(
                    MdiIcons.accessPoint,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }

  Widget iconBottomBar(icon, {bool selected = false}) {
    return Icon(
      icon,
      color: (selected) ? Color(0xFF00C180) : Color(0xFFBFCBD5),
      size: 30,
    );
  }
}

class LineDashedPainter extends CustomPainter {
  final height;
  final width;
  final padding;

  LineDashedPainter({this.height, this.width, this.padding = 0});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()..color = Colors.white;
    var max = width - (padding * 2);
    var dashWidth = 5;
    var dashSpace = 5;
    double startY = size.height / 2;
    double startX = 0 + padding;
    while (max >= 0) {
      canvas.drawCircle(Offset(startX, startY), 2.0, paint);
      final space = (dashSpace + dashWidth);
      startX += space;
      max -= space;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}
