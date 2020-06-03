import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'About.dart';
import 'main.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:url_launcher/url_launcher.dart';

class Drawr extends StatefulWidget {
  @override
  _DrawrState createState() => new _DrawrState();
}

class _DrawrState extends State<Drawr> {
  bool lightTeme = false;

  void changeBrightness() {
    setState(() {
      DynamicTheme.of(context).setBrightness(
          Theme.of(context).brightness == Brightness.dark
              ? Brightness.light
              : Brightness.dark);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 2,
      child: new ListView(
        children: <Widget>[
          new UserAccountsDrawerHeader(
            accountName: new Text(
              "دليل الطاعة",
              style: TextStyle(fontFamily: "Stc"),
            ),
            accountEmail: new Text(
              "على قدر الإستطاعة",
              style: TextStyle(fontFamily: "Stc"),
            ),
            currentAccountPicture: new Image.asset(
              'assets/pic/logo.png',
              height: 100.0,
              width: 170.0,
            ),
          ),
          buildListTile(context, "قائمة الاذكار", "كل الاذكار", Icons.list,
              const Color(0xFF123456), (context) => MyHome()),
          new Divider(color: const Color(0xFF123456), height: 5, indent: 65),
          new ListTile(
            trailing: Switch(
                value: lightTeme,
                onChanged: (changed) {
                  setState(() {
                    lightTeme = changed;
                    changeBrightness();
                  });
                }),
            leading: new Icon(MdiIcons.weatherNight),
            title:
                new Text("الوضع الليلي", style: TextStyle(fontFamily: "Stc")),
          ),
          new Divider(color: Colors.green, height: 5, indent: 65),
          buildListTile(
              context,
              "الحبيب ابوبكر إبن علي المشهور",
              "مقدمة المؤلف",
              Icons.person,
              Colors.lightBlue,
              (context) => new about()),
          new Divider(color: Colors.lightBlue, height: 5, indent: 65),
          new ListTile(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return SimpleDialog(
                      contentPadding: EdgeInsets.zero,
                      children: <Widget>[
                        Image.asset(
                          "assets/pic/logoAlhabib.png",
                          fit: BoxFit.fill,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: <Widget>[
                              Text(
                                "مواقع التواصل",
                                style:
                                    TextStyle(fontSize: 18, fontFamily: "Stc"),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      buildRaisedButton(
                                          'فيس بوك',
                                          Colors.blue.shade800,
                                          MdiIcons.facebook,
                                          'https://www.facebook.com/alhabibabobakr/'),
                                      SizedBox(width: 30),
                                      buildRaisedButton(
                                          'تيليجرام',
                                          Colors.blue.shade300,
                                          MdiIcons.telegram,
                                          'http://www.T.me/alhabibabobakr'),
                                      SizedBox(width: 30),
                                      buildRaisedButton(
                                          'يوتيوب',
                                          Colors.red.shade900,
                                          MdiIcons.youtube,
                                          'https://www.youtube.com/user/alhabibabobakr'),
                                      SizedBox(width: 30),
                                      buildRaisedButton(
                                          'ساوندكلاود',
                                          Colors.deepOrange,
                                          MdiIcons.soundcloud,
                                          'https://soundcloud.com/alhbib-abobakr'),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      buildRaisedButton(
                                          'تويتر',
                                          Colors.blue,
                                          MdiIcons.twitter,
                                          'https://twitter.com/alhabibabobakr?lang=ar'),
                                      SizedBox(width: 30),
                                      buildRaisedButton(
                                          'انستجرام',
                                          Colors.purple,
                                          MdiIcons.instagram,
                                          'https://www.instagram.com/alhabibabobakr/'),
                                      SizedBox(width: 30),
                                      buildRaisedButton(
                                          'البريد',
                                          Colors.red,
                                          MdiIcons.gmail,
                                          'https://www.alhabibabobakr@gmail.com'),
                                      SizedBox(width: 30),
                                      buildRaisedButton(
                                          'الموقع',
                                          Colors.green,
                                          MdiIcons.web,
                                          'http://www.alhabibabobakr.com/'),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  });
            },
            leading: new Icon(MdiIcons.consoleNetwork, color: Colors.brown),
            subtitle: new Text(
              "نسعد بتواصلكم",
              style: TextStyle(fontFamily: "Stc"),
            ),
            title: new Text("تواصل معنا",
                style: TextStyle(color: Colors.brown, fontFamily: "Stc")),
          ),
          new Divider(color: Colors.brown, height: 5, indent: 65),
          new ListTile(
            subtitle: new Text(
              "اصدار التطبيق 1.0 دليل الطاعة",
              textAlign: TextAlign.center,
              style: TextStyle(fontFamily: "Stc"),
            ),
          ),
        ],
      ),
    );
  }
}

ListTile buildListTile(BuildContext context, String sub, String tit,
    IconData iconD, Color colr, builder) {
  return new ListTile(
    onTap: () {
      Navigator.of(context).pop();
      Navigator.push(context, new MaterialPageRoute(builder: builder));
    },
    leading: new Icon(iconD, color: colr),
    subtitle: new Text(
      sub,
      style: TextStyle(fontFamily: "Stc"),
    ),
    title: new Text(tit, style: TextStyle(color: colr, fontFamily: "Stc")),
  );
}

RaisedButton buildRaisedButton(
    String social, Color color, IconData midicon, String urlb) {
  return new RaisedButton(
    onPressed: () => launch(urlb),
    child: Row(
      children: <Widget>[
        Text(
          social,
          style:
              TextStyle(color: Colors.white, fontSize: 10, fontFamily: "Stc"),
        ),
        SizedBox(width: 2),
        Icon(midicon, color: Colors.white),
      ],
    ),
    color: color,
    splashColor: Colors.white30,
    shape: const StadiumBorder(),
  );
}
