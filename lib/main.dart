import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              _backgroundGradient(),
              _singleColorPng(),
              _gradientPng()
            ],
          ),
        ));
  }

  Container _backgroundGradient() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue, Colors.yellow],
          stops: [
            0.0,
            0.5,
          ],
        ),
      ),
      child: Image(image: AssetImage("assets/cat.png")),
    );
  }

  Image _singleColorPng() {
    return Image.asset(
      "assets/cat.png",
      color: Colors.blue,
    );
  }

  ShaderMask _gradientPng() {
    return ShaderMask(
      child: Image(
        image: AssetImage("assets/cat.png"),
      ),
      shaderCallback: (Rect bounds) {
        return LinearGradient(
          colors: [Colors.blue, Colors.yellow],
          stops: [
            0.0,
            0.5,
          ],
        ).createShader(bounds);
      },
      blendMode: BlendMode.srcATop,
    );
  }
}
