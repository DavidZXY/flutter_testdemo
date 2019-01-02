import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

class SearchRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SearchRoute();
  }
}

class _SearchRoute extends State<SearchRoute> with TickerProviderStateMixin {
  AnimationController _controller;
  Widget searchInput() {
    return Hero(
      tag: "search",
      child: Container(
        child: Row(
          children: <Widget>[
            Expanded(
              child: Theme(
                child: TextField(
                  autofocus: true,
                  cursorColor: Colors.black54,
                  onTap: () {},
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.0),
                          borderRadius: BorderRadius.circular(6)),
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.0),
                          borderRadius: BorderRadius.circular(6))
                  ),
                ),
                data: ThemeData(
                    splashColor: Colors.transparent,
                    primaryColor: Colors.black),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: Duration(microseconds: 1000), value: 1.0, vsync: this);
  }

  void _toggleFrontLayer() {
    final AnimationStatus status = _controller.status;
    final bool isOpen = status == AnimationStatus.completed ||
        status == AnimationStatus.forward;
    _controller.fling(velocity: isOpen ? -2.0 : 2.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Hero(
          child: Material(
            color: Colors.transparent,
            child: IconButton(
              color: Colors.black,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              icon: AnimatedIcon(
                icon: AnimatedIcons.menu_arrow,
                progress: _controller,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          tag: "leading",
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: searchInput(),
        actions: <Widget>[
          IconButton(
            icon: Hero(
              child: Icon(
                Icons.search,
                color: Colors.black,
                size: 20,
              ),
              tag: "searchButton",
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[],
        ),
      ),
    );
  }
}
