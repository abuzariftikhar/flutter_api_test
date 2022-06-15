// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on HomeStoreBase, Store {
  late final _$usersAtom = Atom(name: 'HomeStoreBase.users', context: context);

  @override
  List<Data> get users {
    _$usersAtom.reportRead();
    return super.users;
  }

  @override
  set users(List<Data> value) {
    _$usersAtom.reportWrite(value, super.users, () {
      super.users = value;
    });
  }

  late final _$isBusyAtom =
      Atom(name: 'HomeStoreBase.isBusy', context: context);

  @override
  bool get isBusy {
    _$isBusyAtom.reportRead();
    return super.isBusy;
  }

  @override
  set isBusy(bool value) {
    _$isBusyAtom.reportWrite(value, super.isBusy, () {
      super.isBusy = value;
    });
  }

  late final _$totalCountAtom =
      Atom(name: 'HomeStoreBase.totalCount', context: context);

  @override
  int get totalCount {
    _$totalCountAtom.reportRead();
    return super.totalCount;
  }

  @override
  set totalCount(int value) {
    _$totalCountAtom.reportWrite(value, super.totalCount, () {
      super.totalCount = value;
    });
  }

  late final _$tabIndexAtom =
      Atom(name: 'HomeStoreBase.tabIndex', context: context);

  @override
  int get tabIndex {
    _$tabIndexAtom.reportRead();
    return super.tabIndex;
  }

  @override
  set tabIndex(int value) {
    _$tabIndexAtom.reportWrite(value, super.tabIndex, () {
      super.tabIndex = value;
    });
  }

  @override
  String toString() {
    return '''
users: ${users},
isBusy: ${isBusy},
totalCount: ${totalCount},
tabIndex: ${tabIndex}
    ''';
  }
}
