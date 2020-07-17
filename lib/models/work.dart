import 'package:flutter/material.dart';

class Work with ChangeNotifier {
  final String id;
  final String worktype;
  final String username;

  final String workDetail;
  final String contact;
  final String location;
  final double pay;
  final DateTime dateTime;
  bool isActive;

  Work({
    this.id,
    this.worktype,
    this.username,
    this.workDetail,
    this.contact,
    this.location,
    this.pay,
    this.dateTime,
    this.isActive = true,
  });
}
