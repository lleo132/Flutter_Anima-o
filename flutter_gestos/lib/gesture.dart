import 'dart:math';

import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  double _top = 0;
  double _left = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: Text(widget.title),
      ),
      body: Stack(
        children: [
        Positioned(
          top: _top,
          left: _left,
          child: GestureDetector(
            onTap: () {
              debugPrint('Top == $_top Left == $_left');
            },
            onPanUpdate: (details) {
              _top = max (0, _top + details.delta.dy);
              _left = max (0, _left + details.delta.dx);
             // debugPrint('Top == $_top Left == $_left');
              setState(() {});
            },
            child: Container(
              decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.2),
              borderRadius: BorderRadius.circular(60)
              ),
              child: const Icon(Icons.sailing_outlined,
              color: Colors.black,
              size: 100,
              ),
            ),
          ),
        ),
        Positioned(
          top: 200,
          left: 100,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Material(
                  child: InkWell(
                          onTap: () {
                            debugPrint(
                              'Um Click');
                          },
                          onLongPress:() => debugPrint('Segurando'),
                          child: const MyCustomButtom(text: 'Ok', textColor: Colors.red,),
                        ),
                ),
              ),
          ),
          Positioned(
          top: 600,
          left: 100,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Material(
                  child: InkWell(
                          onTap: () {
                            debugPrint(
                              'Um Click');
                          },
                          onLongPress:() => debugPrint('Segurando'),
                          child: const MyCustomButtom(text: 'Botão Aqui', textColor: Colors.blue,),
                        ),
                ),
              ),
          ),
        ],
      ),
        );
  }
}

class MyCustomButtom extends StatelessWidget {
  final String text;
  final Color textColor;
  const MyCustomButtom({
    Key? key,
    required this.text,
    required this.textColor,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: textColor.withOpacity(0.2),
      child: Text(
      text,
      style: const TextStyle(
      fontSize: 35,
      color: Colors.red,
      height: 5,
        ),),
    );
  }
}