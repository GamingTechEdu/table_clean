import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../presentation/presenters/getx_table_presenter.dart';

class PageViewsAtom extends StatefulWidget {
  const PageViewsAtom({Key? key}) : super(key: key);

  @override
  State<PageViewsAtom> createState() => _PageViewsAtomState();
}

class _PageViewsAtomState extends State<PageViewsAtom> {
  final GetxTablePresenter controller = Get.put(GetxTablePresenter());
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Text(
          "${controller.currentPage} - ${controller.currentPerPage} de ${controller.total}"),
    );
  }
}
