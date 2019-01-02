import 'package:flutter/material.dart';
import 'package:tests/wave/config.dart';
import 'package:tests/wave/wave.dart';
import 'package:logging/logging.dart';

class OrderRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _OrderRouteState();
  }
}

class _OrderRouteState extends State<OrderRoute> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("Order", style: TextStyle(color: Colors.black)),
      ),
      body: ListView()
    );
  }

  @override
  bool get wantKeepAlive => true;
}
