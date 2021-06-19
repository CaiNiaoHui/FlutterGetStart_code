import 'package:flutter/material.dart';

void main() => runApp(MyApp());

/// 无状态服务入口
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',

      /// 主页调用回显字符
      // home: Scaffold(
      //   appBar: AppBar(
      //     title: Text('Material App Bar'),
      //   ),
      //   body: Center(
      //     child: Container(
      //       // child: Text('Hello World'),
      //       child: Echo(text: "hello Widget?"),
      //     ),
      //   ),
      // ),

      /// 主页使用findAncestorStateOfType最近的对象
      home: Scaffold(
        appBar: AppBar(
          title: Text('子树中获取State对象'),
        ),
        body: Center(
          child: Builder(builder: (context) {
            return RaisedButton(
              onPressed: () {
                /// 查找父级最近的Scaffold对应的ScaffoldState对象
                // ScaffoldState _state =
                //     context.findAncestorStateOfType<ScaffoldState>()!;
                // //调用ScaffoldState的showSnackBar来弹出SnackBar
                // _state.showSnackBar(
                //   SnackBar(
                //     content: Text("我是SnackBar"),
                //   ),
                // );

                /// 直接通过of静态方法来获取ScaffoldState
                ScaffoldState _state = Scaffold.of(context);
                _state.showSnackBar(
                  SnackBar(
                    content: Text("我是SnackBar1"),
                  ),
                );
              },
              child: Text("显示SnackBar1"),
            );
          }),
        ),
      ),

      /// 主页应用计算器
      // home: CounterWidget(),
    );
  }
}

/// 实现了一个回显字符串
class Echo extends StatelessWidget {
  const Echo({
    Key? key,
    required this.text,
    this.backgroundColor: Colors.grey,
  }) : super(key: key);

  final String text;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: backgroundColor,
        child: Text(text),
      ),
    );
  }
}

/// 在子树中获取父级widget
class ContextRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Context测试"),
      ),
      body: Container(
        child: Builder(builder: (context) {
          // 在Widget树中向上查找最近的父级`Scaffold` widget
          Scaffold? scaffold =
              context.findAncestorWidgetOfExactType<Scaffold>();
          // 直接返回 AppBar的title， 此处实际上是Text("Context测试")
          Widget? widget1 = (scaffold!.appBar as AppBar).title;
          return widget1 ?? Container();
          // return (scaffold!.appBar as AppBar).title!;
        }),
      ),
    );
  }
}

/// 有状态的计数器
class CounterWidget extends StatefulWidget {
  const CounterWidget({Key? key, this.initValue: 0});

  final int initValue;

  @override
  _CounterWidgetState createState() => new _CounterWidgetState();
}

/// 定义_CounterWidgetState
class _CounterWidgetState extends State<CounterWidget> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    //初始化状态
    _counter = widget.initValue;
    print("initState");
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      body: Center(
        child: FlatButton(
          child: Text('$_counter'),
          //点击后计数器自增
          onPressed: () => setState(
            () => ++_counter,
          ),
        ),
      ),
    );
  }

  @override
  void didUpdateWidget(CounterWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
  }

  @override
  void deactivate() {
    super.deactivate();
    print("deactive");
  }

  @override
  void dispose() {
    super.dispose();
    print("dispose");
  }

  @override
  void reassemble() {
    super.reassemble();
    print("reassemble");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies");
  }
}
