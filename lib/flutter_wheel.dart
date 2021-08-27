import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class Flutter_Wheel extends StatefulWidget {
  const Flutter_Wheel({Key? key}) : super(key: key);

  @override
  _Flutter_WheelState createState() => _Flutter_WheelState();
}

class _Flutter_WheelState extends State<Flutter_Wheel> {
  StreamController<int> selected = StreamController<int>();

  //final selected01 = useStreamController<int>();

  @override
  void dispose() {
    selected.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // StreamController<int> selected = StreamController<int>();
    //final selectedIndex = useStream(selected.stream, initialData: 0).data ?? 0;

    int tempIndex = 0;

    final items = <String>[
      '김기태',
      '김기준',
      '김문환',
      '김종호',
      '김지훈',
      '김한울',
      '신채원',
      '오경환',
      '이민주',
      '황성준',
      '황인국',
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Team Awesome'),
      ),
      body: GestureDetector(
        onTap: () {
          setState(
            () {
              tempIndex = Fortune.randomInt(0, items.length);
              selected.add(
                //Fortune.randomInt(0, items.length),
                tempIndex,
              );
              print("add index:  $tempIndex");
            },
          );
        },
        child: Column(
          children: [
            Expanded(
              child: FortuneWheel(
                selected: selected.stream,
                items: [
                  for (var it in items) FortuneItem(child: Text(it)),
                ],
                onAnimationEnd: () {
                  //print("value : " + "${selected}");
                  //print("Value winner : " + "${items[int.parse(selected.toString())]}");
                  print(
                      "selected index : {$tempIndex} / value : ${items[tempIndex]}");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
