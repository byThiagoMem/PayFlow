import 'dart:convert';

class TicketModel {
  final String id;
  final String name;
  final String dueDate;
  final double value;
  final String barcode;
  final bool paid;
  TicketModel({
    required this.id,
    required this.name,
    required this.dueDate,
    required this.value,
    required this.barcode,
    required this.paid,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'dueDate': dueDate,
      'value': value,
      'barcode': barcode,
      'paid': paid,
    };
  }

  factory TicketModel.fromMap(Map<String, dynamic> map) {
    return TicketModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      dueDate: map['dueDate'] ?? '',
      value: map['value']?.toDouble() ?? 0.0,
      barcode: map['barcode'] ?? '',
      paid: map['paid'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory TicketModel.fromJson(String source) => TicketModel.fromMap(json.decode(source));
}
