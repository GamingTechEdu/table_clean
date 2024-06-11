import 'package:flutter/material.dart';

import '../widgets/search_bar_widget.dart';


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
