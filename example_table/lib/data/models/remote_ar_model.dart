import '../../domain/entities/entities.dart';

class RemoteArModel {
  final String ar;
  final String client;
  final String docType;
  final String docEntrance;
  final String position;
  final String quantityItens;
  final String dateOpen;
  final String user;

  const RemoteArModel({
    required this.ar,
    required this.client,
    required this.docType,
    required this.docEntrance,
    required this.position,
    required this.quantityItens,
    required this.dateOpen,
    required this.user,
  });

  factory RemoteArModel.fromJson(Map? json) {
    return RemoteArModel(
      ar: json?['ar'] ?? '',
      client: json?['client'] ?? '',
      docType: json?['doc_type'] ?? '',
      docEntrance: json?['doc_entrance'] ?? '',
      position: json?['position'] ?? '',
      quantityItens: json?['quantity_itens'] ?? '',
      dateOpen: json?['date_open'] ?? '',
      user: json?['user'] ?? '',
    );
  }

  ArEntity toEntity() => ArEntity(
        ar: ar,
        client: client,
        docType: docType,
        docEntrance: docEntrance,
        position: position,
        quantityItens: quantityItens,
        dateOpen: dateOpen,
        user: user,
      );
}
