import 'package:flutter/material.dart';

class DashboardAtom extends StatelessWidget {
  final String label;
  const DashboardAtom({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(label,  style: TextStyle(fontSize: 40)),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Color(0xFFD9D9D9)),
      width: 300,
      height: 100,
    );
  }
}
