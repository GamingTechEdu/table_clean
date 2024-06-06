import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../presentation/presenters/presenters.dart';
import '../atoms/atoms.dart';

class DashboardMoleucle extends StatelessWidget {
  const DashboardMoleucle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GetxTablePresenter controller = Get.put(GetxTablePresenter());
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DashboardAtom(
            label: "Total: ${controller.total.toString()}",
          ),
          DashboardAtom(
            label: "Teste",
          ),
          DashboardAtom(
            label: "Teste",
          ),
        ],
      ),
    );
  }
}
