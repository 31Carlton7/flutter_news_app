import 'dart:collection';

import 'package:canton_design_system/canton_design_system.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

final recentSearchesProvider = ChangeNotifierProvider<RecentSearches>((ref) {
  return RecentSearches();
});

class RecentSearches extends ChangeNotifier {
  List<String> _recentSearches = <String>[];

  UnmodifiableListView get getRecentSearches =>
      UnmodifiableListView(_recentSearches);

  void add(String search) async {
    _recentSearches.add(search);
    saveData();
  }

  void saveData() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> savedList =
        _recentSearches.map((search) => json.encode(search)).toList();

    prefs.setStringList('recent_searches', savedList);
  }

  void loadData() async {
    final prefs = await SharedPreferences.getInstance();

    // prefs.remove('note_list');

    List<String> savedList = prefs.getStringList('recent_searches');
    _recentSearches = savedList.map((search) => json.decode(search)).toList();
  }
}
