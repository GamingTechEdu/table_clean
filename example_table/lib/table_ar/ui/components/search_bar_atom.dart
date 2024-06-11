import 'package:flutter/material.dart';
import 'package:responsive_table_example/table_item/ui/widgets/widgets.dart';

class SearchBarAtom extends StatefulWidget {
  const SearchBarAtom({Key? key}) : super(key: key);

  @override
  State<SearchBarAtom> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBarAtom> {
  @override
  Widget build(BuildContext context) {
    return SearchBarWidget();
  }
}
