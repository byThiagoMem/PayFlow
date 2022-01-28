// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on HomeStoreBase, Store {
  final _$signOutStateAtom = Atom(name: 'HomeStoreBase.signOutState');

  @override
  AppState get signOutState {
    _$signOutStateAtom.reportRead();
    return super.signOutState;
  }

  @override
  set signOutState(AppState value) {
    _$signOutStateAtom.reportWrite(value, super.signOutState, () {
      super.signOutState = value;
    });
  }

  final _$currentPageAtom = Atom(name: 'HomeStoreBase.currentPage');

  @override
  int get currentPage {
    _$currentPageAtom.reportRead();
    return super.currentPage;
  }

  @override
  set currentPage(int value) {
    _$currentPageAtom.reportWrite(value, super.currentPage, () {
      super.currentPage = value;
    });
  }

  final _$signOutWithGoogleAsyncAction =
      AsyncAction('HomeStoreBase.signOutWithGoogle');

  @override
  Future<void> signOutWithGoogle() {
    return _$signOutWithGoogleAsyncAction.run(() => super.signOutWithGoogle());
  }

  final _$HomeStoreBaseActionController =
      ActionController(name: 'HomeStoreBase');

  @override
  void setPage(int index) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setPage');
    try {
      return super.setPage(index);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
signOutState: ${signOutState},
currentPage: ${currentPage}
    ''';
  }
}
