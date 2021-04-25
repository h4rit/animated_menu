import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:swayam/body_widget.dart';
import 'package:swayam/constants.dart';
import 'package:swayam/slide_widget.dart';

class Home extends StatelessWidget {
  bool isCollapsed = true;
  double screenHeight, screenWidth;
  AnimationController controller;
  Animation<double> scaleAnimation;
  Home({
    this.isCollapsed,
    this.screenWidth,
    this.screenHeight,
    this.controller,
    this.scaleAnimation,
  });
  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 300),
      top: 0.0,
      bottom: 0.0,
      left: isCollapsed ? 0.0 : 0.6 * screenWidth,
      right: isCollapsed ? 0.0 : -0.4 * screenWidth,
      child: ScaleTransition(
        scale: scaleAnimation,
        child: ListView(
          children: [
            Material(
              elevation: 10,
              animationDuration: Duration(milliseconds: 100),
              borderRadius:
                  !isCollapsed ? BorderRadius.all(Radius.circular(10)) : null,
              child: Container(
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/mumbai.PNG',
                      width: double.infinity,
                      color: Colors.grey[700],
                      colorBlendMode: BlendMode.darken,
                    ),
                    CarouselSlider(
                      options: CarouselOptions(
                        height: 200,
                        enlargeCenterPage: true,
                        autoPlay: true,
                        aspectRatio: 4 / 3,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enableInfiniteScroll: true,
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        viewportFraction: 0.85,
                      ),
                      items: [
                        SlideWidget(text: 'Do you want complete transparency?'),
                        SlideWidget(
                            text:
                                'Do you want to keep Complete Control of Redevelopment process?'),
                        SlideWidget(
                            text:
                                'Do you want to avail Maximum benefits from self redevelopment?'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Material(
              child: Column(
                children: [
                  BodyText(
                    titleText: 'About Self-Redevelopment',
                    bodyText: kBodyText1,
                  ),
                  BodyText(
                    titleText: 'About Self-Redevelopment',
                    bodyText: kBodyText1,
                  ),
                  BodyText(
                    titleText: 'About Self-Redevelopment',
                    bodyText: kBodyText1,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
