import 'package:flutter/material.dart';
import 'package:tests/wave/config.dart';
import 'package:tests/wave/wave.dart';

class LoginRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: SafeArea(
        top: false,
        bottom: false,
        child: Form(
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
                    heightPercentages: [0.5, 0.51, 0.52, 0.52],
                    blur: MaskFilter.blur(BlurStyle.solid, 2),
                  ),
                  backgroundColor: Colors.transparent,
                  size: Size(double.infinity, double.infinity),
                  waveAmplitude: 3,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 120,
                    ),
                    Center(
                      child: Text(
                        "Flutter Demo",
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Theme(
                      child: TextFormField(
                        autofocus: true,
                        decoration: InputDecoration(
                          labelText: "account",
                          prefixIcon: Icon(Icons.person),
                        ),
                        validator: (v) {
                          return v.trim().length > 0 ? null : "null";
                        },
                      ),
                      data: ThemeData(primaryColor: Colors.black),
                    ),
                    Theme(
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: "password",
                          prefixIcon: Icon(Icons.lock),
                        ),
                        obscureText: true,
                        validator: (v) {
                          return v.trim().length > 8 ? null : "null";
                        },
                      ),
                      data: ThemeData(primaryColor: Colors.black),
                    ),
                    SizedBox(height: 100,),
                    Container(
                      width: 300,
                      child: FlatButton(
                        color: Colors.transparent,
                        highlightColor: Colors.black12,
                        splashColor: Colors.black12,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: BorderSide(width: 1)),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Login"),
                      ),
                    )
                  ],
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
