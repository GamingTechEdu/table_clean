import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../presentation/presenters/presenters.dart';
import '../atoms/atoms.dart';

class DashboardMolecule extends StatelessWidget {
  const DashboardMolecule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<GetxTablePresenter>(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DashboardAtom(
            label: "Manutenção: ${controller.status0.length.toString()}",
          ),
          DashboardAtom(
            label: "Aguard. Nota: ${controller.status2.length.toString()}",
          ),
          DashboardAtom(
            label: "Concluídas: ${controller.status1.length.toString()}",
          ),
        ],
      ),
    );
  }
}
