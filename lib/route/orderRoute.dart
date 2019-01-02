import 'dart:io';
import 'dart:convert';

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
  String _text = '';
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("Order", style: TextStyle(color: Colors.black)),
      ),
      body: ListView(
        children: <Widget>[
          FlatButton(child: Text('data'), onPressed: () async {
            try {
                    //创建一个HttpClient
                    HttpClient httpClient = new HttpClient();
                    //打开Http连接
                    HttpClientRequest request = await httpClient.getUrl(
                        Uri.parse("http://apistore.baidu.com/apiworks/servicedetail/720.html"));
                    //使用iPhone的UA
                    request.headers.add("user-agent", "Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1");
                    //等待连接服务器（会将请求信息发送给服务器）
                    HttpClientResponse response = await request.close();
                    //读取响应内容
                    _text = await response.transform(utf8.decoder).join();
                    //输出响应头
                    print(response.headers);

                    //关闭client后，通过该client发起的所有请求都会中止。
                    httpClient.close();

                  } catch (e) {
                    _text = "请求失败：$e";
                  } finally {
                    setState(() {
                      _loading = false;
                    });
                  }
          },),
          Container(
            width: MediaQuery.of(context).size.width-50.0,
            child: Text(_text.replaceAll(new RegExp(r"\s"), "")),
          )
        ],
      )
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class EventBus {
  EventBus._construct();
}
