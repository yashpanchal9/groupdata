import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
part 'group_store.g.dart';

class GroupStore = _GroupStore with _$GroupStore;

abstract class _GroupStore with Store {
  static const String baseUrl = "https://dev.api.teaqip.nobrainsolutions.com/v1/group-types";

  @observable
  List<Map<String, dynamic>> groupList = [];

  @observable
  bool isLoading = false;
  String? errorMessage='error';

  Future<void> fetchGroupList({int page = 1, int pageSize = 10, bool isDescending = true}) async {
    isLoading = true;
    errorMessage = null;
    try {

      if (kDebugMode) {
        print("Fetching group list from API...");
      }
      final response = await http
          .get(
        Uri.parse('$baseUrl?IsDescending=$isDescending&Page=$page&PageSize=$pageSize'),
      ).timeout(const Duration(seconds: 10)); // Set a timeout of 10 seconds
      if (response.statusCode == 200) {
        groupList = List<Map<String, dynamic>>.from(json.decode(response.body));
      } else {
        errorMessage = "Failed to load group types";
      }
      if (kDebugMode) {
        print("Received response: ${response.statusCode}");
      }
    } catch (e) {
      errorMessage = "An error occurred: $e";
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> updateGroupType(int id, Map<String, dynamic> data) async {
    final response = await http.patch(
      Uri.parse('$baseUrl/$id'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(data),
    );
    if (response.statusCode != 200) {
      throw Exception("Failed to update group type");
    } else {
      await fetchGroupList();
    }
  }
}
