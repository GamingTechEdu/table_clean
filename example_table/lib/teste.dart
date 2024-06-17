import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PrimeiraTabelaScreen(),
    );
  }
}

class PrimeiraTabelaScreen extends StatelessWidget {
  final List<Map<String, dynamic>> primeiraTabela = [
    {'id': 1, 'nome': 'Item 1'},
    {'id': 2, 'nome': 'Item 2'},
    {'id': 3, 'nome': 'Item 3'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Primeira Tabela'),
      ),
      body: ListView.builder(
        itemCount: primeiraTabela.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(primeiraTabela[index]['nome']),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SegundaTabelaScreen(
                    id: primeiraTabela[index]['id'],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}


class SegundaTabelaScreen extends StatelessWidget {
  final int id;

  SegundaTabelaScreen({required this.id});

  final List<Map<String, dynamic>> segundaTabela = [
    {'primeira_tabela_id': 1, 'detalhes': 'Detalhes do Item 1'},
    {'primeira_tabela_id': 2, 'detalhes': 'Detalhes do Item 2'},
    {'primeira_tabela_id': 3, 'detalhes': 'Detalhes do Item 3'},
  ];

  @override
  Widget build(BuildContext context) {
    final dadosRelacionados = segundaTabela
        .where((item) => item['primeira_tabela_id'] == id)
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Segunda Tabela'),
      ),
      body: ListView.builder(
        itemCount: dadosRelacionados.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(dadosRelacionados[index]['detalhes']),
          );
        },
      ),
    );
  }
}
