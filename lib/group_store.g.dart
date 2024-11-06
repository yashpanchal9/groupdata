// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GroupStore on _GroupStore, Store {
  late final _$groupListAtom =
      Atom(name: '_GroupStore.groupList', context: context);

  @override
  List<Map<String, dynamic>> get groupList {
    _$groupListAtom.reportRead();
    return super.groupList;
  }

  @override
  set groupList(List<Map<String, dynamic>> value) {
    _$groupListAtom.reportWrite(value, super.groupList, () {
      super.groupList = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_GroupStore.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$fetchGroupListAsyncAction =
      AsyncAction('_GroupStore.fetchGroupList', context: context);

  @override
  Future<void> fetchGroupList(
      {int page = 1, int pageSize = 10, bool isDescending = true}) {
    return _$fetchGroupListAsyncAction.run(() => super.fetchGroupList(
        page: page, pageSize: pageSize, isDescending: isDescending));
  }

  late final _$updateGroupTypeAsyncAction =
      AsyncAction('_GroupStore.updateGroupType', context: context);

  @override
  Future<void> updateGroupType(int id, Map<String, dynamic> data) {
    return _$updateGroupTypeAsyncAction
        .run(() => super.updateGroupType(id, data));
  }

  @override
  String toString() {
    return '''
groupList: ${groupList},
isLoading: ${isLoading}
    ''';
  }
}
