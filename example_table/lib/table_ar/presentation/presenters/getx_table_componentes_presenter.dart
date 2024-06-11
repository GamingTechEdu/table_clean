import 'package:get/get.dart';

class GetxTableComponentesPresenter extends GetxController {
  bool teste = false;
  bool showSelect = true;
  List<Map<String, dynamic>> selecteds = [];

  onChange() {
    teste = true;
    print(teste);
    update();
  }

  onSelect(value, item) {
    print("$value  $item ");
    if (value!) {
      selecteds.add(item);
    } else {
      selecteds.removeAt(selecteds.indexOf(item));
    }
    update();
  }
}
