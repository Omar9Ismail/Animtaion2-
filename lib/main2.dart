import 'package:flutter/material.dart';

class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        body: MyHomePage2(),
      ),
    );
  }
}

class MyHomePage2 extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage2>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late Animation<AlignmentGeometry> _animation;


  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
      lowerBound: 0.0,
      upperBound: 1.0,
    )..repeat(reverse: true);
    _animation =
    Tween<AlignmentGeometry>(begin: Alignment.topCenter,end:Alignment.bottomCenter).animate(CurvedAnimation(curve: Curves.linear,parent: _controller));
    // CurvedAnimation(
    //   parent: _controller,
    //   curve: Curves.linear,
    // );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white70,
        // appBar: AppBar(
        //   title: Text('Explicit'),
        // ),
        body: Center(
            child: Container(
              // height: 300,
              // width: 300,
              child: AlignTransition(
                alignment: _animation,
                child: Container(
                  width: 100.0,
                  height: 100.0,

                  decoration:BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                )
                // child: FlutterLogo(
                //   size: 100,
                // ),
              ),
            )));
  }
}
