import 'package:flutter/material.dart';

class ExportSheet extends StatefulWidget {
  @override
  _ExportSheetState createState() => _ExportSheetState();
}

class _ExportSheetState extends State<ExportSheet> {
  bool exportName = true;
  bool exportAge = true;
  bool exportCity = true;
  bool selectAll = true;

  void _updateSelectAll() {
    setState(() {
      selectAll = exportName && exportAge && exportCity;
    });
  }

  void _toggleSelectAll(bool? value) {
    setState(() {
      selectAll = value ?? false;
      exportName = selectAll;
      exportAge = selectAll;
      exportCity = selectAll;
    });
  }

  void _updateIndividualCheckbox(bool? value, String type) {
    setState(() {
      switch (type) {
        case 'Name':
          exportName = value ?? false;
          break;
        case 'Age':
          exportAge = value ?? false;
          break;
        case 'City':
          exportCity = value ?? false;
          break;
      }
      _updateSelectAll();
    });
  }

  List<String> itemList = [
    '11111',
    '22222',
    '33333',
    '44444',
    '55555',
    '77777',
    '66666',
    '88888',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("SELECIONAR NOTA A SER EXTRAIDA"),
          DropdownButtonFormField(
            items: itemList.map((costumer) {
              return DropdownMenuItem<String>(
                value: costumer,
                child: Text(costumer),
              );
            }).toList(),
            onChanged: (value) {},
          ),
          Text("SELECIONAR CAMPOS"),
          CheckboxListTile(
            title: Text('Selecionar Todas'),
            value: selectAll,
            onChanged: _toggleSelectAll,
          ),
          CheckboxListTile(
            title: Text('Name'),
            value: exportName,
            onChanged: (bool? value) {
              _updateIndividualCheckbox(value, 'Name');
            },
          ),
          CheckboxListTile(
            title: Text('Age'),
            value: exportAge,
            onChanged: (bool? value) {
              _updateIndividualCheckbox(value, 'Age');
            },
          ),
          CheckboxListTile(
            title: Text('City'),
            value: exportCity,
            onChanged: (bool? value) {
              _updateIndividualCheckbox(value, 'City');
            },
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // List<Person> mockData = generateMockData();
              // exportToExcel(mockData, exportName: exportName, exportAge: exportAge, exportCity: exportCity);
            },
            child: Text('Exportar Excel'),
          ),
        ],
      ),
    );
  }
}
