import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:pay_flow_flutter/app/modules/home/services/home_service.dart';
import 'package:pay_flow_flutter/app/shared/models/ticket_model.dart';
import 'package:pay_flow_flutter/app/shared/repositories/auth/user_controller.dart';
import 'package:pay_flow_flutter/app/shared/routes/app_routes.dart';
import 'package:pay_flow_flutter/app/shared/services/ticket/ticket_service.dart';
import 'package:pay_flow_flutter/app/shared/utils/app_state.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final _homeService = Modular.get<HomeService>();
  final _ticketService = Modular.get<TicketService>();
  final _userController = Modular.get<UserController>();

  ObservableList<TicketModel> paidTickets = ObservableList<TicketModel>.of([]);
  ObservableList<TicketModel> unpaindTickets = ObservableList<TicketModel>.of([]);

  @observable
  AppState signOutState = AppState.IDLE;

  @observable
  int currentPage = 0;

  Future<void> getAllTickets() async {
    User? user = _userController.user;
    if (user != null) {
      var response = await _ticketService.getAllTickets(userId: user.uid);
      paidTickets.clear();
      unpaindTickets.clear();
      for (var ticket in response) {
        if (ticket.paid == false) {
          unpaindTickets.add(ticket);
        } else {
          paidTickets.add(ticket);
        }
      }
    }
  }

  Future<void> payTicket(TicketModel ticket) async {
    User? user = _userController.user;
    if (user != null) {
      await _ticketService.updateTicket(userId: user.uid, ticket: ticket);
      await getAllTickets();
      Modular.to.pop();
    }
  }

  Future<void> deleteTicket(TicketModel ticket) async {
    User? user = _userController.user;
    if (user != null) {
      await _ticketService.deleteTicket(userId: user.uid, ticket: ticket);
      await getAllTickets();
      Modular.to.pop();
    }
  }

  @action
  Future<void> signOutWithGoogle() async {
    try {
      await _homeService.signOutWithGoogle();
    } catch (e, s) {
      log(e.toString(), error: e, stackTrace: s);
    }
  }

  @action
  void setPage(int index) {
    currentPage = index;
  }

  void goToBarcodeScannerPage() => Modular.to.pushNamed(AppRoutes.barcodescanner);
}
