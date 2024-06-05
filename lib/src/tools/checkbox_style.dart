import 'package:flutter/material.dart';

class CheckboxStyle {
  final OutlinedBorder? shape;
  final MaterialStateProperty<Color?>? overlayColor;
  final Color? activeColor;
  final Color? checkColor;
  final BorderSide? side;
  final bool? value;
  final Function(bool?)? onChanged;

  CheckboxStyle({
    this.value,
    this.onChanged,
    this.checkColor,
    this.shape,
    this.overlayColor,
    this.activeColor,
    this.side,
  });
}
