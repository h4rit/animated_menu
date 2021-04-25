import 'package:flutter/material.dart';
import 'package:swayam/home.dart';
import 'package:flutter/animation.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  bool isCollapsed = true;
  double screenHeight, screenWidth;
  AnimationController controller;
  Animation<double> scaleAnimation;
  Animation<double> menuScaleAnimation;
  Animation<Offset> slideAnimation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    scaleAnimation = Tween<double>(begin: 1, end: 0.6).animate(controller);

    slideAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0))
        .animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        leading: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(),
            ),
            Expanded(
              flex: 4,
              child: IconButton(
                icon: Icon(
                  Icons.menu,
                  color: Colors.blueGrey,
                ),
                onPressed: () {
                  setState(() {
                    if (isCollapsed)
                      controller.forward();
                    else
                      controller.reverse();
                    isCollapsed = !isCollapsed;
                  });
                },
              ),
            ),
          ],
        ),
        title: SizedBox(
          width: 120,
          child: Image.asset(
            'assets/logo.png',
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.date_range_outlined,
              color: Colors.blueGrey,
            ),
            onPressed: () {},
          ),
        ],
        toolbarHeight: 66,
      ),
      body: Stack(
        overflow: Overflow.clip,
        children: [
          Menu(context),
          Home(
            screenHeight: screenHeight,
            screenWidth: screenWidth,
            isCollapsed: isCollapsed,
            scaleAnimation: scaleAnimation,
            controller: controller,
          ),
        ],
      ),
    );
  }

  Widget Menu(context) {
    return Material(
      color: Colors.blueGrey,
      child: SlideTransition(
        position: slideAnimation,
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'dashboard',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 20),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'dashboard',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 20),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
