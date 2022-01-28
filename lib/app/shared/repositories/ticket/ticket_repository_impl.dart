import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pay_flow_flutter/app/shared/models/ticket_model.dart';

import './ticket_repository.dart';

class TicketRepositoryImpl implements TicketRepository {
  @override
  Future<void> addNewTicket({required String userId, required TicketModel ticket}) async {
    try {
      var collection = FirebaseFirestore.instance.collection('tickets').doc(userId).collection('tickets');
      collection.add(ticket.toMap());
    } catch (e, s) {
      log(e.toString(), error: e, stackTrace: s);
      throw Exception('Erro ao salvar boleto');
    }
  }

  @override
  Future<List<TicketModel>> getAllTickets({required String userId}) async {
    try {
      var moveisCollection = await FirebaseFirestore.instance.collection('tickets').doc(userId).collection('tickets').get();
      final listMovies = <TicketModel>[];

      for (var ticket in moveisCollection.docs) {
        listMovies.add(TicketModel.fromMap(ticket.data()));
      }
      return listMovies;
    } catch (e) {
      throw Exception('Erro ao buscar boletos');
    }
  }
}
