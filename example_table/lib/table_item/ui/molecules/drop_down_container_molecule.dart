import 'package:flutter/material.dart';

class DropDownContainer extends StatelessWidget {
  final Map<String, dynamic> data;
  const DropDownContainer({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> _children = data.entries.map<Widget>((entry) {
      Widget w = Row(
        children: [
          Text(entry.key.toString()),
          Spacer(),
          Text(entry.value.toString()),
        ],
      );
      return w;
    }).toList();

    return Container(
      child: Column(
        children: _children,
      ),
    );
  }
}
