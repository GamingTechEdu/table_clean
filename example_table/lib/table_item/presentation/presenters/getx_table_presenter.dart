import 'dart:math';

import 'package:get/get.dart';

import '../../../domain/entities/entities.dart';
import '../../../domain/usecases/usecase.dart';

class GetxTablePresenter extends GetxController {
  final LoadSimuc load;

  GetxTablePresenter(this.load);

  int total = 100;
  String? sortColumn;
  int currentPage = 1;
  List<bool>? expanded;
  bool isLoading = true;
  bool showSelect = true;
  String? searchKey = "id";
  int? currentPerPage = 50;
  var random = new Random();
  bool sortAscending = true;
  bool isExpandRows = true;
  String selectableKey = "id";
  List<int> perPages = [10, 20, 50, 100];
  List<SimucEntity> source = [];
  List<SimucEntity> selecteds = [];
  List<SimucEntity> sourceOriginal = [];
  List<SimucEntity> sourceFiltered = [];
  bool isSearch = false;

  List<SimucEntity> status0 = [];
  List<SimucEntity> status2 = [];
  List<SimucEntity> status1 = [];


  initializeData() async {
    mockPullData();
    update();
  }

  void separetStatus(List<SimucEntity> source) {
    for (var rows in source) {
      if (rows.status == "0") {
        status0.add(rows);
      }else if(rows.status == "2"){
        status2.add(rows); 
      }else{
        status1.add(rows);
      }
    }
  }

  Future<List<SimucEntity>> fetch() async {
    final source = await load.loadSimuc();
    separetStatus(source);
    return source;
  }

  // List<Map<String, dynamic>> generateData({int n = 100}) {
  //   final List source = List.filled(n, Random.secure());
  //   List<Map<String, dynamic>> temps = [];
  //   var i = 1;
  //   print(i);
  //   // ignore: unused_local_variable
  //   for (var data in source) {
  //     temps.add({
  //       "id": i,
  //       "sku": "$i\000$i",
  //       "name": "Product $i",
  //       "category": "Category-$i",
  //       "price": i * 10.00,
  //       "cost": "20.00",
  //       "margin": "${i}0.20",
  //       "in_stock": "${i}0",
  //       "alert": "5",
  //       "received": [i + 20, 150],
  //       // "comand":
  //     });
  //     i++;
  //   }
  //   update();
  //   return temps;
  // }

  mockPullData() async {
    expanded = List.generate(currentPerPage!, (index) => false);

    isLoading = true;
    Future.delayed(Duration(seconds: 1)).then((value) async {
      sourceOriginal.clear();
      sourceOriginal.addAll(await fetch());
      sourceFiltered = sourceOriginal;
      total = sourceFiltered.length;
      int endRange = total < currentPerPage! ? total : currentPerPage!;
      source = sourceFiltered.getRange(0, endRange).toList();
      isLoading = false;
      update();
    });
    update();
  }

  resetData({start = 0}) async {
    isLoading = true;
    var expandedLen =
        total - start < currentPerPage! ? total - start : currentPerPage;
    Future.delayed(Duration(seconds: 0)).then((value) {
      expanded = List.generate(expandedLen as int, (index) => false);
      source.clear();
      source = sourceFiltered.getRange(start, start + expandedLen).toList();
      isLoading = false;
      update();
    });
    update();
  }

  filterData(value) {
    isLoading = true;
    try {
      if (value == "" || value == null) {
        sourceFiltered = sourceOriginal;
      } else {
        sourceFiltered = sourceOriginal
            .where((data) => data
                .toString()
                .toLowerCase()
                .contains(value.toString().toLowerCase()))
            .toList();
      }

      total = sourceFiltered.length;
      var rangeTop = total < currentPerPage! ? total : currentPerPage!;
      expanded = List.generate(rangeTop, (index) => false);
      source = sourceFiltered.getRange(0, rangeTop).toList();
    } catch (e) {
      print(e);
    }
    isLoading = false;
    update();
  }

  onSort(value) {
    isLoading = true;

    sortColumn = value;
    sortAscending = !sortAscending;
    if (sortAscending) {
      sourceFiltered.sort((a, b) =>
          b.getProperty(sortColumn!).compareTo(a.getProperty(sortColumn!)));
    } else {
      sourceFiltered.sort((a, b) =>
          a.getProperty(sortColumn!).compareTo(b.getProperty(sortColumn!)));
    }
    var rangeTop = currentPerPage! < sourceFiltered.length
        ? currentPerPage!
        : sourceFiltered.length;
    source = sourceFiltered.getRange(0, rangeTop).toList();
    searchKey = value;

    isLoading = false;
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

  onSelectAll(value) {
    if (value!) {
      selecteds = source.map((entry) => entry).toList().cast();
    } else {
      selecteds.clear();
    }
    update();
  }

  void backPage(presenter) {
    if (currentPage == 1) {
      return;
    } else {
      var _nextSet = currentPage - currentPerPage!;
      currentPage = _nextSet > 1 ? _nextSet : 1;
      resetData(start: currentPage - 1);
      update();
    }
    update();
  }

  void nextPage(presenter) {
    if (currentPage + currentPerPage! - 1 <= total) {
      var _nextSet = currentPage + currentPerPage!;
      currentPage = _nextSet < total ? _nextSet : total - currentPerPage!;
      resetData(start: _nextSet - 1);
      update();
    } else {
      return;
    }
    update();
  }

}
