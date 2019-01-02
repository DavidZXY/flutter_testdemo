import 'package:flutter/material.dart';
import 'package:tests/wave/config.dart';
import 'package:tests/wave/wave.dart';
import 'package:logging/logging.dart';

class MineRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MineRouteState();
  }
}

class _MineRouteState extends State<MineRoute>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
                color: Colors.white,
                height: 200,
                width: 100000,
                child: Stack(
                  children: <Widget>[
                    Container(
                      child: WaveWidget(
                        config: CustomConfig(
                          colors: [
                            Colors.black12,
                            Colors.black26,
                            Colors.black38,
                            Colors.black54,
                          ],
                          durations: [25000, 20000, 15000, 10000],
                          heightPercentages: [0.35, 0.36, 0.37, 0.37],
                          blur: MaskFilter.blur(BlurStyle.solid, 2),
                        ),
                        backgroundColor: Colors.transparent,
                        size: Size(double.infinity, double.infinity),
                        waveAmplitude: 3,
                      ),
                    ),
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 2),
                        ),
                        child: Icon(Icons.person_outline, size: 100),
                      ),
                    )
                  ],
                )),
            SizedBox(
              height: 12,
            ),
            Container(
              color: Colors.white,
              width: 100000,
              height: 120,
              child: Center(
                child: Wrap(
                  spacing: 48.0,
                  runSpacing: 12.0,
                  alignment: WrapAlignment.start,
                  children: <Widget>[
                    _buildButtonTitle(Icons.add_a_photo, "photo", Colors.black),
                    _buildButtonTitle(Icons.add_a_photo, "photo", Colors.black),
                    _buildButtonTitle(Icons.add_a_photo, "photo", Colors.black),
                    _buildButtonTitle(Icons.add_a_photo, "photo", Colors.black),
                    _buildButtonTitle(Icons.add_a_photo, "photo", Colors.black),
                    _buildButtonTitle(Icons.add_a_photo, "photo", Colors.black),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              color: Colors.white,
              width: 100000,
              height: 120,
              child: Center(
                child: Wrap(
                  spacing: 48.0,
                  runSpacing: 12.0,
                  alignment: WrapAlignment.start,
                  children: <Widget>[
                    _buildButtonTitle(Icons.add_a_photo, "photo", Colors.black),
                    _buildButtonTitle(Icons.add_a_photo, "photo", Colors.black),
                    _buildButtonTitle(Icons.add_a_photo, "photo", Colors.black),
                    _buildButtonTitle(Icons.add_a_photo, "photo", Colors.black),
                    _buildButtonTitle(Icons.add_a_photo, "photo", Colors.black),
                    _buildButtonTitle(Icons.add_a_photo, "photo", Colors.black),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              color: Colors.white,
              width: 100000,
              height: 120,
              child: Center(
                child: Wrap(
                  spacing: 48.0,
                  runSpacing: 12.0,
                  alignment: WrapAlignment.start,
                  children: <Widget>[
                    _buildButtonTitle(Icons.add_a_photo, "photo", Colors.black),
                    _buildButtonTitle(Icons.add_a_photo, "photo", Colors.black),
                    _buildButtonTitle(Icons.add_a_photo, "photo", Colors.black),
                    _buildButtonTitle(Icons.add_a_photo, "photo", Colors.black),
                    _buildButtonTitle(Icons.add_a_photo, "photo", Colors.black),
                    _buildButtonTitle(Icons.add_a_photo, "photo", Colors.black),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              color: Colors.white,
              width: 100000,
              height: 120,
              child: Center(
                child: Wrap(
                  spacing: 48.0,
                  runSpacing: 12.0,
                  alignment: WrapAlignment.start,
                  children: <Widget>[
                    _buildButtonTitle(Icons.add_a_photo, "photo", Colors.black),
                    _buildButtonTitle(Icons.add_a_photo, "photo", Colors.black),
                    _buildButtonTitle(Icons.add_a_photo, "photo", Colors.black),
                    _buildButtonTitle(Icons.add_a_photo, "photo", Colors.black),
                    _buildButtonTitle(Icons.add_a_photo, "photo", Colors.black),
                    _buildButtonTitle(Icons.add_a_photo, "photo", Colors.black),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

Widget _buildButtonTitle(IconData icon, String title, Color color) {
  return InkWell(
    onTap: () {
      print("asdasdasdasdasd");
    },
    child: Column(
      children: <Widget>[
        Icon(
          icon,
          color: color,
        ),
        Text(title)
      ],
    ),
  );
}
