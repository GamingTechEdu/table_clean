import 'package:flutter/material.dart';

class RowActionItem extends StatelessWidget {
  const RowActionItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        color: Color(0xffd9d9d9),
      ),
      child: const DefaultTabController(
        length: 3,
        child: Row(
          children: [
          ],
        ),
      ),
    );
  }
}