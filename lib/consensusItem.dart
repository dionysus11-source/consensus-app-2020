import 'package:flutter/material.dart';

class Consensus {
  List<String> profit;
  List<String> eps;
  List<String> per;
  List<String> date;
  String companyName;
  String companyId;
  Consensus(
      {@required this.companyName,
      @required this.companyId,
      @required this.date,
      @required this.per,
      @required this.eps,
      @required this.profit});
}
