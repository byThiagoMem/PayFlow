// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insert_ticket_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$InsertTicketStore on _InsertTicketStoreBase, Store {
  final _$ticketStateAtom = Atom(name: '_InsertTicketStoreBase.ticketState');

  @override
  AppState get ticketState {
    _$ticketStateAtom.reportRead();
    return super.ticketState;
  }

  @override
  set ticketState(AppState value) {
    _$ticketStateAtom.reportWrite(value, super.ticketState, () {
      super.ticketState = value;
    });
  }

  final _$formErrorAtom = Atom(name: '_InsertTicketStoreBase.formError');

  @override
  String get formError {
    _$formErrorAtom.reportRead();
    return super.formError;
  }

  @override
  set formError(String value) {
    _$formErrorAtom.reportWrite(value, super.formError, () {
      super.formError = value;
    });
  }

  final _$_InsertTicketStoreBaseActionController =
      ActionController(name: '_InsertTicketStoreBase');

  @override
  bool validateForms() {
    final _$actionInfo = _$_InsertTicketStoreBaseActionController.startAction(
        name: '_InsertTicketStoreBase.validateForms');
    try {
      return super.validateForms();
    } finally {
      _$_InsertTicketStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool validateNameTicket() {
    final _$actionInfo = _$_InsertTicketStoreBaseActionController.startAction(
        name: '_InsertTicketStoreBase.validateNameTicket');
    try {
      return super.validateNameTicket();
    } finally {
      _$_InsertTicketStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool validateDueDateTicket() {
    final _$actionInfo = _$_InsertTicketStoreBaseActionController.startAction(
        name: '_InsertTicketStoreBase.validateDueDateTicket');
    try {
      return super.validateDueDateTicket();
    } finally {
      _$_InsertTicketStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool validateValueTicket() {
    final _$actionInfo = _$_InsertTicketStoreBaseActionController.startAction(
        name: '_InsertTicketStoreBase.validateValueTicket');
    try {
      return super.validateValueTicket();
    } finally {
      _$_InsertTicketStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool validateBarcodeTicket() {
    final _$actionInfo = _$_InsertTicketStoreBaseActionController.startAction(
        name: '_InsertTicketStoreBase.validateBarcodeTicket');
    try {
      return super.validateBarcodeTicket();
    } finally {
      _$_InsertTicketStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
ticketState: ${ticketState},
formError: ${formError}
    ''';
  }
}
