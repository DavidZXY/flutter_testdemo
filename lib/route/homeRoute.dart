import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tests/route/searchRoute.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:logging/logging.dart';
import 'package:tests/widget/ExpansionPanelItem.dart';

class HomeRoute extends StatefulWidget {
  HomeRoute({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return HomeRouteState();
  }
}

class HomeRouteState extends State<HomeRoute>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  ColorTheme _colorTheme = ColorTheme.BlackWhite;
  TextTheme _textTheme = TextTheme.A;

  Widget barSearch() {
    return Hero(
      tag: "searchText",
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Theme(
                child: TextField(
                    autocorrect: false,
                    autofocus: false,
                    onTap: () {
                      Navigator.of(context).push(PageRouteBuilder(pageBuilder:
                          (context, animation, secondaryAnimation) {
                        return FadeTransition(
                          child: SearchRoute(),
                          opacity: animation,
                        );
                      }));
                    },
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.only(left: 12, top: -8, bottom: -8),
                        suffixIcon: Hero(
                          child: Icon(
                            Icons.search,
                            size: 20,
                            color: Colors.black,
                          ),
                          tag: "searchButton",
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6))
                    )
                  ),
                data: ThemeData(
                    hintColor: Colors.black,
                    splashColor: Colors.transparent,
                    primaryColor: Colors.black),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildListViewItem() {
    return Card(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(width: 1),
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(6)),
          child: Row(
            children: <Widget>[
              // SizedBox(
              //   width: 20,
              // ),
              ClipRRect(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                borderRadius: BorderRadius.circular(6),
                child: Image(
                  image: AssetImage("asset/image/pic1.jpg"),
                  color: Colors.black,
                  colorBlendMode: BlendMode.hue,
                ),
              ),
              SizedBox(
                width: 40,
              ),
              Container(
                width: 100,
                child: Text(
                  "datadatadatadatadatadatadatadatadatadatadatadatadata",
                  softWrap: true,
                  maxLines: 5,
                  overflow: TextOverflow.fade,
                  textAlign: TextAlign.justify,
                ),
              )
            ],
          ),
        ));
  }

  void onTextChangedMethod(TextTheme value) {
    setState(() {
      _textTheme = value;
    });
    print(value);
  }

  void onColorChangedMethod(ColorTheme value) {
    setState(() {
      _colorTheme = value;
    });
    print(value);
  }

  List<bool> isExpandedList = <bool>[false, false];


  List<ExpansionPanelItem> _expansionItems;

  AnimationController _controller;

  void _buildExpansionItems() {
    _expansionItems = <ExpansionPanelItem>[
      ExpansionPanelItem(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            RadioListTile<TextTheme>(
              title: Text("A"),
              groupValue: _textTheme,
              onChanged: (TextTheme value) {
                onTextChangedMethod(value);
              },
              value: TextTheme.A,
            ),
            RadioListTile<TextTheme>(
              title: Text("B"),
              groupValue: _textTheme,
              onChanged: (TextTheme value) {
                onTextChangedMethod(value);
              },
              value: TextTheme.B,
            ),
          ],
        ),
        header: "Text Theme", 
        isExpanded: isExpandedList[0],
      ),
      ExpansionPanelItem(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            RadioListTile<ColorTheme>(
              title: Text("BlackWhite"),
              groupValue: _colorTheme,
              onChanged: (ColorTheme value) {
                onColorChangedMethod(value);
              },
              value: ColorTheme.BlackWhite,
            ),
            RadioListTile<ColorTheme>(
              title: Text("Colorful"),
              groupValue: _colorTheme,
              onChanged: (ColorTheme value) {
                onColorChangedMethod(value);
              },
              value: ColorTheme.Colorful,
            ),
          ],
        ),
        header: "Color Theme",
        isExpanded: isExpandedList[1],
      ),
    ];
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: Duration(microseconds: 1000), value: 1.0, vsync: this);
    // _buildExpansionItems();
  }

  @override
  Widget build(BuildContext context) {
    // final bool showFab =
    //     MediaQuery.of(context).viewInsets.bottom == 0.0 ? true : false;
    // final List<Image> images = <Image>[
    //   Image.asset(
    //     "asset/image/pic1.jpg",
    //     fit: BoxFit.fill,
    //   ),
    //   Image.asset(
    //     "asset/image/pic2.jpg",
    //     fit: BoxFit.fill,
    //   ),
    //   Image.asset(
    //     "asset/image/pic3.jpg",
    //     fit: BoxFit.fill,
    //   ),
    //   Image.asset(
    //     "asset/image/pic4.jpg",
    //     fit: BoxFit.fill,
    //   ),
    // ];
    _buildExpansionItems();
    
    final List<Text> texts = <Text>[
      Text("君不见黄河之水天上来"),
      Text("奔流到海不复回"),
      Text("君不见高堂明镜悲白发"),
      Text("朝如青丝暮成雪"),
    ];
    final List<Text> itemTexts = <Text>[
      Text("美食"),
      Text("超市"),
      Text("生鲜"),
      Text("专送"),
      Text("甜点"),
      Text("夜宵"),
      Text("烧烤"),
      Text("卤味"),
      Text("饮品"),
      Text("零食"),
    ];

    void _toggleFrontLayer() {
      final AnimationStatus status = _controller.status;
      final bool isOpen = status == AnimationStatus.completed ||
          status == AnimationStatus.forward;
      _controller.fling(velocity: isOpen ? -2.0 : 2.0);
    }

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        elevation: 4,
        leading: Hero(
          child: Material(
            color: Colors.transparent,
            child: IconButton(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              color: Colors.black,
              icon: AnimatedIcon(
                icon: AnimatedIcons.arrow_menu,
                progress: _controller,
              ),
              onPressed: () {
                _scaffoldKey.currentState.openDrawer();
              },
            ),
          ),
          tag: "barLeading",
        ),
        backgroundColor: Colors.white,
        title: barSearch(),
        actions: <Widget>[
          IconButton(
            padding: EdgeInsets.symmetric(horizontal: 0),
            icon: Icon(
              FontAwesomeIcons.qrcode,
              color: Colors.black,
              size: 20,
            ),
            onPressed: () {},
          )
        ],
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                color: Colors.black12,
                height: 150,
                child: Center(
                    child: Icon(
                  Icons.person,
                  size: 50,
                )),
              ),
              Container(
                child: ExpansionPanelList(
                  expansionCallback: (index, isExpanded) {
                    setState(() {
                      isExpandedList[index] =
                          !isExpandedList[index];
                    });
                  },
                  children: _expansionItems.map((item) {
                    return ExpansionPanel(
                        body: item.body,
                        headerBuilder: (BuildContext context, bool isExpanded) {
                          return Container(
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.symmetric(horizontal: 32),
                            child: Text(item.header),
                          );
                        },
                        isExpanded: item.isExpanded);
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        top: false,
        bottom: false,
        child: SingleChildScrollView(
            // padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
                // mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
              SizedBox(
                height: 8,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 100,
                child: Swiper(
                  autoplayDelay: 5000,
                  duration: 1000,
                  itemCount: 4,
                  itemBuilder: (context, index) => Card(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      elevation: 0,
                      child: Container(
                        alignment: Alignment.center,
                        child: texts[index],
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Colors.transparent,
                          border: Border.all(width: 1),
                        ),
                      )),
                  pagination: SwiperPagination(
                    builder: SwiperCustomPagination(builder:
                        (BuildContext context, SwiperPluginConfig config) {
                      return DotSwiperPaginationBuilder(
                              color: Colors.black,
                              activeColor: Colors.black,
                              size: 2,
                              activeSize: 5)
                          .build(context, config);
                    }),
                  ),
                  scrollDirection: Axis.horizontal,
                  autoplay: true,
                  onTap: (index) => print('$index'),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                padding: EdgeInsets.only(bottom: 2),
                child: Wrap(
                    alignment: WrapAlignment.center,
                    runSpacing: -8,
                    spacing: 4,
                    children: itemTexts.map((item) {
                      return ButtonTheme(
                        minWidth: 36,
                        child: RaisedButton(
                          shape: Border(
                              left: BorderSide(width: 1),
                              top: BorderSide(width: 1)),
                          highlightElevation: 4,
                          onPressed: () {},
                          child: item,
                          highlightColor: Colors.white,
                          color: Colors.white,
                          elevation: 0,
                        ),
                      );
                    }).toList()),
              ),
              SizedBox(
                height: 8,
              ),
              StickyHeader(
                header: Container(
                  height: 50,
                  width: 500,
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  alignment: Alignment.centerLeft,
                  color: Colors.white,
                  child: Text("Header", style: TextStyle(fontSize: 24)),
                ),
                content: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  shrinkWrap: true,
                  itemExtent: 90,
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return _buildListViewItem();
                  },
                ),
              ),
            ])),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FlatButton(
        onPressed: () {
          print("object");
        },
        padding: EdgeInsets.all(12),
        shape: CircleBorder(side: BorderSide(width: 1)),
        child: Icon(Icons.add_shopping_cart),
        color: Colors.white,
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

enum ColorTheme { BlackWhite, Colorful }

enum TextTheme { A, B }
