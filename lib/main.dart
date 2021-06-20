import 'package:flutter/material.dart';
import 'route/route.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text("App Name"),
        //   leading: Builder(builder: (context) {
        //     return IconButton(
        //       icon: Icon(Icons.dashboard, color: Colors.white), //自定义图标
        //       onPressed: () {
        //         // 打开抽屉菜单
        //         Scaffold.of(context).openDrawer();
        //       },
        //     );
        //   }),
        // ),
        body: ScaffoldRoute());
  }
}
