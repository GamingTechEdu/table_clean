import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../presentation/presenters/presenters.dart';
import '../atoms/atoms.dart';

class DashboardMolecule extends StatelessWidget {
  const DashboardMolecule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<GetxArPresenter>(context);
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
