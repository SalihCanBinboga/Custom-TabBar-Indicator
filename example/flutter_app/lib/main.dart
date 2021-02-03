import 'package:custom_tabbar_indicator/custom_tabbar_indicator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: DefaultTabController(
          length: 2,
          child: TabBar(
              indicator: CustomTabBarIndicator(
                Colors.black,
              ),
              labelPadding: EdgeInsets.all(0),
              tabs: [
                Tab(
                  icon: Icon(
                    Icons.add,
                    color: Colors.black,
                  ),
                  child: Text(
                    "Add",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.alarm,
                    color: Colors.black,
                  ),
                  child: Text(
                    "Alarm",
                    style: TextStyle(color: Colors.black),
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
