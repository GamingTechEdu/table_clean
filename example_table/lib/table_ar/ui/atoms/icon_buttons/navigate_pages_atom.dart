import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_table_example/table_item/ui/widgets/widgets.dart';

import '../../../presentation/presenters/getx_ar_presenter.dart';

class NavigatePagesAtom extends StatefulWidget {
  const NavigatePagesAtom({Key? key}) : super(key: key);

  @override
  State<NavigatePagesAtom> createState() => _NavigatePagesAtomState();
}

class _NavigatePagesAtomState extends State<NavigatePagesAtom> {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<GetxArPresenter>(context);
    return Container(
      height: 30,
      decoration: BoxDecoration(
          color: Color(0xffd9d9d9),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Row(
        children: [
          IconButtonWidget(
            tooltip: "Voltar",
            onPressed: controller.currentPage == 1
                ? null
                : () => controller.backPage(controller),
            highlightColor: Colors.transparent,
            icon: Icon(Icons.arrow_back_ios, size: 16),
            padding: EdgeInsets.symmetric(horizontal: 15),
          ),
          IconButtonWidget(
            tooltip: "Próximo",
            onPressed: () => controller.nextPage(controller),
            highlightColor: Colors.transparent,
            icon: Icon(Icons.arrow_forward_ios, size: 16),
            padding: EdgeInsets.symmetric(horizontal: 15),
          ),
        ],
      ),
    );
  }
}
