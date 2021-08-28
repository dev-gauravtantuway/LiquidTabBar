import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'screen/screen1.dart';
import 'screen/screen2.dart';
import 'screen/screen3.dart';
import 'screen/screen4.dart';
import 'screen/screen5.dart';

List<Widget> screens = [
  Screen1(),
  Screen2(),
  Screen3(),
  Screen4(),
  Screen5(),
];

class LiquidTabBar extends StatefulWidget {
  @override
  LiquidTabBarState createState() => LiquidTabBarState();
}

class LiquidTabBarState extends State<LiquidTabBar>
    with TickerProviderStateMixin {

  late PageController pageCon;

  late AnimationController bottomLiquidCon;
  late Animation<double> bottomLiquidAni1;
  late Animation<double> bottomLiquidAni2;
  late Animation<double> bottomLiquidAni3;
  late Animation<double> bottomLiquidAni4;
  late Animation<double> bottomLiquidAni5;

  late AnimationController tBWidthCon;
  late Animation<double> tBWidthAni;

  late AnimationController tBHeightCon;
  late Animation<double> tBHeightAni;

  late AnimationController tBColorOpacCon;
  late Animation<double> tBColorOpacAni;

  late AnimationController transCon;
  late Animation<double> transAni;
  late Animation<double> bGCircleTransAni;

  late AnimationController triggerableCon;
  late Animation<double> triggerableAni;

  late AnimationController oneToZeroCon;
  late Animation<double> oneToZeroAnim;

  List<IconData> listOfIcons = [
    CupertinoIcons.house_alt,
    CupertinoIcons.bookmark,
    CupertinoIcons.add_circled,
    CupertinoIcons.heart,
    CupertinoIcons.person,
  ];

  List<IconData> listOfFilledIcons = [
    CupertinoIcons.house_alt_fill,
    CupertinoIcons.bookmark_fill,
    CupertinoIcons.add_circled_solid,
    CupertinoIcons.heart_fill,
    CupertinoIcons.person_fill,
  ];

  List<Color> listOfColors = [
    Color(0xffBDCBFE),
    Color(0xffFFCDFF),
    Color(0xffFFC6C1),
    Color(0xffFFE8A7),
    Color(0xff8DECA6),
  ];

  int currentColor = 0;
  int index = 0;
  int pageIndex = 0;


  void onPageChanged(int page) {
    setState(() {
      this.pageIndex = page;
    });
  }

  void onTabTapped(int index) {
    this.pageCon.animateToPage(index,
        duration: Duration(seconds: 1), curve: Curves.fastLinearToSlowEaseIn);
  }

  @override
  void initState() {
    pageCon = PageController(initialPage: pageIndex);

    tBWidthCon = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
      reverseDuration: Duration(milliseconds: 250),
    );

    tBWidthAni = Tween<double>(begin: 1, end: .85).animate(CurvedAnimation(
        parent: tBWidthCon, curve: Curves.easeOut, reverseCurve: Curves.easeIn))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          tBWidthCon.reverse();
          tBHeightCon.forward();
        }
      });

    tBHeightCon = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
      reverseDuration: Duration(milliseconds: 300),
    );

    tBHeightAni = Tween<double>(begin: 70, end: 85).animate(CurvedAnimation(
        parent: tBHeightCon, curve: Curves.easeOut, reverseCurve: Curves.ease))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          tBHeightCon.reverse();
        }
      });

    tBColorOpacCon = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
      reverseDuration: Duration(milliseconds: 350),
    );

    tBColorOpacAni = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: tBColorOpacCon,
            curve: Curves.easeOut,
            reverseCurve: Curves.ease))
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          tBColorOpacCon.reverse();
        }
      });

    transCon = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    transAni = Tween<double>(begin: 0.0, end: -85.0)
        .animate(CurvedAnimation(parent: transCon, curve: Curves.easeOutCubic))
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              oneToZeroCon.forward();
            }
          });

    bGCircleTransAni = Tween<double>(begin: 5.0, end: -75.0)
        .animate(CurvedAnimation(parent: transCon, curve: Curves.easeOutCubic))
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              oneToZeroCon.forward();
            }
          });

    triggerableCon = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
      reverseDuration: Duration(milliseconds: 300),
    );

    triggerableAni = Tween<double>(begin: 50.0, end: 0.0).animate(
        CurvedAnimation(
            parent: triggerableCon,
            curve: Curves.easeOut,
            reverseCurve: Curves.easeInCubic))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          triggerableCon.reverse();
        }
      });

    oneToZeroCon = AnimationController(
      duration: Duration(milliseconds: 200),
      vsync: this,
    );

    oneToZeroAnim = Tween<double>(begin: 1, end: 0).animate(CurvedAnimation(
      parent: oneToZeroCon,
      curve: Curves.easeIn,
    ))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          transCon.reset();
          oneToZeroCon.reverse();
        }
      });

    bottomLiquidCon = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 250),
        reverseDuration: Duration(milliseconds: 300));

    bottomLiquidAni1 = Tween<double>(begin: .5, end: 1)
        .animate(CurvedAnimation(parent: bottomLiquidCon, curve: Curves.ease))
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              bottomLiquidCon.reverse();
            }
          });

    bottomLiquidAni2 = Tween<double>(begin: .4, end: .2).animate(
      CurvedAnimation(
        parent: bottomLiquidCon,
        curve: Curves.ease,
      ),
    );

    bottomLiquidAni3 = Tween<double>(begin: .5, end: .8).animate(
      CurvedAnimation(
        parent: bottomLiquidCon,
        curve: Curves.ease,
      ),
    );

    bottomLiquidAni4 = Tween<double>(begin: .6, end: .8).animate(
      CurvedAnimation(
        parent: bottomLiquidCon,
        curve: Curves.ease,
      ),
    );

    bottomLiquidAni5 = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: bottomLiquidCon,
        curve: Curves.easeInQuad,
        reverseCurve: Curves.easeOutExpo,
      ),
    );

    super.initState();
  }

  @override
  void dispose() {
    pageCon.dispose();
    tBWidthCon.dispose();
    tBHeightCon.dispose();
    tBColorOpacCon.dispose();
    transCon.dispose();
    triggerableCon.dispose();
    oneToZeroCon.dispose();
    bottomLiquidCon.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            children: screens,
            onPageChanged: onPageChanged,
            controller: pageCon,
          ),
          IgnorePointer(
            ignoring: true,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: screenWidth * tBWidthAni.value,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      bottomLiquidWidget(0),
                      bottomLiquidWidget(1),
                      bottomLiquidWidget(2),
                      bottomLiquidWidget(3),
                      bottomLiquidWidget(4),
                    ],
                  ),
                ),
                Container(
                  height: tBHeightAni.value - 1,
                ),
              ],
            ),
          ),
          IgnorePointer(
            ignoring: true,
            child: Container(
              width: screenWidth * tBWidthAni.value,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  bGCircleWidget(0),
                  bGCircleWidget(1),
                  bGCircleWidget(2),
                  bGCircleWidget(3),
                  bGCircleWidget(4),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(30),
              ),
            ),
            child: Container(
              height: tBHeightAni.value,
              width: screenWidth * tBWidthAni.value,
              decoration: BoxDecoration(
                color: listOfColors[currentColor].withOpacity(
                  tBColorOpacAni.value,
                ),
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  tBIcons(0),
                  tBIcons(1),
                  tBIcons(2),
                  tBIcons(3),
                  tBIcons(4),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: screenWidth * tBWidthAni.value,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  tBTrigger(0),
                  tBTrigger(1),
                  tBTrigger(2),
                  tBTrigger(3),
                  tBTrigger(4),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget tBTrigger(int currentIndex) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () {
        onTabTapped(currentIndex);
        currentColor = currentIndex;
        index = currentIndex;
        tBWidthCon.forward();
        tBColorOpacCon.forward();
        transCon.reset();
        transCon.forward();
        triggerableCon.forward();
        bottomLiquidCon.forward();
      },
      child: Container(
        alignment: Alignment.center,
        height: tBHeightAni.value,
        width: index == currentIndex ? triggerableAni.value : 50,
        child: index == currentIndex
            ? SizedBox()
            : tBIconData(listOfIcons[currentIndex], 1, 1),
      ),
    );
  }

  Widget tBIcons(int currentIndex) {
    return Opacity(
      opacity: index == currentIndex ? 1 : 0,
      child: Transform.translate(
        offset: Offset(0, index == currentIndex ? transAni.value : 0),
        child: Container(
          width: 50,
          alignment: Alignment.center,
          child: AnimatedCrossFade(
            duration: Duration(milliseconds: 400),
            firstChild: tBIconData(listOfFilledIcons[currentIndex],
                oneToZeroAnim.value, (oneToZeroAnim.value)),
            secondChild: tBIconData(listOfIcons[currentIndex], 1, 1),
            crossFadeState: index == currentIndex
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
          ),
        ),
      ),
    );
  }

  Widget bGCircleWidget(int currentIndex) {
    return Transform.translate(
      offset: Offset(0, index == currentIndex ? bGCircleTransAni.value : 5),
      child: Container(
        width: 50,
        height: 75,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              width: 50 * oneToZeroAnim.value,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
            ),
            Container(
              width: 50 * oneToZeroAnim.value,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: listOfColors[currentColor].withOpacity(
                  tBColorOpacAni.value,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 25),
              child: SizedBox(
                width: 50 * oneToZeroAnim.value,
                height: 75 * oneToZeroAnim.value,
                child: CustomPaint(
                  painter: TopLiquidPainter(
                    bottomLiquidAni1.value,
                    bottomLiquidAni2.value,
                    bottomLiquidAni3.value,
                    bottomLiquidAni4.value,
                    Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 25),
              child: SizedBox(
                width: 50 * oneToZeroAnim.value,
                height: 50 * oneToZeroAnim.value,
                child: CustomPaint(
                  painter: TopLiquidPainter(
                    bottomLiquidAni1.value,
                    bottomLiquidAni2.value,
                    bottomLiquidAni3.value,
                    bottomLiquidAni4.value,
                    listOfColors[currentColor].withOpacity(
                      tBColorOpacAni.value,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget tBIconData(IconData icon, double size, double opacity) {
    return Icon(
      icon,
      size: 28 * size,
      color: Colors.black.withOpacity(opacity),
    );
  }

  Widget bottomLiquidWidget(int currentIndex) {
    return Container(
      width: 50,
      alignment: Alignment.bottomCenter,
      child: Stack(
        children: [
          Container(
            width: 35,
            height: 20,
            child: CustomPaint(
              painter: BottomLiquidPainter(
                bottomLiquidAni5.value,
                index == currentIndex ? Colors.white : Colors.transparent,
              ),
            ),
          ),
          Container(
            width: 35,
            height: 20,
            child: CustomPaint(
              painter: BottomLiquidPainter(
                index == currentIndex ? bottomLiquidAni5.value : 1,
                listOfColors[currentColor].withOpacity(
                  tBColorOpacAni.value,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TopLiquidPainter extends CustomPainter {
  final double _height1;
  final double _width1;
  final double _height2;
  final double _width2;
  final Color _color;

  TopLiquidPainter(
    this._height1,
    this._width1,
    this._height2,
    this._width2,
    this._color,
  );

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = _color
      ..style = PaintingStyle.fill;

    var path = Path()
      ..moveTo(0, 0)
      ..cubicTo(
        0,
        size.height * .4,
        size.width * _width1,
        size.height * _height2,
        size.width * .5,
        size.height * _height1,
      )
      ..cubicTo(
        size.width * _width2,
        size.height * _height2,
        size.width,
        size.height * .4,
        size.width,
        0,
      );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class BottomLiquidPainter extends CustomPainter {
  final double _height;
  final Color _color;

  BottomLiquidPainter(this._height, this._color);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = _color
      ..style = PaintingStyle.fill;

    var path = Path()
      ..moveTo(0, size.height)
      ..cubicTo(
        size.width * .7,
        size.height * _height,
        size.width * .3,
        size.height * _height,
        size.width,
        size.height,
      );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
