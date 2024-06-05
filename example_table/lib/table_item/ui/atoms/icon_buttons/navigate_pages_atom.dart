import 'package:flutter/material.dart';
import 'package:responsive_table_example/table_item/ui/widgets/widgets.dart';

import '../../../presentation/presenters/getx_table_presenter.dart';
import 'package:get/get.dart';

class NavigatePagesAtom extends StatefulWidget {
  const NavigatePagesAtom({Key? key}) : super(key: key);

  @override
  State<NavigatePagesAtom> createState() => _NavigatePagesAtomState();
}

class _NavigatePagesAtomState extends State<NavigatePagesAtom> {
   final GetxTablePresenter controller = Get.put(GetxTablePresenter());
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      decoration: BoxDecoration(
          color: Color(0xffd9d9d9),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Row(
        children: [
          IconButtonWidget(
            tooltip: "Voltar",
            onPressed: () {
              controller.backPage(controller);
            },
            highlightColor: Colors.transparent,
            icon: Icon(Icons.arrow_back_ios, size: 16),
            padding: EdgeInsets.symmetric(horizontal: 15),
          ),
          IconButtonWidget(
            tooltip: "Próximo",
            onPressed: () {
              controller.nextPage(controller);
            },
            highlightColor: Colors.transparent,
            icon: Icon(Icons.arrow_forward_ios, size: 16),
            padding: EdgeInsets.symmetric(horizontal: 15),
          ),
        ],
      ),
    );
  }
}


//  IconButton(
//                 highlightColor: Colors.transparent,
//                 icon: Icon(Icons.arrow_forward_ios, size: 16),
//                 onPressed: _currentPage + _currentPerPage! - 1 > _total
//                     ? null
//                     : () {
//                         var _nextSet = _currentPage + _currentPerPage!;

//                         setState(() {
//                           _currentPage = _nextSet < _total
//                               ? _nextSet
//                               : _total - _currentPerPage!;
//                           _resetData(start: _nextSet - 1);
//                         });
//                       },
//                 padding: EdgeInsets.symmetric(horizontal: 15),
//               )