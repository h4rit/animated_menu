import 'package:flutter/material.dart';
import 'constants.dart';

class SlideWidget extends StatelessWidget {
  final String text;
  SlideWidget({this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Text(
            text,
            style: kLabelTextStyle,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
