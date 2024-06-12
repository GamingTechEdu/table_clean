import 'package:equatable/equatable.dart';

class ArEntity extends Equatable {
  final String ar;
  final String client;
  final String docType;
  final String docEntrance;
  final String position;
  final String quantityItens;
  final String dateOpen;
  final String user;

  @override
  List get props => [
        ar,
        client,
        docType,
        docEntrance,
        position,
        quantityItens,
        dateOpen,
        user,
      ];

  const ArEntity({
    required this.ar,
    required this.client,
    required this.docType,
    required this.docEntrance,
    required this.position,
    required this.quantityItens,
    required this.dateOpen,
    required this.user,
  });

  dynamic getProperty(String key) {
    switch (key) {
      case 'ar':
        return ar;
      case 'client':
        return client;
      case 'doc_type':
        return docType;
      case 'doc_entrance':
        return docEntrance;
      case 'position':
        return position;
      case 'quantity_itens':
        return quantityItens;
      case 'date_open':
        return dateOpen;
      case 'user':
        return user;
      default:
        throw ArgumentError('Invalid property key');
    }
  }
}
