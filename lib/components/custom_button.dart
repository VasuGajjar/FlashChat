import 'package:flutter/material.dart';

class ColoredButton extends StatelessWidget {
  Color color;
  String text;
  String tag;
  Function onPress;

  ColoredButton(this.text, {this.color, this.onPress, this.tag});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tag,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: Material(
          elevation: 5.0,
          color: color,
          borderRadius: BorderRadius.circular(30.0),
          child: MaterialButton(
            onPressed: onPress,
            minWidth: 200.0,
            height: 42.0,
            child: Text(
              text,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
