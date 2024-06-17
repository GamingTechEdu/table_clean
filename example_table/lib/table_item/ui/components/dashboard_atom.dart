import 'package:flutter/material.dart';

class DashboardAtom extends StatelessWidget {
  final String label;
  final Color? color;
  final Color? colorInternal;
  final double? fontSize;
  const DashboardAtom({
    Key? key,
    required this.label,
    this.color,
    this.fontSize,
    this.colorInternal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Container(
        alignment: Alignment.center,
        width: 120,
        height: 20,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: colorInternal,
        ),
        child: Text(
          label,
          style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: color,
      ),
      width: 150,
      height: 30,
    );
  }
}
