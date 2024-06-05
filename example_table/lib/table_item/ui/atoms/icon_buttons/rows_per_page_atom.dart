import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../presentation/presenters/getx_table_presenter.dart';

class RowsPerPageAtom extends StatefulWidget {
  const RowsPerPageAtom({Key? key}) : super(key: key);

  @override
  State<RowsPerPageAtom> createState() => _RowsPerPageAtomState();
}

class _RowsPerPageAtomState extends State<RowsPerPageAtom> {
  final GetxTablePresenter controller = Get.put(GetxTablePresenter());
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      decoration: BoxDecoration(
          color: Color(0xffd9d9d9),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: DropdownButton<int>(
        borderRadius: BorderRadius.circular(5),
        value: controller.currentPerPage,
        items: controller.perPages
            .map((e) => DropdownMenuItem<int>(
                  child: Text("$e"),
                  value: e,
                ))
            .toList(),
        onChanged: (dynamic value) {
          setState(() {
            controller.currentPerPage = value;
            controller.currentPage = 1;
           controller.resetData();
          });
        },
        isExpanded: false,
      ),
    );
  }
}
