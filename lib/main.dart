import "package:flutter/material.dart";
import 'package:stepper_touch/stepper_touch.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/rendering.dart';
import 'Drawr.dart';


void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new DynamicTheme(
        defaultBrightness: Brightness.light,
        data: (brightness) => new ThemeData(
          primaryColor: const Color(0xFF0A3154),
          brightness: brightness,
        ),
        themedWidgetBuilder: (context, theme) {
          return new MaterialApp(
            title: 'دليل الطاعة',
            theme: theme,
            home: Center(
              child: new SplashScreen(
                seconds: 1,
                navigateAfterSeconds: new MyHome(),
                title: new Text(
                    'سبحتي\n'
                        'تفاعلية بسيطة ورائعة',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 30,
//                        fontFamily: "Stc",
                        color: const Color(0xFF0A3154))),
//                image: new Image.asset('assets/pic/logo.png'),
                backgroundColor: Colors.white,
                photoSize: 150.0,
              ),
            ),
          );
        });
  }
}

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  int value1=0 ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("سبحتي",style: TextStyle(
            fontFamily: "Stc")),
        centerTitle: true,
      ),
      endDrawer: Drawr(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20.0),
              child:Text("data")
//              SizedBox(
//                width: 250.0,
//                child: TextLiquidFill(
//                  text: Text("$value1",style: TextStyle(
//                      fontSize: 80)),
//                  waveColor: Colors.blueAccent,
////                  boxBackgroundColor: Colors.redAccent,
//                  textStyle: TextStyle(
//                    fontSize: 80.0,
//                    fontWeight: FontWeight.bold,
//                  ),
//                  boxHeight: 300.0,
//                ),
//              ),
            ),
            SizedBox(
              height: 100,
            ),
            Container(
              child: Center(
                child: RotatedBox(
                quarterTurns: -1,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: StepperTouch(
                        initialValue: 0,
                        onChanged: (int value) {setState(() {
                          value1=value;
                        });} ,
                      ),
                    ),
                  ],
                ),
            ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
