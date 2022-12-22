import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

   
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
         
        
         
         
         
         
         
         
         
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

   
   
   

   
   
   
   

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  double _counter = 0;

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration:  const Duration(milliseconds: 800),
      vsync: this
      );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child:AnimatedBuilder(
          builder: (context, child) {
            print('controller ${_controller.value}');
            final angle  = _controller.value * -pi;
            

            return Transform(
              filterQuality:FilterQuality.low,
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateY(angle),
              child: GestureDetector(
                onPanUpdate: (details) {
                  print(details.delta.dx);
                  print(_controller.status);
                        if (details.delta.dx < 0) {
                          if(_controller.status == AnimationStatus.completed) {
                            _controller.reverse();
                            return;
                          }
                          _controller.forward();
                          print('forward');
                        } else {
                          if(_controller.status == AnimationStatus.dismissed) {
                            _controller.forward();
                            return;
                          }
                          _controller.reverse();
                        }
                      
                    
                    
              
                },
                child: Container(
                  height: 200,
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                  color: _controller.value < 0.50 ? Colors.grey : Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(0, 0),
                      spreadRadius: 2,
                      blurRadius: 10
                    )
                  ]
                      
                  ),
                ),
              ),
            );
          }, animation: _controller,
        )
      ),
 
    );
  }
}
