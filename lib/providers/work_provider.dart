import 'dart:convert';

import 'package:Workit/models/work.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class WorkProvider with ChangeNotifier {
  List<Work> _items = [];

  List<Work> get items {
    return [..._items];
  }

  Work findById(String id) {
    return _items.firstWhere((wrk) => wrk.id == id);
  }

  Future<void> addWork(Work work) async {
    final url = "https://workit-7b553.firebaseio.com/works.json";
    try {
      final response = await http.post(url,
          body: json.encode({
            "worktype": work.worktype,
            "username": work.username,
            "workDetail": work.workDetail,
            "contact": work.contact,
            "location": work.location,
            "pay": work.pay,
            "dateTime": DateTime.now().toString(),
          }));
      final newWork = Work(
        id: json.decode(response.body)['name'],
        worktype: work.worktype,
        username: work.username,
        workDetail: work.workDetail,
        contact: work.contact,
        location: work.location,
        pay: work.pay,
        dateTime: DateTime.now(),
      );

      _items.add(newWork);
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }

  //this function fetches the products from firebase
  Future<void> fetchAndSetWorks() async {
    final url = "https://workit-7b553.firebaseio.com/works.json";
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;

      final List<Work> loadedWorks = [];
      extractedData.forEach((prodId, work) {
        loadedWorks.add(Work(
          id: prodId,
          worktype: work["worktype"],
          username: work["username"],
          workDetail: work["workDetail"],
          contact: work["contact"],
          location: work["location"],
          pay: double.parse(work['pay'].toString()),
          dateTime: DateTime.now(),
        ));
      });
      _items = loadedWorks;

      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }

  Future<void> updateWork(String id, Work upwork) async {
    final workIndex = _items.indexWhere((element) => element.id == id);
    try {
      if (workIndex >= 0) {
        final url = "https://workit-7b553.firebaseio.com/works/$id.json";
        await http.patch(url,
            body: json.encode({
              "worktype": upwork.worktype,
              "username": upwork.username,
              "workDetail": upwork.workDetail,
              "contact": upwork.contact,
              "location": upwork.location,
              "pay": upwork.pay,
            }));

        _items[workIndex] = upwork;
        notifyListeners();
      }
    } catch (error) {
      throw (error);
    }
  }
}
