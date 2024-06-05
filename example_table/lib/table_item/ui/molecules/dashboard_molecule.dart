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
          Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Color(0xFFD9D9D9)),
            width: 300,
            height: 100,
          ),
          Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Color(0xFFD9D9D9)),
            width: 300,
            height: 100,
          ),
        ],
      ),
    );
  }
}
