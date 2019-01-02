import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:tests/route/homeRoute.dart';

class ExpansionPanelItem {
  bool isExpanded;

  final String header;

  final Widget body;

  ExpansionPanelItem({
    @required this.isExpanded, 
    @required this.header, 
    @required this.body
  });
}



