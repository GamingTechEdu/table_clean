import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../presentation/presenters/presenters.dart';
import '../atoms/atoms.dart';

class DashboardMolecule extends StatelessWidget {
  const DashboardMolecule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<GetxTablePresenter>(context);
    return Row(
      children: [
        DashboardAtom(
          label: "Manutenção: ${controller.status0.length.toString()}",
          color: Colors.red.withOpacity(0.3),
          colorInternal: Colors.red.withOpacity(0.5),
        ),
        SizedBox(width: 10),
        DashboardAtom(
          label: "Aguard. Nota: ${controller.status2.length.toString()}",
          color: Colors.purple.withOpacity(0.3),
          colorInternal: Colors.purple.withOpacity(0.5),
        ),
         SizedBox(width: 10),
        DashboardAtom(
          label: "Concluídas: ${controller.status1.length.toString()}",
          color: Colors.green.withOpacity(0.3),
          colorInternal: Colors.green.withOpacity(0.5),
        ),
      ],
    );
  }
}
